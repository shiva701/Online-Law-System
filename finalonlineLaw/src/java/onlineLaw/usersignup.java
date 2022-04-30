package onlineLaw;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class usersignup
 */
@WebServlet("/usersignup")
@MultipartConfig
public class usersignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
 SecretKey sk;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.setContentType("text/html");
		int status = 0;
		String fname = request.getParameter("name").toLowerCase();
		String ano = request.getParameter("aadhaar");
		Part image = request.getPart("image");
		String mnumber = request.getParameter("mobile");
		String mail = request.getParameter("email");
		String username = request.getParameter("uname");
		String pass = request.getParameter("pwd");
		String cpass = request.getParameter("cpwd");
                String captcha=request.getParameter("captcha");
                FileInputStream fin=new FileInputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\src\\java\\onlineLaw\\key.txt");
                ObjectInputStream o=new ObjectInputStream(fin);
            try {
                 sk=(SecretKey)o.readObject();
            } catch (ClassNotFoundException ex) {
      //          System.out.println(ex);
            }
            Cookie ck[]=request.getCookies();
            String c = null,s=null;
            for(Cookie t:ck)
                if(t.getName().equals("captcha"))
                    s=t.getValue();
            try {
                c = decrypt(s);
            } catch (Exception ex) {
                System.out.println(ex);
            }          
    PrintWriter pw=response.getWriter();
    if(!c.equals(request.getParameter("captcha")))
    {
         request.setAttribute("captchastatus", "Please re-enter captcha.");
         RequestDispatcher rd = request.getRequestDispatcher("usersignup.jsp");
		rd.forward(request, response);
               
    }
                String tid=getTempId();
		status = user.add(fname, ano, image, mnumber, mail, username, pass, cpass,"no",tid);
		if (status > 0) {
			sendmail.mailer(mail, username, pass,tid);
			String a = "Member sucessfully registered! Please verify your email before login!";
			request.setAttribute("success", a);
			request.getRequestDispatcher("user.jsp").forward(request, response);
		} else {
			String a = "Member not registered! Try again!";
			request.setAttribute("failure", a);
			request.getRequestDispatcher("usersignup.jsp").forward(request, response);
		}
	}
    public String getTempId() {
        String s = "";
        for (int i = 1; i <= 10; i++) {
            Random r = new Random();
            int n = r.nextInt(91 - 65) + 65;
            s = s + (char) n;
        }
        return s;
    }
String decrypt(String s) throws Exception
{
    Cipher c=Cipher.getInstance("AES");
    c.init(Cipher.DECRYPT_MODE,sk);
    byte b1[]=new BASE64Decoder().decodeBuffer(s);
    byte b2[]=c.doFinal(b1);
    String s1=new String(b2);
    return s1;
}

}
