package onlineLaw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class userlogout
 */
@WebServlet("/userlogout")
public class userlogout extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        res.setContentType("text/html");
        HttpSession s = req.getSession(false);
        s.invalidate();
        req.setAttribute("logout", "You have been successfully logged out !!");
        RequestDispatcher rd = req.getRequestDispatcher("user.jsp");
        rd.include(req, res);
    }

}
