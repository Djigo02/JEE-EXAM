<%@ page import="sn.jgo.examen.entities.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 23/06/2024
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) request.getAttribute("user");
%>
<html>
<head>
    <title>Mes informations</title>
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
            Mes informations
        </div>
        <div class="card-body">

            <form action="updateInfo.user" method="post">
                <div class="form-group">
                    <label class="control-label">Nom </label>
                    <input type="text" value="<%=user.getNom()%>" class="form-control" name="nom">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Prenom </label>
                    <input type="text" value="<%=user.getPrenom()%>" class="form-control" name="prenom">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Identifiant </label>
                    <input type="text" class="form-control" value="<%=user.getIdentifiant()%>" name="identifiant">
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Mot de passe </label>
                    <input type="text" class="form-control" value="<%=User.decrypt(user.getMdp())%>" name="mdp">
                </div>
                <br>
                <br>
                <input type="hidden" name="action" value="updateInfo">
                <input type="hidden" name="idL" value="<%=user.getId()%>">
                <button type="submit" class="btn btn-outline-info mx-auto col-4 offset-4">Enregistrer</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
