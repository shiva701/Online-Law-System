<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!String type = "";%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Forgot Password</title>
    </head>
    <body id="body">
        <div class="container-fluid">
            <%@include  file="header.html" %>
            <div class="row" id="userhead">
                <h2>Password Recovery</h2>
            </div>
            <%
                type = request.getParameter("type");
                session.setAttribute("type", type);
            %>
            <div class="row">
                <div class="col-sm-6">
                    <form class="form-horizontal" method="post" action="userforgotpassword">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="emailid">Email ID</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="emailid" placeholder="Enter your email ID" name="emailid" required>
                            </div>
                        </div>
                        <div class="form-group">        
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form>
                    <%
                        if (request.getAttribute("failure") != null) {
                            String Error = (String) request.getAttribute("failure");
                            out.print("<font style='color:maroon; background-color:lightpink;'>" + Error + "</font>");
                        }
                    %>
                </div>
            </div>
            <%@include  file="footer.html" %>
        </div>
    </body>
</html>
