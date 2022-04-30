package onlineLaw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 2000000000)

@WebServlet("/addlaw")
public class addlaw extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int status = 0;
        res.setContentType("text/html");
        String section = req.getParameter("section").toLowerCase();
        String cat = req.getParameter("category").toLowerCase();
        String title = req.getParameter("title").toLowerCase();
        String state = req.getParameter("state").toLowerCase();
        String year = req.getParameter("year");
        Part pl = req.getPart("file");
        try {
            Connection con = db.gc();
            PreparedStatement pst1 = con.prepareStatement("insert into law values(?,?,?,?,?,?)");
            pst1.setString(1, section);
            pst1.setString(2, cat);
            pst1.setString(3, title);
            pst1.setString(4, state);
            pst1.setString(5, year);
            pst1.setBlob(6, pl.getInputStream());

            status = pst1.executeUpdate();
            con.close();
        } catch (IOException | SQLException e) {
        }

        if (status > 0) {
            String s = "Successfully Added";
            req.setAttribute("success", s);
            RequestDispatcher rd = req.getRequestDispatcher("addlaw.jsp");
            rd.forward(req, res);
        } else {
            String s = "Failure!!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("addlaw.jsp");
            rd.forward(req, res);
        }
    }

}
