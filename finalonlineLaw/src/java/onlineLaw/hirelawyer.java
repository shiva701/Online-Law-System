package onlineLaw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class hirelawyer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int status = 0;
        Connection con =null;
         String useremail = "";
        HttpSession session = req.getSession(false);
        String uname = (String) session.getAttribute("uname");
        try{
        con= db.gc();
        PreparedStatement ps1 = con.prepareStatement("select mail from userp where username=?");
        ps1.setString(1, uname);
        ResultSet rs1 = ps1.executeQuery();
        if (rs1.next()) {
                    useremail = rs1.getString(1);
                }
        con.close();
        }catch(SQLException e){System.out.println(e);}
        
        res.setContentType("text/html");
       // String cc = req.getParameter("cat");
        String lid = req.getParameter("lid");
        String lname = req.getParameter("lname").toLowerCase();
        String cname = req.getParameter("cname").toLowerCase();
        String crime = req.getParameter("crime").toLowerCase();
        String exdate = req.getParameter("date");
        String yy = exdate.substring(0, 4);
        String dd = exdate.substring(8, 10);
        String mm = exdate.substring(5, 7);
        String edate=dd+"-"+mm+"-"+yy;
        String city=req.getParameter("city").toLowerCase();
        status = lawyerhire.hirelawyer(lid,useremail,lname, cname, crime, edate,city);

        if (status > 0) {
            String lawyeremail = "";
           
            try {
                con= db.gc();
                PreparedStatement ps = con.prepareStatement("select email from lawyers where lawyerid=?");                
                ps.setString(1, lid);                
                ResultSet rs = ps.executeQuery();                
                if (rs.next()) {
                    lawyeremail = rs.getString(1);
                }               
                con.close();

            } catch (SQLException e) {
                System.out.println(e);
            }

            sendmaillawyer.mailer(lawyeremail, lname, useremail, cname, crime, edate);

            String s = "Successfully requested";
            req.setAttribute("success", s);
            RequestDispatcher rd = req.getRequestDispatcher("hirelawyer.jsp");
            rd.forward(req, res);
        } else {
            String s = "Failure! Request not filed!!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("hirelawyer.jsp");
            rd.forward(req, res);
        }
    }
}
