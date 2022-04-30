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
        <script src="inputscripts.js"></script>
        <title>Add Lawyer</title>
    </head>
    <body id="body">

        <div class="container-fluid">   <%-- start of conatiner--%>

            <%@include  file="header.html" %>

            <div class="row">
                <div class="col-sm-12">
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
            </div>
            <%
            } else {
                request.setAttribute("Error1", "Please do login first!");
            %>

            <jsp:forward page="admin.jsp"></jsp:forward>
            <% }%>

            <div class="row">
                <div class="col-sm-6">


                    <h2 id="userhead">Add Lawyer</h2>
                    <div id="firform">
                        <form action="addlawyer" method="post" class="form-horizontal" >
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="name">Name</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="lname"
                                           placeholder="Enter full name" name="name" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="expertise">Expertise</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="expertise"
                                           placeholder="Enter Expertise" name="expertise" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="mobile">Mobile
                                </label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="mobile" maxlength="10" onblur="checkmobile()"
                                           placeholder="+91- (10 digits)" name="mobile">
                                    <div class="col-sm-10" style="margin-top: 6px; margin-left:0px">  <span id="spanmobile" style="color:maroon;" ></span></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Email</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="mail"
                                           placeholder="xyz@gmail.com" name="email" required>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2" for="fees">Fees</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="fees"
                                           placeholder="Enter fees in Rs." name="fees" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <input type="submit" value="ADD" class="btn btn-success">
                                </div>
                            </div>
                        </form>
                        <%
                            if (request.getAttribute("success") != null) {
                                String success = (String) request.getAttribute("success");
                                out.print("<font style='color:maroon; background-color:lightpink;'>" + success + "</font>");
                            } else if (request.getAttribute("failure") != null) {
                                String Error = (String) request.getAttribute("failure");
                                out.print("<font style='color:maroon; background-color:lightpink;'>" + Error + "</font>");
                            } else if (request.getAttribute("autherr") != null) {
                                String Err = (String) request.getAttribute("autherr");
                                out.print("<font style='color:maroon; background-color:lightpink;'>" + Err + "</font>");
                            }
                        %>
                    </div>

                </div>   <%-- end of fisrt column--%>

                <div class="col-sm-6">


                   <center> <img src="images/lawer.png" class="img-rounded img-responsive"  width="300" style="margin-top: 6%;"></center>
                </div>

            </div>


           <%@include  file="adminprofilenav.html" %>
           <br>


            <%@include  file="footer.html" %>

        </div>   <%-- end of conatiner--%>
    </body>
</html>