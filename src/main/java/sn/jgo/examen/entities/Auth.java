package sn.jgo.examen.entities;

public class Auth {
    private static User auth;

    public Auth() {
    }

    public static User getAuth() {
        return auth;
    }

    public static void setAuth(User auth) {
        Auth.auth = auth;
    }
}
