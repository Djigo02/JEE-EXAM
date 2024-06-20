<%@ page import="java.util.List" %>
<%@ page import="sn.jgo.examen.entities.Role" %>
<%@ page import="sn.jgo.examen.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 23/06/2024
  Time: 07:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Page admin</title>
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
        <div  class="float-end mt-3 mb-2">
            <form action="addG.user" method="get">
                <input name="action" value="add" type="hidden">
                <button type="submit" class="btn btn-sm btn-outline-success mx-auto">Ajouter un utilisateur</button>
            </form>
        </div>
    </div>
    <div class="container mt-5 col-md-5 col-xm-12 col-sm-6 col-md-offset-3">

        <div class="card">
            <div class="card-header center text-center">
                Liste des utilisateurs
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Identifiant</th>
                        <th scope="col">Nom Complet</th>
                        <th scope="col">Role</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (User user : (List<User>)request.getAttribute("users")) {%>
                    <tr>
                        <th scope="row"><%=user.getId()%></th>
                        <td><%=user.getIdentifiant()%></td>
                        <td><%=user.getPrenom()%> <%=user.getNom()%></td>
                        <td><%=user.getRole().getNom()%></td>
                        <td class="d-flex justify-content-between">
                            <a href="update.user?action=update&id=<%= user.getId() %>" class="btn btn-sm btn-warning">🖌</a>
                            <a href="delete.user?action=delete&id=<%= user.getId() %>" class="btn btn-sm btn-danger">❌</a>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
