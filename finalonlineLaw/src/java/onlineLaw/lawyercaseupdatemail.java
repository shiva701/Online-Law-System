package onlineLaw;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class lawyercaseupdatemail {

public static void mailer(String clientmail,String status,String caseid,String lname,String cname,String edate,String crime)
{
     String email = "eduonline51@gmail.com";
        String pass = "eduonline!@#$";
        String opponentEmail = clientmail;
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
            msg.setSubject("Case ID : "+caseid);
            msg.setText("Hello " + cname + "! The status of your case has been updated, the related details are mentioned below :\nClient's Name: "
                    + cname + "\nLawyer Name : " + lname + "\nCrime: " + crime + "\nExpected Date: " + edate + "\nStatus: "+status+"");
            Transport trans = ss.getTransport("smtp");
            Transport.send(msg);
        } catch (MessagingException e) {
            System.out.println(e.getMessage());
        }
}
}
