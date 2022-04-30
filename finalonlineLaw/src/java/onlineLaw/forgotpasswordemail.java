package onlineLaw;

import java.time.LocalDate;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class forgotpasswordemail {
    public static void mailer(String mail,String type){
        LocalDate date = LocalDate.now();
        String curdate=date.toString();
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
            msg.setSubject("Password Recovery Online Law System");
            msg.setText("To change password, please click on the given link or paste"
            + " in the URL bar: \n http://localhost:8080/finalonlineLaw/newpassword.jsp?type="+type+"&email="+mail+
                    "&curdate="+curdate);
            Transport trans = ss.getTransport("smtp");
            Transport.send(msg);

        } catch (MessagingException e) {
            System.out.println(e.getMessage());
        }
    }
}
