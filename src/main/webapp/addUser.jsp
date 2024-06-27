<%@ page import="sn.jgo.examen.entities.Role" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 23/06/2024
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajout Utilisateur</title>
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
            Ajouter un utilisateur
        </div>
        <div class="card-body">

            <form action="add.user" method="post">
                <div class="form-group">
                    <label class="control-label">Nom </label>
                    <input type="text" class="form-control" name="nom">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Prenom </label>
                    <input type="text" class="form-control" name="prenom">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Identifiant </label>
                    <input type="text" class="form-control" name="identifiant">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Mot de passe </label>
                    <input type="text" class="form-control" name="mdp">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Role </label>
                    <label>
                        <select class="form-control" name="role">
                            <option>Veuillez selectionnez un role</option>
                            <% for (Role role : (List<Role>) request.getAttribute("roles") ){ %>
                            <option value="<%=role.getId()%>"><%=role.getNom()%></option>
                            <% }%>
                        </select>
                    </label>
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
