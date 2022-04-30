package onlineLaw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        res.setContentType("text/html");

        String name = req.getParameter("admin");
        String password = req.getParameter("pwd");
        String remember=req.getParameter("remember");
        if ((name.equals("admin")) && (password.equals("manage"))) {
            HttpSession session = req.getSession();
            session.setAttribute("name", name);
            if(remember!=null && remember.equals("on"))
                session.setMaxInactiveInterval(20*60);
            RequestDispatcher rd = req.getRequestDispatcher("adminprofile.jsp");
            rd.forward(req, res);
        } else {
            String error = "Username or Password incorrect. Please try again";
            req.setAttribute("error", error);
            RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
            rd.include(req, res);
        }
    }

}
