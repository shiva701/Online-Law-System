<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!String email = "";%>
<%!String linkdate = "";%>
<%!String type1 = "";%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="inputscripts.js"></script>
        <script>
$(document).ready(function(){
$('[data-toggle="tooltip"]').tooltip();   
});
</script>
        <title>New Password</title>
    </head>
    <body id="body">
        <div class="container-fluid">
            <%@include  file="header.html" %>
            <%
                type1 = request.getParameter("type");
                email = request.getParameter("email");
                linkdate = request.getParameter("curdate");
                String linkdatedd = linkdate.substring(8, 10);
                LocalDate d = LocalDate.now();
                String curdate = d.toString();
                String curdatedd = curdate.substring(8, 10);
                if (linkdatedd.equals(curdatedd)) {
                    session.setAttribute("type1", type1);
                    session.setAttribute("email", email);
                    session.setAttribute("linkdate", linkdate);
                } else {
                    String s = "Password Recovery Link expired!";
                    request.setAttribute("failure", s);
                    RequestDispatcher rd = null;
                    if (type1.equals("user")) {
                        rd = request.getRequestDispatcher("user.jsp");
                    } else if (type1.equals("lawyer")) {
                        rd = request.getRequestDispatcher("lawyer.jsp");
                    }
                    rd.forward(request, response);
                }
            %>
            <div class="row" id="userhead"><h2>New Password</h2></div>
            <div class="row">
                <div class="col-sm-10">
                    <form class="form-horizontal" action="newpassword" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="newpwd">New Password</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="pwd" placeholder="Enter new password" name="pwd" onblur="password()" required>
                            </div>
                            <div class="col-sm-1" style="margin-right: 0px;"><a href="#" data-toggle="tooltip" title="Password should contain letters,numbers and !/@/#/$/& and should be atleast 8 characters long." data-placement="right" ><img src="images/question.png" height="15px" width="15px" style="margin-top: 5%;"> </a>
                            </div>
                            <div class="col-sm-5" style="margin-top: 4px; margin-left:0px">  <span id="spanpwd" style="color:maroon;"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="cpwd">Confrim Password</label>
                            <div class="col-sm-4">          
                                <input type="password" class="form-control" id="cpwd" placeholder="Confirm password" name="cpwd" onblur="checkpassword()" required>
                            </div>
                            <div class="col-sm-5" style="margin-top: 4px; margin-left:0px">  <span id="spancpwd" style="color:maroon;"></span>
                            </div>
                        </div>
                        <div class="form-group">        
                            <div class="col-sm-offset-4 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%@include  file="footer.html" %>
        </div>
    </body>
</html>
