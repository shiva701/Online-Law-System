<%@page import="onlineLaw.db"%>
<%@ page import="java.sql.*"%>
<%
    String s = request.getParameter("val");
    if (s == null || s.trim().equals("")) {
        out.print("Please select category of case");
    } else {
        try {
            Connection con = db.gc();
            PreparedStatement ps = con.prepareStatement("select * from lawyers where lower(expertise)=?");
            ps.setString(1, s);
            ResultSet rs = ps.executeQuery();
            out.print("<div class='container'>");
            out.print("<div class='table-responsive' style='overflow-y: scroll ; height : 250px;'>");
            out.print("<table style='color: maroon;' class='table table-hover' >");
            out.print("<tr><th >LawyerID</th><th  >Name</th><th >Expertise</th><th >Email</th><th>Fees</th></tr>");
            while (rs.next()) {
                out.print("<tr>");

                out.print("<td >" + rs.getString(1) + "</td>");

                out.print("<td >" + rs.getString(2) + "</td>");
                out.print("<td >" + rs.getString(3) + "</td>");
                out.print("<td >" + rs.getString(5) + "</td>");
                out.print("<td >" + rs.getString(6) + "</td>");
                out.print("</tr>");
            }
            out.print("</table>");
            out.print("</div>");
            out.print("</div>");
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>