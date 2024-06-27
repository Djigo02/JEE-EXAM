<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Djimmobilier examen JEE 2024</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body style="width: 100vw; height: 100vh; display: flex; justify-content: center; align-items: center" class="bg-white">
  <div class="container">
    <%
      Boolean validateLogin = (Boolean) request.getAttribute("validateLogin");
      if (validateLogin != null && !validateLogin) {
    %>
    <p class="col-6 offset-3 mt-5 text-danger text-center">Identifiant ou mot de passe incorrect</p>
    <% }
    %>

<%--    <div class="card col-4 offset-4 mt-5 border border-1">--%>
<%--      <div class="card-header text-center h6 bg-light">Connexion</div>--%>
<%--      <div class="card-body">--%>
<%--        <form method="post" action="login.log">--%>
<%--          <div class="mt-3">--%>
<%--            <label>Identifiant</label>--%>
<%--            <input class="form-control" type="text" placeholder="Identifiant" name="identifiant">--%>
<%--          </div>--%>

<%--          <div class="mt-3">--%>
<%--            <label>Mot de passe</label>--%>
<%--            <input class="form-control" type="password" placeholder="Mot de passe" name="mdp">--%>
<%--          </div>--%>
<%--          <button type="submit" class="btn btn-sm btn-success col-4 mt-3 offset-4">Se connecter</button>--%>
<%--        </form>--%>

<%--      </div>--%>
<%--    </div>--%>

    <div class="container-login100">
      <div class="wrap-login100 p-6">
        <form class="login100-form validate-form" method="post" action="login.log">
          <span class="login100-form-title pb-5"> DJIMMOBILIER </span>
          <div class="panel panel-primary">
            <div class="panel-body tabs-menu-body p-0 pt-5">
              <div class="tab-content">
                <div class="tab-pane active" id="tab5">
                  <div
                          class="wrap-input100 validate-input input-group"
                          data-bs-validate="Valid email is required: ex@abc.xyz"
                  >
                    <a
                            href="javascript:void(0)"
                            class="input-group-text bg-white text-muted"
                    >
                      <i
                              class="zmdi zmdi-email text-muted"
                              aria-hidden="true"
                      ></i>
                    </a>
                    <input
                            class="input100 border-start-0 form-control ms-0"
                            type="text" required
                            placeholder="Identifiant" name="identifiant"
                    />
                  </div>
                  <div
                          class="wrap-input100 validate-input input-group"
                          id="Password-toggle"
                  >
                    <a
                            href="javascript:void(0)"
                            class="input-group-text bg-white text-muted"
                    >
                      <i
                              class="zmdi zmdi-eye text-muted"
                              aria-hidden="true"
                      ></i>
                    </a>
                    <input
                            required
                            class="input100 border-start-0 form-control ms-0"
                            type="password"
                            placeholder="Mot de passe" name="mdp"
                    />
                  </div>

                  <div class="container-login100-form-btn">
                    <button
                            href="index.html"
                            class="login100-form-btn btn-primary"
                            type="submit"
                    >
                      Connexion
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>

  </div>
</body>
</html>