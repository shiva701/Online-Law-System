package onlineLaw;

import java.sql.*;

public class lawyerhire {

    public static int hirelawyer(String lid, String clientemail,String lname, String cname, String crime, String edate,String city) {
        int status = 0;
        String i="";
        try {
            Connection con = db.gc();
            PreparedStatement ps = con.prepareStatement("insert into lawyercase values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, i);
            ps.setString(2, lname);
            ps.setString(3, cname);
            ps.setString(4, crime);
            ps.setString(5, clientemail);
            ps.setString(6, edate);
            ps.setString(7, "requested");
            ps.setString(8, lid);
            ps.setString(9, city);
            status = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

}
