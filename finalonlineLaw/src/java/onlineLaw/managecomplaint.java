package onlineLaw;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class managecomplaint {

    public static int update(String id, String stat) {
        int status = 0;
        try {
            Connection con = db.gc();
            Statement st = con.createStatement();
            String s = "update fir set status='" + stat + "' where id='" + id + "'";
            status = st.executeUpdate(s);
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
