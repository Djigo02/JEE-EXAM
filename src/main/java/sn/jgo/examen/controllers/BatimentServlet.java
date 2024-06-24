package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.Auth;
import sn.jgo.examen.entities.Immeuble;
import sn.jgo.examen.entities.Role;
import sn.jgo.examen.entities.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BatimentServlet", urlPatterns = "*.bat")
public class BatimentServlet extends HttpServlet {
    private EntityManagerFactory emf;

    public void init() {
        emf = Persistence.createEntityManagerFactory("immoPU");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action = request.getParameter("action");
        EntityManager em = emf.createEntityManager();
//        TypedQuery<Role> queryRoles = em.createQuery("SELECT r FROM Role r", Role.class);
//        request.setAttribute("roles", queryRoles.getResultList());

        if (action.equals("addImmeuble")){
            // Afficher le formulaire d'ajout immeuble
            request.getRequestDispatcher("addImmeuble.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int URL_ID = Integer.parseInt(request.getParameter("id"));
            // Supprimer un utilisateur
            try {
                em.getTransaction().begin();


                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();

            }
        } else if (action.equals("update")) {

            request.getRequestDispatcher("updateUser.jsp").forward(request, response);
        }
        else if (action.equals("mesinfos")) {

            request.getRequestDispatcher("updateUserInfo.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String adresse = request.getParameter("adresse");
        String description = request.getParameter("description");
        String nom = request.getParameter("nom");
        String action = request.getParameter("action");

        EntityManager em = emf.createEntityManager();
        if (action.equals("add")){
            User proprio = em.find(User.class, Auth.getAuth().getId());
            try {
                Immeuble immeuble = new Immeuble();
                immeuble.setAdresse(adresse);
                immeuble.setDescription(description);
                immeuble.setNom(nom);
                immeuble.setUser(proprio);

                em.getTransaction().begin();
                em.persist(immeuble);
                em.getTransaction().commit();

                TypedQuery<Immeuble> queryImmProprio = em.createQuery("SELECT i FROM Immeuble i WHERE i.user = :user", Immeuble.class);
                queryImmProprio.setParameter("user",em.find(User.class,Auth.getAuth().getId()));
                request.setAttribute("immeubles", queryImmProprio.getResultList());
                request.getRequestDispatcher("hProprio.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("hProprio.jsp").forward(request, response);
            } finally {
                em.close();
            }
        } else if (action.equals("update")) {
            int URL_ID = Integer.parseInt(request.getParameter("id"));
            int role = Integer.parseInt(request.getParameter("role"));
            try {


            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
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
