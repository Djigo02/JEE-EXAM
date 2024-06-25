package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.Auth;
import sn.jgo.examen.entities.Immeuble;
import sn.jgo.examen.entities.Unite;
import sn.jgo.examen.entities.User;

import javax.persistence.*;
import java.io.IOException;

@WebServlet(name = "AppartementServlet", urlPatterns = "*.ap")
public class AppartementServlet extends HttpServlet {

    private EntityManagerFactory emf;

    public void init() {
        emf = Persistence. createEntityManagerFactory("immoPU");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        EntityManager em = emf.createEntityManager();

        String action = request.getParameter("action");

        if(action.equals("getaddAP")){
            int URL_ID_BAT = Integer.parseInt(request.getParameter("id"));
            Immeuble immeuble = em.find(Immeuble.class, URL_ID_BAT);
            request.setAttribute("immeuble",immeuble);
            //Afficher le formulaire d'ajout d'appartement

            request.getRequestDispatcher("addAppartement.jsp").forward(request, response);
        } else if (action.equals("updateAp")) {
            int URL_ID_UNIT = Integer.parseInt(request.getParameter("idUnit"));
            Unite unite = em.find(Unite.class, URL_ID_UNIT);
            request.setAttribute("unite",unite);
            request.getRequestDispatcher("updateAppartement.jsp").forward(request, response);
        }else if (action.equals("deleteUnite")) {
            int URL_ID_UNITE = Integer.parseInt(request.getParameter("idUnit"));
            // Supprimer une unité
            try {
                em.getTransaction().begin();
                Unite unite = em.find(Unite.class, URL_ID_UNITE);
                if (unite != null) {
                    em.remove(unite);
                    em.getTransaction().commit();
                }

                assert unite != null;
                Immeuble immeuble = unite.getImmeuble();
                request.setAttribute("immeuble", immeuble);
                request.getRequestDispatcher("appartement.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("appartement.jsp").forward(request, response);
            } finally {
                em.close();
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        EntityManager em = emf.createEntityManager();
        String action = request.getParameter("action");
        int loyer = Integer.parseInt(request.getParameter("loyer"));
        int superficie = Integer.parseInt(request.getParameter("superficie"));
        String description = request.getParameter("description");

        if(action.equals("addUnite")){
            int URL_ID_BAT = Integer.parseInt(request.getParameter("idBat"));
            Immeuble im = em.find(Immeuble.class, URL_ID_BAT);
            request.setAttribute("immeuble",im);
            try {
                Unite unite = new Unite();
                unite.setDescription(description);
                unite.setLoyer(loyer);
                unite.setSuperficie(superficie);
                unite.setImmeuble(im);

                em.getTransaction().begin();
                em.persist(unite);
                em.getTransaction().commit();

                Immeuble immeuble = em.find(Immeuble.class, URL_ID_BAT);
                request.setAttribute("immeuble",immeuble);
                request.getRequestDispatcher("appartement.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("appartement.jsp").forward(request, response);
            } finally {
                em.close();
            }
        }else if (action.equals("updateUnite")) {
            int URL_ID_UNITE = Integer.parseInt(request.getParameter("idUnite"));
            try {
                Unite unite = em.find(Unite.class, URL_ID_UNITE);

                if (unite != null) {
                    unite.setDescription(description);
                    unite.setLoyer(loyer);
                    unite.setSuperficie(superficie);
                    // Transaction pour la mise à jour de l'unité
                    em.getTransaction().begin();
                    em.merge(unite);
                    em.getTransaction().commit();
                }

                Immeuble immeuble = unite.getImmeuble();
                request.setAttribute("immeuble", immeuble);
                request.getRequestDispatcher("appartement.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("appartement.jsp").forward(request, response);
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
