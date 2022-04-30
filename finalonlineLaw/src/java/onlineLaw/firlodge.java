package onlineLaw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class firlodge {

    public static int lodge(String victim, String against, String crime, String doa, String place, String username) {
        int status = 0;
        String i = "1";
        String a = "submitted";
        try {
            Connection con = db.gc();

            PreparedStatement ps = con.prepareStatement("insert into fir values (?,?,?,?,?,?,?,?)");
            ps.setString(1, i);
            ps.setString(2, victim);
            ps.setString(3, against);
            ps.setString(4, crime);
            ps.setString(5, doa);
            ps.setString(6, place);
            ps.setString(7, a);
            ps.setString(8, username);
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
