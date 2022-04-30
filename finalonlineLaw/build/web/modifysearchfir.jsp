<%@page import="java.sql.*"%>
<%@page import="onlineLaw.db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String victim = request.getParameter("victim");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        con = db.gc();
        ps = con.prepareStatement("select * from fir where username=? and victim=?");
        ps.setString(1, (String) session.getAttribute("uname"));
        ps.setString(2, victim);
        rs = ps.executeQuery();
        out.println("<div class='table-responsive'  style='overflow-y: scroll ; height : 200px;'><table class='table table-hover'>");
        out.println("<thead><tr><th>Id</th>"
                + "<th>Victim</th>"
                + "<th>Accused</th>"
                + "<th>Crime</th>"
                + "<th>Date</th>"
                + "<th>Place</th>"
                + "<th>Status</th>"
                + "</tr>"
                + "</thead><tbody>");
        while (rs.next()) {
            String status = rs.getString(7);
            String date = rs.getString(5);
            String yy = date.substring(0, 4);
            String dd = date.substring(8, 10);
            String mm = date.substring(5, 7);
            out.println("<tr ><td >" + rs.getString(1)
                    + "</td><td>" + rs.getString(2)
                    + "</td><td>" + rs.getString(3)
                    + "</td><td>" + rs.getString(4)
                    + "</td><td>" + dd + "/" + mm + "/" + yy
                    + "</td><td>" + rs.getString(6)
                    + "</td><td>" + rs.getString(7));
        }
        con.close();
    } catch (Exception e) {
        System.out.println("Error : " + e);
    }
    out.println("</tbody>");
    out.println("</table></div>");

%>
