<%@ page import="sn.jgo.examen.entities.Auth" %><%--
  Created by IntelliJ IDEA.
  User: mehme
  Date: 23/06/2024
  Time: 07:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <h1>Je suis locataire</h1>
</body>
</html>
