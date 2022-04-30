package onlineLaw;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendmaillawyer {

    public static void mailer(String lawyermail, String lname, String useremail, String cname, String crime, String edate) {

        String email = "eduonline51@gmail.com";
        String pass = "eduonline!@#$";
        String opponentEmail = lawyermail;
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
            msg.setSubject("User Request");
            msg.setText("Hello " + lname + "! You have got a request for a case, the related details are mentioned below :\nClient's Name: "
                    + cname + "\nEmail: " + useremail + "\nCrime: " + crime + "\nExpected Date: " + edate + "\nIf interested contact through the client's given Email Id.");
            Transport trans = ss.getTransport("smtp");
            Transport.send(msg);
        } catch (MessagingException e) {
            System.out.println(e.getMessage());
        }
    }
}
