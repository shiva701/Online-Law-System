<%@page import="onlineLaw.db"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Law Table</title>
    </head>
    <body style="background-color: antiquewhite; overflow-y: scroll;">
        <%
            try {
                String cat = (String) session.getAttribute("cat");
                String state = (String) session.getAttribute("state");
                Connection con = db.gc();
                PreparedStatement ps = null;
                if (cat.equals("penal")) {
                    ps = con.prepareStatement("select * from law where lower(category)=?");
                    ps.setString(1, cat);
                } else {
                    ps = con.prepareStatement("select * from law where lower(category)=? and lower(state)=?");
                    ps.setString(1, cat);
                    ps.setString(2, state);
                }
                ResultSet rs = ps.executeQuery();
        %>

        <table class="table table-bordered table-responsive table-hover" style="background-color: antiquewhite;">
            <tr>
                <th>SECTION</th>
                <th>CATEGORY</th>
                <th>TITLE</th>
                <th>STATE</th>
                <th>YEAR</th>
                <th>PDF</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td> 
                <td><a href="download.jsp?title=<%=rs.getString(3)%>" target="_blank">Download</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
            %>
        </table>
    </body>
</html>
