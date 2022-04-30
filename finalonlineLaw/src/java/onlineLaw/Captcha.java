package onlineLaw;
import javax.servlet.http.*;
import java.io.*;
import javax.imageio.*;
import java.awt.image.*;
import java.awt.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.crypto.*;
import javax.servlet.annotation.WebServlet;
import sun.misc.BASE64Encoder;
@WebServlet("/Captcha")
public class Captcha extends HttpServlet
{	
	SecretKey sk;
	public void service (HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		BufferedImage img = new BufferedImage(130,50,BufferedImage.TYPE_INT_RGB);
		Graphics g=img.getGraphics();		
		g.setColor(Color.white);
		g.drawRect(0,0,160,50);		
		g.fillRect(0,0,160,50);
		g.setColor(Color.black);
		g.setFont(new Font("Monotype Corsiva",Font.PLAIN,38));
		String s =randomString();
                g.drawString(s,8,40);
		g.dispose();
                FileInputStream fin=new FileInputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\src\\java\\onlineLaw\\key.txt");
                ObjectInputStream o=new ObjectInputStream(fin);
            try {
                 sk=(SecretKey)o.readObject();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Captcha.class.getName()).log(Level.SEVERE, null, ex);
            }
            String c = null;
            try {
                c = encrypt(s);
            } catch (Exception ex) {
                Logger.getLogger(Captcha.class.getName()).log(Level.SEVERE, null, ex);
            }
            Cookie ck=new Cookie("captcha",c);
            res.addCookie(ck);
		ServletOutputStream out=res.getOutputStream();
		ImageIO.write(img,"PNG",out);
		
	}
	String randomString()
	{
		String s="" , S="QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
		for(int i=1;i<=5;++i)
			s=s+S.charAt((int)(S.length()*Math.random()));
		return s;
	}
        String encrypt(String s) throws Exception
        {
            Cipher cipher=Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE,sk);
            byte b1[]=s.getBytes();
            byte b2[]=cipher.doFinal(b1);
            String enc=new BASE64Encoder().encode(b2);
            return enc;
        }
}