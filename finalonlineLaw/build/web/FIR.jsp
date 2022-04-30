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
        <title>FIR</title>
    </head>
    <body id="body">

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
                <div class="col-sm-6">


                    <h2 id="userhead">FIR Details</h2>
                    <div id="firform">
                        <form action="fir" method="post" class="form-horizontal" >
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="victim">Victim</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="victim"
                                           placeholder="Enter full name" name="victim" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="accused">Accused</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="accused"
                                           placeholder="Enter full name" name="accused" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="crime">Crime
                                </label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="crime"
                                           placeholder="Enter crime type (eg: murder)" name="crime" required>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2" for="place">Place</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="place"
                                           placeholder="Enter place of crime" name="place" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <input type="submit" value="SUBMIT" class="btn btn-success">
                                </div>
                            </div>
                        </form>
                        <%
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

                </div>   <%-- end of fisrt column--%>

                <div class="col-sm-6">


                    <center> <img src="images/fir.jpg" class="img-rounded img-responsive"  width="400" style="margin-top: 8%;"></center>

                </div>

            </div>


            <%@include  file="userprofilenav.html" %>
            <br>
            <%@include  file="footer.html" %>
        </div>   <%-- end of conatiner--%>

    </body>
</html>