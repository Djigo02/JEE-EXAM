<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Unite" %><%--
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
    <title>Page Locataire</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <%--  NAVBAR  --%>
    <nav class="navbar bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand ml-4">DJIMMOBILIER</a>
            <div class="d-flex">
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
        <%for (Unite u:unites){%>
        <div class="row mt-4">
            <div class="card col" style="width: 18rem;">
                <div class="card-body">
                    <h6 class="card-title mb-2">Prix de la location : <%=u.getLoyer()%> Francs CFA</h6>
                    <h6 class="card-subtitle mb-2 text-body-secondary">Superficie : <%=u.getSuperficie()%> m2</h6>
                    <p class="card-text"><%=u.getDescription()%></p>
                    <h6 class="card-subtitle mb-2 text-body-secondary">Adresse : <%=u.getImmeuble().getAdresse()%></h6>
                    <h6 class="card-subtitle mb-2 text-body-secondary">Proprietaire : <%=u.getImmeuble().getUser().getIdentifiant()%></h6>
                    <a href="updateAp.ap?action=updateAp&idUnit=<%=u.getId()%>" class="btn btn-sm btn-success">Souscrire une demande</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>

</body>
</html>
