package onlineLaw;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class lawyeradd {

    public static int add(String name, String expertise, String mobile, String email, String ef,String password,String tid) {
        int status = 0;
        String i = "1";
        try {
            Connection con = db.gc();
            String verified="no";
            Statement st = con.createStatement();
            String s = "insert into lawyers values('" + i + "','" + name + "','" + expertise 
                    + "','" + mobile + "','"
                    + email + "','" + ef + "','" + password + "','"
                    + verified.toLowerCase() + "','"+tid+"'"+")";
            status = st.executeUpdate(s);
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
