
package onlineLaw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/email")
public class email extends HttpServlet { 
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail=request.getParameter("email")  ;
        int i1=mail.indexOf(".");
        int i2=mail.indexOf("@");
        PrintWriter out=response.getWriter();
        Connection con=db.gc();
        try {
            PreparedStatement ps=con.prepareStatement("select mail from userp where mail=?");
            ps.setString(1,mail);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
                out.println("<font color='red' ><b>Already exist.</b></font>");
             else if(mail.equals("")||i1==-1||i2==-1||(i1-i2>1 && (mail.length()-i1)<4)||i1==0||i2==0)
                out.println("<span class=\"glyphicon glyphicon-remove\" style='color:red;'></span>");
            else
                out.println("<span class=\"glyphicon glyphicon-ok\" style='color:green;'></span>");
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(username.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}