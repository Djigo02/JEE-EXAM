package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.Auth;
import sn.jgo.examen.entities.Immeuble;
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
        int URL_ID_BAT = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        Immeuble immeuble = em.find(Immeuble.class, URL_ID_BAT);
        request.setAttribute("immeuble",immeuble);

        if(action.equals("getaddAP")){
            //Afficher le formulaire d'ajout d'appartement

            request.getRequestDispatcher("addAppartement.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

    }

    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }

}
