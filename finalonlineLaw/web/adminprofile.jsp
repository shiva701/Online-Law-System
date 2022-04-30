<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Admin Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body id="body">

        <div class="container-fluid">

            <%@include  file="header.html" %>

            <br>
            <div class="row">

                <%
                    if (session.getAttribute("name") != null) {
                        String name = (String) session.getAttribute("name");
                %>
                <div id="welcome">
                    <%
                        out.print("<font class='report' >Welcome " + name + "</font>");
                    %>
                </div> 
            </div>
            <%
            } else {
                request.setAttribute("Error1", "Please do login first!");
            %>
            <jsp:forward page="admin.jsp"></jsp:forward>
            <% } %>

            <div class="row">
                <div class="col-sm-6">    

                    <div class="row">
                        <div style="margin-left:80px; font-family:comic sans ms; font-size: 150%;" >
                            <h1 style="color: black;">Tasks</h1>

                            <ul>
                                <li><a href="addcourt.jsp" style="background: none; color:black; text-decoration: none;">Add Court</a></li>
                                <li><a href="manage_fir_admin.jsp" style="background: none; color:black; text-decoration: none;">Manage FIR(s)</a></li>
                                <li><a href="addlaw.jsp" style="background: none; color:black; text-decoration: none;">Add Law</a></li>
                                <li><a href="addlawyer.jsp" style="background: none; color:black; text-decoration: none;">Add Lawyer</a></li>
                                <li><a href="removelawyer.jsp" style="background: none; color:black; text-decoration: none;">Remove Lawyer</a></li>
                            </ul>

                            <br>


                            <%
                                if (request.getAttribute("failure") != null) {
                                    String Error = (String) request.getAttribute("failure");
                                    out.print("\n<font style='color:maroon; background-color:lightpink;'>\n" + Error + "</font>");
                                }
                            %>

                            <form action="adminlogout" method="post">

                                <input type="submit" value="Logout" class="btn btn-danger">

                            </form>
                            <br>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" >


                    <center> <img src="images/admin.jpg" class="img-rounded img-responsive" width="400" style="margin-top: 2%;" ></center>
                </div>        
            </div>
            <br>
            <%@include  file="footer.html" %>
        </div>

    </body>
</html>