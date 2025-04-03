package com.hamza.cashplus.utils;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailService {
    private final String username = "mustapha.jarmimm@gmail.com";
    private final String password = "mdsn foyy bepc oujn";
    
    public boolean sendVerificationEmail(String recipientEmail, String verificationCode) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Replace with your SMTP server
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Code de vérification pour la réinitialisation du mot de passe");
            
            String emailContent = "Bonjour,\n\n"
                + "Vous avez demandé à réinitialiser votre mot de passe. Voici votre code de vérification :\n\n"
                + verificationCode + "\n\n"
                + "Si vous n'avez pas fait cette demande, veuillez ignorer cet email.\n\n"
                + "Cordialement,\n"
                + "L'équipe CashPlus";
            
            message.setText(emailContent);
            
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}