package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "DemandeServlet",urlPatterns = "*.demande")
public class DemandeServlet extends HttpServlet {
    private EntityManagerFactory emf;
    public void init() {
        emf = Persistence. createEntityManagerFactory("immoPU");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action = request.getParameter("action");

        EntityManager em = emf.createEntityManager();

        if (action.equals("add")) {
            int URL_ID_UNIT = Integer.parseInt(request.getParameter("idUnit"));

            request.setAttribute("unite", em.find(Unite.class,URL_ID_UNIT));
            request.getRequestDispatcher("demande.jsp").forward(request,response);
            return ;
        } else if (action.equals("mine")) {
            int URL_ID_DEM = Integer.parseInt(request.getParameter("id"));
            TypedQuery<Demande> queryApp = em.createQuery("SELECT d FROM Demande d WHERE demandeur.id=:dem", Demande.class);
            queryApp.setParameter("dem", URL_ID_DEM);
            List<Demande> demandes = queryApp.getResultList();
            request.setAttribute("demandes",demandes);
            request.getRequestDispatcher("mesDemandes.jsp").forward(request,response);
            return;
        }

        TypedQuery<Unite> queryApp = em.createQuery("SELECT u FROM Unite u", Unite.class);
        List<Unite> uniteList = queryApp.getResultList();
        request.setAttribute("uniteList", uniteList);
        request.getRequestDispatcher("hLocataire.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String action = request.getParameter("action");
        EntityManager em = emf.createEntityManager();
        if (action.equals("addDemande")) {
            String message = request.getParameter("message");
            int uniteId = Integer.parseInt(request.getParameter("uniteId"));
            User demandeur = em.find(User.class, Auth.getAuth().getId());
            Unite unite = em.find(Unite.class, uniteId);

            try {
                Demande demande = new Demande();
                demande.setMessage(message);
                demande.setUnite(unite);
                demande.setDemandeur(demandeur);
                demande.setStatut("En attente de paiement");
                demande.setDateDemande(LocalDateTime.now());

                em.getTransaction().begin();
                em.persist(demande);
                em.getTransaction().commit();

                EmailSender sender = new EmailSender();
                sender.sendEmail(demande.getDemandeur().getIdentifiant(),"Demande de location","<h3>Votre demande pour "+demande.getUnite().getDescription()+" est en cours de paiement.</h3>");
                TypedQuery<Unite> queryApp = em.createQuery("SELECT u FROM Unite u", Unite.class);
                List<Unite> uniteList = queryApp.getResultList();
                request.setAttribute("uniteList", uniteList);
                request.getRequestDispatcher("hLocataire.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                TypedQuery<Unite> queryApp = em.createQuery("SELECT u FROM Unite u", Unite.class);
                List<Unite> uniteList = queryApp.getResultList();
                request.setAttribute("uniteList", uniteList);
                request.getRequestDispatcher("hLocataire.jsp").forward(request, response);
            } finally {
                em.close();
            }
        }

    }

    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }
}
