<%@page import="onlineLaw.db"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>User Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body id="body">
        <div class="container-fluid">

            <%@include  file="header.html" %>
            <br>
            <div class="row">

                <%
                    if (session.getAttribute("uname") != null) {
                        String uname = (String) session.getAttribute("uname");
                %>
                <div id="welcome">
                    <%
                        out.print("<font class='report' >Welcome " + uname + "</font>");
                    %>
                </div> </div>
                <%
                } else {
                    request.setAttribute("Error1", "Please do login first!");
                %>
                <jsp:forward page="user.jsp"></jsp:forward>

            <%
                }
                Blob image = null;
                byte[] imgData = null;
                try {
                    Connection con = db.gc();
                    PreparedStatement mem = con.prepareStatement("select profile_image from userp where username=?");
                    mem.setString(1, (String) session.getAttribute("uname"));

                    ResultSet rs = mem.executeQuery();
                    if (rs.next()) {
                        image = rs.getBlob(1);
                        imgData = image.getBytes(1, (int) image.length());
                    }
                    FileOutputStream fout = new FileOutputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\build\\web\\images\\x.jpg");
                    fout.write(imgData);
            %>
            <div class="row">
                <div class="col-sm-8">    
                    <div  class="row">
                        <div class="col-sm-12" style=" height: 150px; width: 50%; float:left; margin-left: 78px; "><a href="#"><img src="images/x.jpg" height="150px" width="200px"></a></div>
                    </div>
                    <div class="row">
                        <div style="margin-left:80px; font-family:comic sans ms; font-size: 150%;" >
                            <h1 style="color: black;">Tasks</h1>

                            <ul >
                                <li><a href="hirelawyer.jsp"  style="background: none; color:black; text-decoration: none;">Hire Lawyers</a></li>
                                <li><a href="FIR.jsp"  style="background: none; color:black; text-decoration: none;">FIR(s)</a></li>
                                <li><a href="searchlaws.jsp"  style="background: none; color:black; text-decoration: none;">Search Laws</a></li>
                                <li><a href="searchcourts.jsp"  style="background: none; color:black; text-decoration: none;">Search Courts</a></li>
                                <li><a href="filedfir.jsp"  style="background: none; color:black; text-decoration: none;">Filed FIR(s)</a></li>
                            </ul>

                            <br>


                            <%
                                if (request.getAttribute("failure") != null) {
                                    String Error = (String) request.getAttribute("failure");
                                    out.print("\n<font style='color:maroon; backgorund-color:lightpink;'>\n" + Error + "</font>");
                                }
                            %>

                            <form action="userlogout" method="post">

                                <input type="submit" value="Logout" class="btn btn-danger">

                            </form>
                        </div>
                    </div>
                </div>


                <%
                        con.close();
                        fout.close();
                    } catch (Exception e) {
                        out.println("Unable To Display image");
                        out.println("Image Display Error=" + e.getMessage());
                        return;
                    }%> 
                <div class="col-sm-4" >
                    <center> <img src="images/user.jpg" class="img-rounded img-responsive" width="200"  style="margin-top: 6%;"></center>
                </div>        
            </div>
            <br>
            <%@include  file="footer.html" %>
        </div>
    </body>
</html>