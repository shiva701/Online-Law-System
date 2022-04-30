package onlineLaw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class verifylawyer extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param res servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
         try {
            String e = req.getParameter("tid");
            Connection con = db.gc();
            PreparedStatement ps = con.prepareStatement("update lawyers set verified='yes' where temp_id=?");
            ps.setString(1, e);
            int n = ps.executeUpdate();
            con.close();
            if (n > 0) {
                String a = "Lawyer sucessfully verified!!";
                req.setAttribute("success", a);
                req.getRequestDispatcher("lawyerlogin.jsp").forward(req, res);
            }
        } catch (IOException | SQLException | ServletException e) {
            System.out.println(e);
        }
        
    } 

}
