package onlineLaw;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/forum")
public class forum extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String v = request.getParameter("vote");
            int id = Integer.parseInt(request.getParameter("id"));
            Connection con = db.gc();
            PreparedStatement ps = null;
            ResultSet rs = null;
            HttpSession session = request.getSession();
            boolean update = true;
            if (session.getAttribute("uname") == null) {
                update = false;
            }
            int flag = 0;
            if (update) {    //if user has logged in before voting
                if (v.equalsIgnoreCase("upvote")) {
                    ps = con.prepareStatement("select upvote from forum where id=?");
                    flag = 1;
                } else {
                    ps = con.prepareStatement("select downvote from forum where id=?");
                    flag = 2;
                }
                ps.setInt(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int vote = rs.getInt(1);
                    ++vote;
                    if (flag == 1) {
                        ps = con.prepareStatement("update forum set upvote=? where id=?");
                    } else if (flag == 2) {
                        ps = con.prepareStatement("update forum set downvote=? where id=?");
                    }
                    ps.setInt(1, vote);
                    ps.setInt(2, id);
                    ps.executeUpdate();
                }

            }
            PrintWriter out = response.getWriter();
            ps = con.prepareStatement("select u.username, u.profile_image from forum f join userp u on( u.username = f.username ) order by id");
            Blob image = null;
            // ResultSet rs=null;
            rs = ps.executeQuery();
            byte[] imagedata = null;
            int i = 1;
            while (rs.next()) {
                image = rs.getBlob(2);
                imagedata = image.getBytes(1, (int) image.length());
                FileOutputStream fout = new FileOutputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\web\\images\\" + rs.getString(1) + ".jpg");
                fout.write(imagedata);
                fout.flush();
            }
            java.lang.Thread.sleep(2000);
            ps = con.prepareStatement("select u.username, f.text, u.profile_image, f.upvote, f.downvote from forum f join userp u on( u.username = f.username ) order by id");
            rs = ps.executeQuery();

            while (rs.next()) {

                 out.println(" <div class='row'>");
                                    out.println("<div class=' col-sm-2' >"
                                            + "<img src='images/" + rs.getString(1) + ".jpg'  width='100' class='img-responsive img-circle' /></div>");
                                    out.println(" <div class='col-sm-10'style=' "
                                            + "margin-top:1%; text-align:left;  '> "
                                            + "<font size=4 color='blue'  ><span id='u" + i + "' >" + rs.getString(1) + "</span></font><br/><br/><div style='width:100%;height:100px;overflow:auto;'>" + rs.getString(2) + "</div>");

                                    out.println("<br/> <button  onclick='up(" + i + ")' class=\"btn btn-default btn-sm\">"
                                            + "<span class=\"glyphicon glyphicon-thumbs-up\"></span>Upvote<br><sub>" + rs.getInt(4) + "<sub>"
                                            + "</button>");
                                    out.println(" <button onclick='down(" + i + ")'  class=\"btn btn-default btn-sm\">"
                                            + "<span class=\"glyphicon glyphicon-thumbs-down\"></span>Downvote<br><sub>" + rs.getInt(5) + "<sub>"
                                            + "</button> </div></div><hr>");

                ++i;
            }
            out.println("<br>\n"
                    + "                          <br>\n"
                    + "                        <form class=\"form-horizontal\" action=\"\" onsubmit=\"return post_forum()\" method=\"post\" style=\"margin-left: 3%;\">\n" +
"\n" +
"                            <div class=\"form-group\">\n" +
"\n" +
"                                <div class=\"col-sm-10\"  >          \n" +
"                                    <textarea name=\"text\" id=\"text1\" class=\"form-control\" style=\"width: 100% ;max-width: 100%;max-height: 90%; height: 100%\"> </textarea>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                            <div class=\"form-group\">        \n" +
"                                <div class=\"col-sm-2\">\n" +
"                                    <button type=\"submit\"  class=\"btn btn-default\" style=\"float:left;\">Post</button>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </form>");
            if (!update) {
                out.print("\n<font style='background-color:lightpink ; color:red'>Please do login first!</font>");
            }
            con.close();
        } catch (SQLException | InterruptedException ex) {
            Logger.getLogger(forum.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
