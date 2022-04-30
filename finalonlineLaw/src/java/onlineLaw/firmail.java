package onlineLaw;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class firmail {
    public static void mailer(String usermail,String username,String victim, String against,String stat){
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
            msg.setSubject("FIR Submitted");
            msg.setText("Hello " + username + "! You have filed a FIR against : "+against+" on the date : "+new Date()+" where the victim is : "+victim+" and current status of FIR is 'submitted'.");
            Transport trans = ss.getTransport("smtp");
            Transport.send(msg);
            System.out.println("message sent");
        } catch (MessagingException e) {
            System.out.println(e.getMessage());
        }
    }
}
