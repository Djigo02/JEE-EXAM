package sn.jgo.examen.entities;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {

    public static void sendEmail(String to, String subject, String body) {
        final String username = "djigo@jgotechmaker.com"; // Votre adresse email
        final String password = "mouh@m@d_techmaker";    // Votre mot de passe

        // Propriétés de configuration pour la connexion au serveur SMTP
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "web58.lws-hosting.com");  // Adresse du serveur SMTP
        props.put("mail.smtp.port", "587");               // Port SMTP (465 pour SSL, 587 pour TLS)

        // Obtenir une session de messagerie avec les propriétés et les informations d'authentification
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            // Créer un message MIME
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            // Envoyer le message
            Transport.send(message);

            System.out.println("Email envoyé avec succès");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
