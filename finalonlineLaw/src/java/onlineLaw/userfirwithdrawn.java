package onlineLaw;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class userfirwithdrawn {
    public static void mailer(String username, String id, String usermail) {
        String email = "eduonline51@gmail.com";
        String pass = "eduonline!@#$";
        String opponentEmail = usermail;
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
            msg.setSubject("FIR Withdrawn");
            msg.setText("Hello "+username+"! You have withrawn you FIR with ID: "+id);
            Transport trans = ss.getTransport("smtp");
            Transport.send(msg);

        } catch (MessagingException e) {
            System.out.println(e.getMessage());
        }
    }
    
}
