package onlineLaw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/removelawyer")
public class removelawyer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int status = 0;
        res.setContentType("text/html");
        String lid = req.getParameter("lid");
        String lname = req.getParameter("lname").toLowerCase();

        status = lawyerdelete.delete(lid, lname);

        if (status > 0) {
            String s = "Successfully Removed";
            req.setAttribute("success", s);
            RequestDispatcher rd = req.getRequestDispatcher("removelawyer.jsp");
            rd.forward(req, res);
        } else {
            String s = "Failure! Try Again!";
            req.setAttribute("failure", s);
            RequestDispatcher rd = req.getRequestDispatcher("removelawyer.jsp");
            rd.forward(req, res);
        }
    }

}
