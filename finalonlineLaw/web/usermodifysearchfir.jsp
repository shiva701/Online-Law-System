<%@page import="java.sql.*"%>
<%@page import="onlineLaw.db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String victim = request.getParameter("victim").toLowerCase();
    String status = request.getParameter("status").toLowerCase();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        con = db.gc();
        if (status != null && victim == "") {
            ps = con.prepareStatement("select * from fir where lower(status)=? and username=? order by DATEOFACTION DESC");
            ps.setString(1, status);
            ps.setString(2, (String) session.getAttribute("uname"));
        }else if (victim != null && status.equals("none")) {
            ps = con.prepareStatement("select * from fir where lower(victim)=? and username=? order by DATEOFACTION DESC");
            ps.setString(1, victim);
            ps.setString(2, (String) session.getAttribute("uname"));
        } 
        else if (status != null && victim != null) {
            ps = con.prepareStatement("select * from fir where lower(victim)=? and lower(status)=? and username=? order by DATEOFACTION DESC");
            ps.setString(1, victim);
            ps.setString(2, status);
            ps.setString(3, (String) session.getAttribute("uname"));
        } else if (victim.equals("") && status.equals("none")) {
            System.out.println("hello");
            ps = con.prepareStatement("select * from fir where username=? order by DATEOFACTION DESC");
            ps.setString(1, (String) session.getAttribute("uname"));
        }
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
            out.println("<tr ><td >" + rs.getString(1)
                    + "</td><td>" + rs.getString(2)
                    + "</td><td>" + rs.getString(3)
                    + "</td><td>" + rs.getString(4)
                    + "</td><td>" + rs.getString(5)       
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
