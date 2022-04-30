package onlineLaw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class lawyercaseupdate extends HttpServlet {

    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param res servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter pw=res.getWriter();
        int stat=0;
        String lid="";
        String status = req.getParameter("status").toLowerCase();
        String caseid=req.getParameter("caseid");
        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        try {
        con = db.gc();
        ps = con.prepareStatement("update lawyercase set status=? where caseid=?");
        ps.setString(1, status);
        ps.setString(2, caseid);
        stat=ps.executeUpdate();
        if(stat>0){
            String lname="";
            String clientmail="";
            String cname="";
            String edate="";
            String crime="";
            ps1=con.prepareStatement("select * from lawyercase where caseid=?");
            ps1.setString(1, caseid);
            ResultSet rs1=ps1.executeQuery();
            if(rs1.next())
            {
                lname=rs1.getString(2);
                cname=rs1.getString(3);
                crime=rs1.getString(4);
                clientmail=rs1.getString(5);
                edate=rs1.getString(6);
                lid=rs1.getString(8);
            }
            lawyercaseupdatemail.mailer(clientmail,status,caseid,lname,cname,edate,crime);
        }
        ps=null;
        ps = con.prepareStatement("select * from lawyercase where lawyer_id=? order by expected_date DESC");
        ps.setString(1,lid);
        rs = ps.executeQuery();
        pw.println("<div id='lawyercase' class='table-responsive' style='overflow-y: scroll; height : 300px;'><table class='table table-hover'>");
                            pw.println("<thead><tr><th>Case ID</th>"
                                    + "<th>Client Name</th>"
                                    + "<th>Case</th>"
                                    + "<th>Client Email</th>"
                                    + "<th>Expected Date</th>"
                                    + "<th>City</th>"
                                    + "<th>Current Status</th>"
                                    + "<th>Update Status</th></tr>"
                                    + "</thead><tbody>");
                            int i = 1;
                            while (rs.next()) {

                                pw.println("<tr><td ><button class='btn btn-danger' id='editbtn" + i + "' onclick='sendInfo(" + i + ")'>" + rs.getString(1) + "</button></td>"
                                        + "</td><td>" + rs.getString(3)
                                        + "</td><td>" + rs.getString(4)
                                        + "</td><td>" + rs.getString(5)
                                        + "</td><td>" + rs.getString(6)
                                        + "</td><td>" + rs.getString(9)
                                        + "</td><td>" + rs.getString(7)
                                        + "</td><td><select id='updtstatus" + i + "'> <option value='none'>Select one</option><option value='accepted'>Accept</option><option value='rejected'>Reject</option></tr>");
                                i++;
                            }
        con.close();
} catch (SQLException e) {
System.out.println("Error : " + e);
}
pw.println("</tbody>");
pw.println("</table></div>");
    }
}
