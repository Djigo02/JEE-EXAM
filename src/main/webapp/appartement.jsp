<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="sn.jgo.examen.entities.User" %>
<%@ page import="sn.jgo.examen.entities.Immeuble" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Unite" %><%--
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

    Immeuble immeuble = (Immeuble)request.getAttribute("immeuble");

%>
<html>
<head>
    <title>Page appartements</title>
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
<div class="container">
    <a href="addAp.ap?action=getaddAP&id=<%=immeuble.getId()%>" class="float-end btn btn-sm btn-success">Ajouter un appartement</a>
    <div class="h3">Liste des appartements de l'immeuble <%=immeuble.getNom()%></div>
    <%for (Unite u : immeuble.getUnites()){%>
    <div class="row mt-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h6 class="card-title mb-2">Prix de la location : <%=u.getLoyer()%> Francs CFA</h6>
                <h6 class="card-subtitle mb-2 text-body-secondary">Superficie : <%=u.getSuperficie()%> m2</h6>
                <p class="card-text"><%=u.getDescription()%></p>
                <a href="" class="card-link">Modifier</a>
                <a href="" class="card-link">Supprimer</a>
            </div>
        </div>
    </div>
    <%}%>
</div>
</body>
</html>
