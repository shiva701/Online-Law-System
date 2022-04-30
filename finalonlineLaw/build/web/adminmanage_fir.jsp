<%@page import="java.sql.*"%>
<%@page import="onlineLaw.db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!String s = "";%>
<%
    String status = request.getParameter("status").toLowerCase();
    String id=request.getParameter("id");
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try {
con = db.gc();
        ps = con.prepareStatement("update fir set status=? where id=?");
        ps.setString(1, status);
        ps.setString(2, id);
        ps.executeUpdate();
        ps=null;
ps = con.prepareStatement("select * from fir order by dateofaction DESC");
rs = ps.executeQuery();
out.println("<div id='fir' class='table-responsive' style='overflow-y: scroll ; height : 300px;'><table class='table table-hover'>");
out.println("<thead><tr><th>Id</th>"
+ "<th>Victim</th>"
+ "<th>Accused</th>"
+ "<th>Crime</th>"
+ "<th>Date</th>"
+ "<th>Place</th>"
+ "<th>Current Status</th>"
+ "<th>Update Status</th></tr>"
+ "</thead><tbody>");
int i=1;
while (rs.next()) {

out.println("<tr><td ><button class='btn btn-danger' id='editbtn"+i+"' onclick='sendInfo("+i+")'>"+rs.getString(1)+"</button></td>"
+ "</td><td>" + rs.getString(2)
+ "</td><td>" + rs.getString(3)
+ "</td><td>" + rs.getString(4)
+ "</td><td>" + rs.getString(5)
+ "</td><td>" + rs.getString(6)
+ "</td><td>" + rs.getString(7)
+ "</td><td><select id='updtstatus"+i+"'> <option value='none'>Select one</option><option value='closed'>Closed</option><option value='under processing'>Under Processing</option><option value='resolved'>Resolved</option></select></td></tr>");
i++;
}
con.close();
} catch (Exception e) {
System.out.println("Error : " + e);
}
out.println("</tbody>");
out.println("</table></div>");
%>