package onlineLaw;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class lawyerlogin extends HttpServlet {

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
        try {
            String ver="";
            String lid=req.getParameter("lid");
            String pass=req.getParameter("pwd");
            String remember=req.getParameter("remember");
            Connection con=db.gc();
            PreparedStatement ps=con.prepareStatement("select verified from lawyers where lawyerid=? and password=?");
            ps.setString(1,lid);
            ps.setString(2,pass);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
                ver=rs.getString(1);
            if(ver.equals("yes"))
            {
                HttpSession ses=req.getSession();
                ses.setAttribute("lawyer",lid);
                if(remember!=null && remember.equals("on"));
                    ses.setMaxInactiveInterval(20*60);
                RequestDispatcher rd=req.getRequestDispatcher("lawyerprofile.jsp");
                rd.forward(req,res);
            }
            else
            {
                String failure = "Username or Password incorrect or account not verified. Please try again!";
                req.setAttribute("failure", failure);
                RequestDispatcher rd = req.getRequestDispatcher("lawyerlogin.jsp");
                rd.include(req, res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(lawyerlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}