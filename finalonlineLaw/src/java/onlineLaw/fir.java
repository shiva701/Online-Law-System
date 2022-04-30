package onlineLaw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/fir")
public class fir extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int status = 0;
        res.setContentType("text/html");
        HttpSession session = req.getSession(false);
        String victim = req.getParameter("victim").toLowerCase();
        String against = req.getParameter("accused").toLowerCase();
        String crime = req.getParameter("crime").toLowerCase();
        LocalDate d=java.time.LocalDate.now();
        String exdate=d.toString();
        String yy = exdate.substring(0, 4);
        String dd = exdate.substring(8, 10);
        String mm = exdate.substring(5, 7);
        String doa=dd+"-"+mm+"-"+yy;
        String place = req.getParameter("place").toLowerCase();
        String username = (String) session.getAttribute("uname");
        status = firlodge.lodge(victim, against, crime, doa, place, username);
        if (status > 0) {
            try {
                String usermail="";
                String stat="submitted";
                Connection con = db.gc();
                PreparedStatement ps=con.prepareStatement("select mail from userp where username=?");
                ps.setString(1,username);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                    usermail=rs.getString(1);
                firmail.mailer(usermail,username,victim,against,stat);
                String s = "Successfully Lodged";
                req.setAttribute("success", s);
                RequestDispatcher rd = req.getRequestDispatcher("FIR.jsp");
                rd.forward(req, res);
            } catch (SQLException ex) {
                Logger.getLogger(fir.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String s = "Failure! FIR not lodged!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("FIR.jsp");
            rd.forward(req, res);
        }
    }
}
