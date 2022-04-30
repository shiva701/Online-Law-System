<%@page import="onlineLaw.db"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courts Show</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body id="body">
        <%! String url = "";%>
        <%! String name = "";%>
        <%! String name1 = "";%>
        <div class="container-fluid">
            <%@include  file="header.html" %>

            <div class="row">
                <div class="col-sm-12">

                    <%
                        if (session.getAttribute("uname") != null) {
                            String uname = (String) session.getAttribute("uname");
                    %>
                    <div id="welcome">
                        <%
                            out.print("<font class='report' >Welcome " + uname + "</font>");
                        %>
                    </div>
                </div>
            </div>
            <%
            } else {
                request.setAttribute("Error1", "Please do login first!");
            %>

            <jsp:forward page="user.jsp"></jsp:forward>
            <% }%>

            <div class="row">
                <div class="col-sm-12">

                    <h1 style="color: black; text-align: center;">Details of Court</h1>
                    <%
                        try {
                            String loc = request.getParameter("location").toLowerCase();
                            Connection con = db.gc();
                            PreparedStatement ps = con.prepareStatement("select * from court where lower(location)=?");
                            ps.setString(1, loc);
                            ResultSet rs = ps.executeQuery();

                            out.print("<div class='container'>");
                            out.print("<div class='table-responsive'>");
                            out.print("<table style='color: maroon;' cellspacing='5' cellpadding='4' class='table' >");
                            out.print("<tr><th style='border: 2px solid black;'>NAME</th><th style='border: 2px solid black;' >LOCATION</th><th style='border: 2px solid black;' >ADDRESS</th><th style='border: 2px solid black;'>TYPE</th><th style='border: 2px solid black;'>Website</th><th style='border: 2px solid black;'>Map</th></tr>");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td style='border: 2px solid black;' >" + rs.getString(1) + "</td>");
                                name = rs.getString(1);
                                for(int i=0;i<name.length();++i)
                                {    if(name.charAt(i)==' ')
                                        name1 +='+';
                                    else    
                                        name1 +=name.charAt(i);
                                }
                                url = "https://www.google.co.in/maps/dir/" + name1;
                                out.print("<td style='border: 2px solid black;'>" + rs.getString(2) + "</td>");
                                out.print("<td style='border: 2px solid black;'>" + rs.getString(6) + "</td>");
                                out.print("<td style='border: 2px solid black;'>" + rs.getString(3) + "</td>");
                                out.print("<td style='border: 2px solid black;'>"
                                        + "<a style='color:blue;' href='" + rs.getString(4) + "' target='_blank'>Go to website</a>" + "</td>");
                                out.print("<td style='border: 2px solid black;'>"
                                        + "<a style='color:blue;' href='" + url + "' target='_blank'>Google Maps</a>" + "</td>");
                                out.print("</tr>");

                            }

                            out.print("</table>");
                            out.print("</div>");
                            out.print("</div>");
                            con.close();
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <%
                        Blob image = null;
                        byte[] imgData = null;
                        try {
                            Connection con = db.gc();
                            PreparedStatement mem = con.prepareStatement("select image from court where name=?");
                            mem.setString(1, name);

                            ResultSet rs = mem.executeQuery();
                            if (rs.next()) {
                                image = rs.getBlob(1);
                                imgData = image.getBytes(1, (int) image.length());
                            }
                            FileOutputStream fout = new FileOutputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\build\\web\\images\\court.jpg");
                            fout.write(imgData);

                    %>
                    <a href="#"><center><img src="images/court.jpg" class="img-rounded img-responsive" height="366" width="360"></center></a>


                    <%                    fout.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("Unable To Display image");
                            out.println("Image Display Error=" + e.getMessage());
                            return;
                        }%> 
                </div>    
            </div>

            <%@include  file="userprofilenav.html" %>
            <br>

            <%@include  file="footer.html" %>
        </div>

    </body>
</html>
