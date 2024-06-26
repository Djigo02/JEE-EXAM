<%@ page import="sn.jgo.examen.entities.User" %>
<%@ page import="sn.jgo.examen.entities.Unite" %>
<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Demande</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container mt-5 col-md-5 col-xm-12 col-sm-6 col-md-offset-3">
    <div class="card">
        <div class="card-header center text-center">
            Ajouter une Demande
        </div>
        <div class="card-body">
            <form action="addDem.demande" method="post">
                <div class="form-group">
                    <label class="control-label">Message</label>
                    <textarea class="form-control" name="message" required></textarea>
                </div>
                <br>
                <input value="<%= ((Unite) request.getAttribute("unite")).getId()%>"
                       name="uniteId" type="hidden">
                <input type="hidden" name="action" value="addDemande">
                <button type="submit" class="btn btn-outline-success mx-auto col-4 offset-4">Ajouter</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
