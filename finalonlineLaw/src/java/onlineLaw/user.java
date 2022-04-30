package onlineLaw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.Part;

public class user {

    public static int add(String name, String ano, Part image, String mnumber, String mail, String user,
            String pass, String cpass, String ver, String tid) {
        int i = 0;

        try {
            if (pass.equals(cpass)) {

                Connection con = db.gc();

                PreparedStatement ps = con.prepareStatement("insert into userp values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, ano);
                ps.setString(3, mnumber);
                ps.setString(4, mail);
                ps.setString(5, user);
                ps.setString(6, pass);
                ps.setBinaryStream(7, image.getInputStream(), (int) (image.getSize()));
                ps.setString(8, ver);
                ps.setString(9, tid);

                i = ps.executeUpdate();
                con.close();
            }
        } catch (IOException | SQLException e2) {
            System.out.println(e2);
        }
        return i;
    }
}
