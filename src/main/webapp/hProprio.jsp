<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="sn.jgo.examen.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 21/06/2024
  Time: 00:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (Auth.getAuth()==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>Page proprio</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <%--  NAVBAR  --%>
    <nav class="navbar bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand ml-4">DJIMMOBILIER</a>
            <form method="get" action="Logout.out">
                <button type="submit" class="btn btn-outline-danger">Se deconnecter</button>
            </form>
        </div>
    </nav>
    <%--  NAVBAR END --%>
    <marquee>Bienvenue <em><%= Auth.getAuth().getPrenom()%> <%=Auth.getAuth().getNom()%></em> </marquee>
    <p>Je suis content d'etre proprietaire</p>
</body>
</html>
