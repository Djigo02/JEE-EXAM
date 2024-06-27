<%@ page import="sn.jgo.examen.entities.User" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="sn.jgo.examen.entities.Immeuble" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 24/06/2024
  Time: 02:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Immeuble immeuble = (Immeuble) request.getAttribute("immeuble");%>
<html>
<head>
    <title>Ajouter un appartement</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
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

<div class="container mt-5 col-md-5 col-xm-12 col-sm-6 col-md-offset-3">
    <div class="card">
        <div class="card-header center text-center">
            Ajouter une unité
        </div>
        <div class="card-body">

            <form action="addUnite.ap" method="post">
                <div class="form-group">
                    <label class="control-label">Superficie (m²)</label>
                    <input type="number" step="1" class="form-control" name="superficie" required>
                </div>
                <br>
                <input type="hidden" name="idBat" value="<%=immeuble.getId()%>">
                <div class="form-group">
                    <label class="control-label">Description</label>
                    <input type="text" class="form-control" name="description" required>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Loyer (CFA)</label>
                    <input type="number" class="form-control" name="loyer" required>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Immeuble</label>
                    <input disabled name="immeuble" value="<%=immeuble.getNom()%>">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Propriétaire</label>
                    <input type="text" class="form-control" value="<%= Auth.getAuth().getPrenom() %> <%= Auth.getAuth().getNom() %>" disabled>
                </div>
                <br>
                <input type="hidden" name="action" value="addUnite">
                <button type="submit" class="btn btn-outline-success mx-auto col-4 offset-4">Ajouter</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
