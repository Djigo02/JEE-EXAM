<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Unite" %>
<%@ page import="sn.jgo.examen.entities.Demande" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 23/06/2024
  Time: 07:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% List<Unite> unites = (List<Unite>)request.getAttribute("uniteList"); %>

<html>
<head>
    <title>Liste de mes demandes</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%--  NAVBAR  --%>
    <nav class="navbar bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand ml-4">DJIMMOBILIER</a>
            <div class="d-flex">
                <form method="get" action="mine.demande">
                    <input name="action" value="mine" type="hidden">
                    <input name="id" value="<%=Auth.getAuth().getId() %>" type="hidden">
                    <button type="submit" class="btn btn-outline-primary">Mes Demandes</button>
                </form>
<%--                <a class="col btn btn-outline-info" href="updateInfo.user?action=mesinfos&id=<%=Auth.getAuth().getId() %>">Mes informations</a>--%>
                <form method="get" action="updateInfo.user">
                    <input name="action" value="mesinfos" type="hidden">
                    <input name="id" value="<%=Auth.getAuth().getId() %>" type="hidden">
                    <button type="submit" class="btn btn-outline-info">Mes informations</button>
                </form>
                <form method="get" action="Logout.out">
                    <button type="submit" class="btn btn-outline-danger">Se deconnecter</button>
                </form>
            </div>
        </div>
    </nav>
    <%--  NAVBAR END --%>
    <div class="container">
        <% List<Demande> demandes = (List<Demande>) request.getAttribute("demandes"); %>
        <h3 class="h3 text-center text-uppercase mt-2">Listes de mes demandes</h3>
        <% for (Demande d : demandes) { %>
        <div class="row mt-4">
            <div class="card col" style="width: 18rem;">
                <div class="card-body">
                    <p class="card-title mb-2">Appartement : <%= d.getUnite().getDescription() %></p>
                    <p class="card-subtitle mb-2 text-body-secondary">Superficie : <%= d.getUnite().getSuperficie() %> m²</p>
                    <p class="card-subtitle mb-2 text-body-secondary">Loyer : <%= d.getUnite().getLoyer() %> Francs CFA</p>
                    <p class="card-text">Message : <em><%= d.getMessage() %></em></p>
                    <p class="card-subtitle mb-2 text-body-secondary">Statut : <%= d.getStatut() %></p>
                    <h6 class="card-subtitle mb-2 text-body-secondary">Propriétaire : <%= d.getUnite().getImmeuble().getUser().getIdentifiant() %></h6>
<%--                    <% if ("En attente de paiement".equals(d.getStatut())) { %>--%>
<%--                    <a href="validerPaiement?demandeId=<%= d.getId() %>" class="btn btn-sm btn-success">Valider Paiement</a>--%>
<%--                    <a href="refuserPaiement?demandeId=<%= d.getId() %>" class="btn btn-sm btn-danger">Refuser Paiement</a>--%>
<%--                    <% } %>--%>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
