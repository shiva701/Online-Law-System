package onlineLaw;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class lawyerdelete {

    public static int delete(String lid, String lname) {
        int status = 0;
        try {
            Connection con=db.gc();
            Statement st = con.createStatement();
            String s = "delete from lawyers where lawyerid='" + lid + "' and lower(name) ='" + lname + "'";
            status = st.executeUpdate(s);
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

}
