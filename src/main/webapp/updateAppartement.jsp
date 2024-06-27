<%@ page import="sn.jgo.examen.entities.User" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="sn.jgo.examen.entities.Immeuble" %>
<%@ page import="sn.jgo.examen.entities.Unite" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Unite unite = (Unite) request.getAttribute("unite"); %>
<html>
<head>
    <title>Mise à jour d'une unité</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%-- NAVBAR --%>
<nav class="navbar bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand ml-4">DJIMMOBILIER</a>
        <form method="get" action="Logout.out">
            <button type="submit" class="btn btn-outline-danger">Se déconnecter</button>
        </form>
    </div>
</nav>
<%-- NAVBAR END --%>

<div class="container mt-5 col-md-5 col-xm-12 col-sm-6 col-md-offset-3">
    <div class="card">
        <div class="card-header center text-center">
            Mise à jour d'une unité
        </div>
        <div class="card-body">
            <form action="updateUnite.ap" method="post">
                <div class="form-group">
                    <label class="control-label">Superficie (m²)</label>
                    <input type="number" step="1" class="form-control" name="superficie" value="<%= unite.getSuperficie() %>" required>
                </div>
                <br>
                <input type="hidden" name="idUnite" value="<%= unite.getId() %>">
                <div class="form-group">
                    <label class="control-label">Description</label>
                    <input type="text" class="form-control" name="description" value="<%= unite.getDescription() %>" required>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Loyer (CFA)</label>
                    <input type="number" class="form-control" name="loyer" value="<%= unite.getLoyer() %>" required>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Immeuble</label>
                    <input type="text" class="form-control" value="<%= unite.getImmeuble().getNom() %>" disabled>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label">Propriétaire</label>
                    <input type="text" class="form-control" value="<%= Auth.getAuth().getPrenom() %> <%= Auth.getAuth().getNom() %>" disabled>
                </div>
                <br>
                <input type="hidden" name="action" value="updateUnite">
                <button type="submit" class="btn btn-outline-success mx-auto col-4 offset-4">Enregistrer</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
