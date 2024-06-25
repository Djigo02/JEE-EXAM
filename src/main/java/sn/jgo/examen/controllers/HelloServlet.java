package sn.jgo.examen.controllers;

import java.io.*;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sn.jgo.examen.entities.*;

import javax.persistence.*;

// Le servlet pour le login
@WebServlet(name = "HelloServlet", urlPatterns = {"*.log"})
public class HelloServlet extends HttpServlet {
    private EntityManagerFactory emf;

    public void init() {
        emf = Persistence. createEntityManagerFactory("immoPU");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String identifiant = request.getParameter("identifiant");
        String mdp = request.getParameter("mdp");

        EntityManager em = emf.createEntityManager();

        try {
            String sql = "SELECT u FROM User u WHERE u.identifiant = :identifiant";
            TypedQuery<User> query = em.createQuery(sql, User.class);
            query.setParameter("identifiant", identifiant);

            User user = null;
            try {
                user = query.setMaxResults(1).getSingleResult();
            } catch (NoResultException nre) {
                // Aucun utilisateur trouvé, continuer pour afficher l'erreur de connexion
                nre.printStackTrace();
            }

            // Si un utilisateur est trouvé, redirigez vers la page de bienvenue
            if (user != null && User.decrypt(user.getMdp()).equals(mdp)) {
                Auth.setAuth(user);
                switch (user.getRole().getId()){
                    case 1:
                        TypedQuery<User> queryRoles = em.createQuery("SELECT u FROM User u", User.class);
                        request.setAttribute("users", queryRoles.getResultList());
                        request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
                        break;
                    case 2:
                        TypedQuery<Immeuble> queryImmProprio = em.createQuery("SELECT i FROM Immeuble i WHERE i.user = :user", Immeuble.class);
                        queryImmProprio.setParameter("user",em.find(User.class,Auth.getAuth().getId()));
                        request.setAttribute("immeubles", queryImmProprio.getResultList());
                        request.getRequestDispatcher("hProprio.jsp").forward(request, response);
                        break;
                    case 3:
                        TypedQuery<Unite> queryApp = em.createQuery("SELECT u FROM Unite u", Unite.class);
                        List<Unite> uniteList = queryApp.getResultList();
                        request.setAttribute("uniteList", uniteList);
                        request.getRequestDispatcher("hLocataire.jsp").forward(request, response);
                        break;
                    default:
                        request.setAttribute("validateLogin", false);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("validateLogin", false);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("validateLogin", false);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }
}
