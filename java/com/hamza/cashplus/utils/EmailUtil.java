package com.hamza.cashplus.utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Random;


public class EmailUtil {
    public static void sendVerificationEmail(String recipientEmail, String verificationLink) {
        String from = "";  // Replace with your email
        String host = "smtp.gmail.com";  // Replace with your SMTP server

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("", ""); // Replace with credentials
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Email Verification");
            message.setText("Click the link to verify your email: " + verificationLink);

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    // Generate a random 6-digit verification code
    public static String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // Generates a 6-digit code
        return String.valueOf(code);
    }

    // Send the verification email with the 6-digit code
    public static void sendEmail(String recipientEmail, String verificationCode) {
        String from = "";  // Replace with your email
        String host = "smtp.gmail.com";  // Replace with your SMTP server

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("", ""); // Replace with credentials
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Code de vérification");
            message.setText("Votre code de vérification pour réinitialiser votre mot de passe est : " + verificationCode);

            Transport.send(message);

            // Optionally, store the verification code in a session or database
            // This can be used to verify the entered code later (if needed in servlet)
            System.out.println("Verification code sent: " + verificationCode);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
