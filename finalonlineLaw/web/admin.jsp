<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Admin</title>
    </head>
    <body id="body">

        <div class="container-fluid">
            <%@include  file="header.html" %>


            <div class="row" >
                <div class="col-sm-12">

                    <center>
                        <h1>Admin Login</h1>
                    </center>
                    <form class="form-horizontal" action="adminlogin" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="admin">Admin</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="admin" placeholder="Enter admin name" name="admin" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Password:</label>
                            <div class="col-sm-6">          
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
                            </div>
                        </div>

                        <div class="form-group">        
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label><input type="checkbox" name="remember"> Remember me</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">        
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>

                            </div>
                        </div>
                    </form>
                    <div style="margin-left:17%;">
                        <%
                            if (request.getAttribute("failure") != null) {
                                String Error = (String) request.getAttribute("failure");
                                out.print("\n<font style='color:maroon; background-color:lightpink;' >\n" + Error + "</font>");
                            } else if (request.getAttribute("error") != null) {
                                String err = (String) request.getAttribute("error");
                                out.print("<font style='color:maroon; background-color:pink;'>" + err + "</font>");
                            } else if (request.getAttribute("Error1") != null) {
                                String err = (String) request.getAttribute("Error1");
                                out.print("<font style='color:maroon; background-color:pink;'>" + err + "</font>");
                            }
                            if (request.getAttribute("logout") != null) {
                                String logout = (String) request.getAttribute("logout");
                                out.print("<font style='color:maroon; background-color:lightpink;' >" + logout + "</font>");
                            } else if (session.getAttribute("name") != null) {
                        %>
                        <jsp:forward page="adminprofile.jsp"></jsp:forward>
                        <%
                            }
                        %>
                    </div>     
                </div>
            </div>
            <%@include  file="footer.html" %>
        </div>


    </body>
</html>