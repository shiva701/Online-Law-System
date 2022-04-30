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
        <title>Laws Searched</title>
    </head>
    <body style="background-image:url('images/backuser1.png'); 
background-size: 100% 100%; 
background-repeat: no-repeat;">

        <div class="container-fluid">   <%-- start of conatiner--%>

            <%@include  file="header.html" %>

            <div class="row">
                <div class="col-sm-12">


                    <%
                        if (session.getAttribute("uname") != null) {
                            String uname = (String) session.getAttribute("uname");
                    %>
                    <div id="welcome">
                        <%
                            out.print("<font class='report' >User: " + uname + "</font>");
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

                <div class="col-sm-8">
                    <h2 id="userhead">Laws</h2>

                   <iframe src="lawtable.jsp" height="400px;" width="90%" style="margin-left:5%;"></iframe>


                    <%
                        String cat = request.getParameter("category").toLowerCase();
                        String state = request.getParameter("state").toLowerCase();
                        session.setAttribute("cat", cat);
                        session.setAttribute("state", state);
                        if (request.getAttribute("success") != null) {
                            String success = (String) request.getAttribute("success");
                            out.print("<font style='color:maroon; background-color: lightpink;'>" + success + "</font>");
                        } else if (request.getAttribute("failure") != null) {
                            String Error = (String) request.getAttribute("failure");
                            out.print("<font style='color:maroon; background-color: lightpink;'>" + Error + "</font>");
                        } else if (request.getAttribute("autherr") != null) {
                            String Err = (String) request.getAttribute("autherr");
                            out.print("<font style='color:maroon; background-color: lightpink;'>" + Err + "</font>");
                        }
                    %>
                </div>

                <div class="col-sm-4" ><center> <img src="images/india.jpg" class="img-rounded img-responsive"  width="400" style="margin-top: 13%;"></div>

            </div>

           <%@include  file="userprofilenav.html" %>
            <br>
            <%@include  file="footer.html" %>
        </div>
    </body>
</html>
