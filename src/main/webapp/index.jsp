<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Djimmobilier examen JEE 2024</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-white">
  <div class="container">
    <%
      Boolean validateLogin = (Boolean) request.getAttribute("validateLogin");
      if (validateLogin != null && !validateLogin) {
    %>
      <div class="col-6 offset-3 mt-5 text-danger text-center h3">Identifiant ou mot de passe incorrect</div>
    <% }
    %>
    <div class="card col-6 offset-3 mt-5 border border-1">
      <div class="card-header text-center h2 bg-light">Connexion</div>
      <div class="card-body">
        <form method="post" action="login.log">
          <div class="mt-3">
            <label>Identifiant</label>
            <input class="form-control" type="text" placeholder="Identifiant" name="identifiant">
          </div>
          <div class="mt-3">
            <label>Mot de passe</label>
            <input class="form-control" type="password" placeholder="Mot de passe" name="mdp">
          </div>
          <button type="submit" class="btn btn-success col-4 mt-3 offset-4">Se connecter</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>