package onlineLaw;

import java.io.IOException;
import java.sql.*;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addlawyer")
public class addlawyer extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int status = 0;
        res.setContentType("text/html");
        String name = req.getParameter("name").toLowerCase();
        String expertise = req.getParameter("expertise").toLowerCase();
        String mob = req.getParameter("mobile");
        String email = req.getParameter("email");
        String fees = req.getParameter("fees");
        String tid=getTempId();
        String password=getPass();
        status = lawyeradd.add(name, expertise, mob, email, fees,password,tid);

        if (status > 0) {
            try {
                String lawyerid="";
                Connection con=db.gc();
                PreparedStatement ps=con.prepareStatement("select lawyerid from lawyers where email=?");
                ps.setString(1,email);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                    lawyerid=rs.getString(1);
                newlawyermail.mailer(name,email,lawyerid,password,tid);
                String s = "Successfully Added";
                req.setAttribute("success", s);
                RequestDispatcher rd = req.getRequestDispatcher("addlawyer.jsp");
                rd.forward(req, res);
            } catch (SQLException ex) {
                Logger.getLogger(addlawyer.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String s = "Failure! Try Again!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("addlawyer.jsp");
            rd.forward(req, res);
        }
    }
         public String getTempId()
    {
           String s=""; 
           for(int i=1;i<=10;i++)     
           {
               Random r=new Random();
               int n=r.nextInt(91-65)+65;
               s=s+(char)n;
           }
           return s;
    }
         public String getPass(){
             String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 12) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
         }

}
