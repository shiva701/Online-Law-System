package onlineLaw;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadservlet")
public class downloadservlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     *
     * @param req
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String fn = req.getParameter("title");

            Blob b = null;
            Connection con = db.gc();
            PreparedStatement pst1 = con.prepareStatement("select * from LAW where title=?");
            pst1.setString(1, fn);
            System.out.println(fn);
            ResultSet rs = pst1.executeQuery();
            if (rs.next()) {
                b = rs.getBlob(6);
            }
            InputStream in = b.getBinaryStream();
            byte b1[] = new byte[(int) b.length()];
            in.read(b1);
            ServletOutputStream out = res.getOutputStream();
            res.setContentType("*/*");
            res.setHeader("Content-disposition", "attachment; filename=" + fn);
            out.write(b1);
            out.flush();
            con.close();
        } catch (IOException | SQLException e) {
        }
    }

}
