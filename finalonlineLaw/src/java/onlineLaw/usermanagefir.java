package onlineLaw;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/usermanagefir")
public class usermanagefir extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param resp servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        int status = 0;
        try {
            Connection con = db.gc();
            String usermail="";
            HttpSession ses=req.getSession(false);
            String username=(String) ses.getAttribute("uname");
            PreparedStatement ps = con.prepareStatement("update fir set status=? where id=?");
            PreparedStatement ps1 = con.prepareStatement("select mail from userp where username=?");
            ps.setString(1, "withdrawn");
            ps.setString(2, id);
            ps1.setString(1,username);
            ResultSet rs=ps1.executeQuery();
            if(rs.next())
                usermail=rs.getString(1);
            status = ps.executeUpdate();
            con.close();
            if (status > 0) {
                String s = "FIR successfully withdrawn";
                userfirwithdrawn.mailer(username,id,usermail);
                req.setAttribute("firupdate", s);
                RequestDispatcher rd = req.getRequestDispatcher("filedfir.jsp");
                rd.forward(req, res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(usermanagefir.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
