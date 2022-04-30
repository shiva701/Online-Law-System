package onlineLaw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addcourt")
@MultipartConfig
public class addcourt extends HttpServlet {

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
        String cname = req.getParameter("cname").toLowerCase();
        String loc = req.getParameter("location").toLowerCase();
        String stat = req.getParameter("optradio").toLowerCase();
        String address = req.getParameter("address");
        String url = req.getParameter("url");
        Part image = req.getPart("image");

        status = courtadd.add(cname, loc, stat, url, image,address);

        if (status > 0) {
            String s = "Successfully Added";
            req.setAttribute("success", s);
            RequestDispatcher rd = req.getRequestDispatcher("addcourt.jsp");
            rd.forward(req, res);
        } else {
            String s = "Failure!!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("addcourt.jsp");
            rd.forward(req, res);
        }
    }

}
