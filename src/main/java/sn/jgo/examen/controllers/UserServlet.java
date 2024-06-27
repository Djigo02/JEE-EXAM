package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.Auth;
import sn.jgo.examen.entities.Role;
import sn.jgo.examen.entities.Unite;
import sn.jgo.examen.entities.User;

import javax.persistence.*;
import java.io.IOException;
import java.util.List;

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
        EntityManager em = emf.createEntityManager();
        TypedQuery<Role> queryRoles = em.createQuery("SELECT r FROM Role r", Role.class);
        request.setAttribute("roles", queryRoles.getResultList());

        if (action.equals("add")){
            // Afficher le formulaire d'ajout
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int URL_ID = Integer.parseInt(request.getParameter("id"));
            // Supprimer un utilisateur
            try {
                em.getTransaction().begin();
                User u = em.find(User.class, URL_ID);
                em.remove(u);
                em.getTransaction().commit();
                TypedQuery<User> queryUsers = em.createQuery("SELECT u FROM User u", User.class);
                request.setAttribute("users", queryUsers.getResultList());
                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();

            }
        } else if (action.equals("update")) {
            int URL_ID = Integer.parseInt(request.getParameter("id"));
            User user = em.find(User.class, URL_ID);
            request.setAttribute("user", user);
            request.getRequestDispatcher("updateUser.jsp").forward(request, response);
        }
        else if (action.equals("mesinfos")) {
            int URL_ID = Integer.parseInt(request.getParameter("id"));
            User user = em.find(User.class, URL_ID);
            request.setAttribute("user", user);
            request.getRequestDispatcher("updateUserInfo.jsp").forward(request, response);
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

        EntityManager em = emf.createEntityManager();
        if (action.equals("add")){
            int role = Integer.parseInt(request.getParameter("role"));
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

                // Ajout et affichage de la liste des users
                TypedQuery<User> queryUsers = em.createQuery("SELECT u FROM User u", User.class);
                request.setAttribute("users", queryUsers.getResultList());
                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("hAdmin.jsp").forward(request, response);
            } finally {
                em.close();
            }
        } else if (action.equals("updateInfo")) {
//            Pour modifier les informations du locataire
            int URL_ID = Integer.parseInt(request.getParameter("idL"));
            try {
                // Récupération de l'utilisateur existant par identifiant
                User user = em.find(User.class, URL_ID);

                if (user != null) {
                    // Mise à jour des champs de l'utilisateur
                    user.setNom(nom);
                    user.setPrenom(prenom);
                    user.setIdentifiant(identifiant);
                    user.setMdp(mdp);
                    // Transaction pour la mise à jour de l'utilisateur
                    em.getTransaction().begin();
                    em.merge(user);
                    em.getTransaction().commit();
                }
                TypedQuery<Unite> queryApp = em.createQuery("SELECT u FROM Unite u", Unite.class);
                List<Unite> uniteList = queryApp.getResultList();
                request.setAttribute("uniteList", uniteList);
                request.getRequestDispatcher("hLocataire.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.getRequestDispatcher("hLocataire.jsp").forward(request, response);
            } finally {
                em.close();
            }
        } else if (action.equals("update")) {
            int URL_ID = Integer.parseInt(request.getParameter("id"));
            int role = Integer.parseInt(request.getParameter("role"));
            try {
                // Récupération de l'utilisateur existant par identifiant
                User user = em.find(User.class, URL_ID);

                if (user != null) {
                    // Mise à jour des champs de l'utilisateur
                    user.setNom(nom);
                    user.setPrenom(prenom);
                    user.setIdentifiant(identifiant);
                    Role r = em.find(Role.class, role);
                    user.setRole(r);

                    // Transaction pour la mise à jour de l'utilisateur
                    em.getTransaction().begin();
                    em.merge(user);
                    em.getTransaction().commit();
                }
                // Affichage de la liste des utilisateurs
                TypedQuery<User> queryUsers = em.createQuery("SELECT u FROM User u", User.class);
                request.setAttribute("users", queryUsers.getResultList());
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
