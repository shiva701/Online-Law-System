<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Lawyer Login</title>
    </head>
    <body id="body">
        <div class="container-fluid">
            <%@include  file="header.html" %>
            <div class="row" >
                <div class="col-sm-12">
                    <center>
                    <h1>Lawyer Login</h1>
                </center>
                <form class="form-horizontal" action="lawyerlogin" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lawyerid">Lawyer ID</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="lawyerid" placeholder="Enter your ID" name="lid" required>
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
                            <a href="forgotpassword.jsp?type=lawyer" target="_blank" style="color:maroon; margin-left: 1%">Forgot Password?</a>
                        </div>
                    </div>
                </form>
                    <div style="margin-left:17%;">
                    <%
                        if (request.getAttribute("failure") != null) {
                            String Error = (String) request.getAttribute("failure");
                            out.print("\n<font style='color:maroon; background-color:lightpink;' >\n" + Error + "</font>");
                        } else if (request.getAttribute("success") != null) {
                            String success = (String) request.getAttribute("success");
                            out.print("<font style='color:maroon; background-color:lightpink;' >" + success + "</font>");
                        } else if (request.getAttribute("Error1") != null) {
                            String err = (String) request.getAttribute("Error1");
                            out.print("<font style='color:maroon; background-color:lightpink;' >" + err + "</font>");
                        }
                        if (request.getAttribute("logout") != null) {
                            String logout = (String) request.getAttribute("logout");
                            out.print("<font style='color:maroon; background-color:lightpink;' >" + logout + "</font>");
                        } else if (session.getAttribute("lawyer") != null) {
                    %>
                    <jsp:forward page="lawyerprofile.jsp"></jsp:forward>
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
