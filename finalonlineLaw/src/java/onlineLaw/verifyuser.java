package onlineLaw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class verifyuser {

    static Boolean status_mem = false;

    public static Boolean verify(String user, String pass) {
        try {
            Connection con = db.gc();
            PreparedStatement mem = con.prepareStatement("select verified from userp where username=? and password=?");

            mem.setString(1, user);
            mem.setString(2, pass);

            ResultSet rs = mem.executeQuery();

            if (rs.next()) {
                status_mem = rs.getString(1).equals("yes");
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status_mem;
    }
}
