package onlineLaw;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userlogin")
public class userlogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        Boolean status = false;
        response.setContentType("text/html");
        String uname = request.getParameter("username");
        String pass = request.getParameter("pwd");
        String remember=request.getParameter("remember");
        status = verifyuser.verify(uname, pass);

        if (status == true) {

            
            HttpSession session = request.getSession();
            session.setAttribute("uname", uname);
            if(remember!=null && remember.equals("on"))
                session.setMaxInactiveInterval(20*60);
            RequestDispatcher rd = request.getRequestDispatcher("userprofile.jsp");
            rd.forward(request, response);

        } else {
            String s = "Login Unsuccessful. Try again!!";
            request.setAttribute("failure", s);
            RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
            rd.forward(request, response);
        }
    }
}