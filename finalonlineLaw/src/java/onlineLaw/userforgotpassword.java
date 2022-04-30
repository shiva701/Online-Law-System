package onlineLaw;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/userforgotpassword")
public class userforgotpassword extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param res servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session=req.getSession();
        String email=req.getParameter("emailid");
        String type=(String)session.getAttribute("type");
        //System.out.println(type);
        if(type.equals("user")){
        try{
        Connection con=db.gc();
        PreparedStatement ps=con.prepareStatement("select mail from userp where mail=?");
        ps.setString(1,email);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            String s="Password Reset link sent to mail ID";
            req.setAttribute("success",s);
            forgotpasswordemail.mailer(email,type);
            RequestDispatcher rd=req.getRequestDispatcher("user.jsp");
            rd.forward(req,res);
        }
        else
        {
            String s="Mail ID not present in database.";
            req.setAttribute("failure",s);
            RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
            rd.forward(req,res);
        }
        }catch(SQLException e){System.out.println(e);}
    }
        else if(type.equals("lawyer"))
        {
            try{
        Connection con=db.gc();
        PreparedStatement ps=con.prepareStatement("select email from lawyers where email=?");
        ps.setString(1,email);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            String s="Password Reset link sent to mail ID";
            req.setAttribute("success",s);
            forgotpasswordemail.mailer(email,type);
            RequestDispatcher rd=req.getRequestDispatcher("lawyerlogin.jsp");
            rd.forward(req,res);
        }
        else{
            String s="Mail ID not present in database.";
            req.setAttribute("failure",s);
            RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
            rd.forward(req,res);
        }
        }catch(SQLException e){System.out.println(e);}
        }
    }
}