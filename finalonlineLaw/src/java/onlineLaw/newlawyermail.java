package onlineLaw;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class newlawyermail {
    public static void mailer(String lawyername,String mail, String lawyerid, String password, String tid){
    String email = "eduonline51@gmail.com";
        String pass = "eduonline!@#$";
        String opponentEmail = mail;
        Properties pro = new Properties();
        pro.put("mail.smtp.host", "smtp.gmail.com");
        pro.put("mail.smtp.starttls.enable", "true");
        pro.put("mail.smtp.auth", "true");
        pro.put("mail.smtp.port", "587");
        Session ss = Session.getInstance(pro, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, pass);
            }
        });
        try {
            Message msg = new MimeMessage(ss);
            msg.setFrom(new InternetAddress(email));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(opponentEmail));
            msg.setSubject("Welcome to Online Law System");
            msg.setText("Hello "+lawyername+"! Your LAWYER ID: " + lawyerid + " and password is: " + password + " \nYou are registered as a lawyer in our online system. To get started,you need to verify yourself. Please click or copy paste the given link http://localhost:8080/finalonlineLaw/verifylawyer?tid=" + tid);
            Transport trans = ss.getTransport("smtp");
            Transport.send(msg);

        } catch (MessagingException e) {
            System.out.println(e.getMessage());
        }
}
}
