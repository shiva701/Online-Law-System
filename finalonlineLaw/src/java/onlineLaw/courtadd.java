package onlineLaw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.Part;

public class courtadd {

    public static int add(String name, String loc, String type, String url, Part image,String address) throws IOException {
        int status = 0;
        try {
            Connection con = db.gc();
            PreparedStatement ps = con.prepareStatement("insert into court values(?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, loc);
            ps.setString(3, type);
            ps.setString(4, url);
            ps.setBinaryStream(5, image.getInputStream(), (int) (image.getSize()));
            ps.setString(6, address);
            status = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status;
    }

}
