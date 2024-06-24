<%@ page import="sn.jgo.examen.entities.User" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Auth" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 24/06/2024
  Time: 02:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un immeuble</title>
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

<div class="container mt-5 col-md-5 col-xm-12 col-sm-6 col-md-offset-3">
    <div class="card">
        <div class="card-header center text-center">
            Ajouter un utilisateur
        </div>
        <div class="card-body">

            <form action="addI.bat" method="post">
                <div class="form-group">
                    <label class="control-label">Nom </label>
                    <input type="text" class="form-control" name="nom">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Adresse </label>
                    <input type="text" class="form-control" name="adresse">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Description </label>
                    <input type="text" class="form-control" name="description">
                </div>
                <br>
                <br>
                <div class="form-group">
                    <label class="control-label">Proprietaire </label>
                    <input type="text" class="form-control" value="<%=Auth.getAuth().getPrenom()%> <%=Auth.getAuth().getNom()%>" disabled>
                </div>
                <br>
                <input type="hidden" name="action" value="add">
                <button type="submit" class="btn btn-outline-success mx-auto col-4 offset-4">Ajouter</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
