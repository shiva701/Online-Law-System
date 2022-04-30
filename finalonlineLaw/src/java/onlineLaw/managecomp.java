package onlineLaw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/managecomp")
public class managecomp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @param req
     * @param res
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int status = 0;
        res.setContentType("text/html");
        String id = req.getParameter("id");
        String stat = req.getParameter("status").toLowerCase();

        status = managecomplaint.update(id, stat);

        if (status > 0) {
            String s = "Successfully updated";
            req.setAttribute("success", s);
            RequestDispatcher rd = req.getRequestDispatcher("managecomp.jsp");
            rd.forward(req, res);
        } else {
            String s = "Failure! no update done!!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("managecomp.jsp");
            rd.forward(req, res);
        }
    }

}
