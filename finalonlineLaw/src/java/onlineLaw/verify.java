package onlineLaw;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class verify extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String e = req.getParameter("tid");
            Connection con = db.gc();
            PreparedStatement ps = con.prepareStatement("update userp set verified='yes' where temp_id=?");
            ps.setString(1, e);
            int n = ps.executeUpdate();
            con.close();
            if (n > 0) {
                String a = "Member sucessfully verified!!";
                req.setAttribute("success", a);
                req.getRequestDispatcher("user.jsp").forward(req, resp);
            }
        } catch (IOException | SQLException | ServletException e) {
            System.out.println(e);
        }
    }

}
