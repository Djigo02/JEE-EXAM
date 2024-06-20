package sn.jgo.examen.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.jgo.examen.entities.Auth;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", urlPatterns = "*.out")
public class LogoutServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        Auth.setAuth(null);
        response.sendRedirect("index.jsp");
    }
}
