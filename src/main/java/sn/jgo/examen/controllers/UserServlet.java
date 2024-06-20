package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.Auth;
import sn.jgo.examen.entities.Role;
import sn.jgo.examen.entities.User;

import javax.persistence.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", urlPatterns = "*.user")
public class UserServlet extends HttpServlet {
    private EntityManagerFactory emf;

    public void init() {
        emf = Persistence.createEntityManagerFactory("immoPU");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action = request.getParameter("action");
        int URL_ID = Integer.parseInt(request.getParameter("id"));
        EntityManager em = emf.createEntityManager();
        TypedQuery<Role> queryRoles = em.createQuery("SELECT r FROM Role r", Role.class);
        request.setAttribute("roles", queryRoles.getResultList());

        if (action.equals("add")){
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        } else if (action.equals("delete")) {

            try {
                em.getTransaction().begin();
                User u = em.find(User.class, URL_ID);
                em.remove(u);
                em.getTransaction().commit();

                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String identifiant = request.getParameter("identifiant");
        String mdp = request.getParameter("mdp");
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String action = request.getParameter("action");
        int URL_ID = Integer.parseInt(request.getParameter("id"));
        int role = Integer.parseInt(request.getParameter("role"));


        EntityManager em = emf.createEntityManager();

        TypedQuery<User> queryRoles = em.createQuery("SELECT u FROM User u", User.class);
        request.setAttribute("users", queryRoles.getResultList());

        if (action.equals("add")){
            try {
//            Role selectionner
                Role r = em.find(Role.class, role);

                User user = new User();
                user.setNom(nom);
                user.setPrenom(prenom);
                user.setIdentifiant(identifiant);
                user.setMdp(mdp);
                user.setRole(r);

                em.getTransaction().begin();
                em.persist(user);
                em.getTransaction().commit();


                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
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
