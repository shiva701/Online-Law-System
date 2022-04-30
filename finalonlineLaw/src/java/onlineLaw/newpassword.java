package onlineLaw;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "newpassword", urlPatterns = {"/newpassword"})
public class newpassword extends HttpServlet {
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
        Connection con=db.gc();
        int status=0;
        PreparedStatement ps=null;
        HttpSession ses=req.getSession();
        String type1=(String)ses.getAttribute("type1");
        String email=(String)ses.getAttribute("email");
        String linkdate=(String)ses.getAttribute("linkdate");
        LocalDate date=LocalDate.now();
        String curdate=date.toString();
        String linkdatedd=linkdate.substring(8,10);
        
        String curdatedd=curdate.substring(8, 10);
        String pwd=req.getParameter("pwd");
        String cpwd=req.getParameter("cpwd");
        if(type1.equals("user"))
        {
            if(linkdatedd.equals(curdatedd))
            {
                try{
                ps=con.prepareStatement("update userp set password=? where mail=?");
                ps.setString(1,pwd);
                ps.setString(2,email);
                status=ps.executeUpdate();
                if(status>0)
                {
                    String s = "Password successfully changed";
                    req.setAttribute("success", s);
                    RequestDispatcher rd = req.getRequestDispatcher("user.jsp");
                    rd.forward(req, res);
                }
                }catch(SQLException e){System.out.println(e);}
            }
        }
        else if(type1.equals("lawyer"))
        {
             if(linkdatedd.equals(curdatedd))
            {
                try{
                ps=con.prepareStatement("update lawyers set password=? where email=?");
                ps.setString(1,pwd);
                ps.setString(2,email);
                status=ps.executeUpdate();
                if(status>0)
                {
                    String s = "Password successfully changed";
                    req.setAttribute("success", s);
                    RequestDispatcher rd = req.getRequestDispatcher("lawyerlogin.jsp");
                    rd.forward(req, res);
                }
                }catch(SQLException e){System.out.println(e);}
            }
        }
    }
}
