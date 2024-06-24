<%@ page import="sn.jgo.examen.entities.Auth" %>
<%@ page import="sn.jgo.examen.entities.User" %>
<%@ page import="sn.jgo.examen.entities.Immeuble" %>
<%@ page import="java.util.List" %><%--
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
    <div class="container">
        <a href="addImmeuble.bat?action=addImmeuble" class="float-end btn btn-sm btn-success">Ajouter un batiment</a>
        <div class="h3">Liste de mes immeubles</div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Description</th>
                <th scope="col">Adresse</th>
                <th scope="col">Proprietaire</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (Immeuble immeuble : (List<Immeuble>) request.getAttribute("immeubles")){%>
            <tr>
                <th scope="row"><%=immeuble.getId()%></th>
                <td><%=immeuble.getDescription()%></td>
                <td><%=immeuble.getAdresse()%></td>
                <td><%=immeuble.getUser().getPrenom()%> <%=immeuble.getUser().getNom()%></td>
                <td class="d-flex justify-content-between">
                    <a href="" class="btn btn-sm btn-warning" title="Voir appartement">👀</a>
                    <a href="" class="btn btn-sm btn-warning" title="Modifier">🖌</a>
                    <a href="" class="btn btn-sm btn-danger" title="Supprimer">❌</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
