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
        <title>Add Law</title>
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


                    <h2 id="userhead">Add Law</h2>
                    <div id="firform">
                        <form action="addlaw" method="post" class="form-horizontal" enctype="multipart/form-data" >
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="section">IPC Section</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="section"
                                           placeholder="Enter section of IPC" name="section">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="cc">Category</label>
                                <div class="col-sm-10">
                                    <select id="cc" name="category" class="form-control" style="margin-left: 10px;" required>
                                        <option value="none">None</option>
                                        <option value="commercial">Commercial</option>
                                        <option Value="civil">Civil</option>
                                        <option Value="criminal">Criminal</option>
                                        <option Value="cyber">Cyber</option>
                                        <option Value="education">Education</option>
                                        <option Value="property">Property</option>                                                                                                       
                                        <option Value="taxation">Taxation</option>                                                           
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="title">Title
                                </label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="title"
                                           placeholder="Enter title" name="title" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="state">State</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="state"
                                           placeholder="Law of particular state" name="state" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="year">Year</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="text" class="form-control" id="state"
                                           placeholder="Law published in year" name="year" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="file">PDF</label>
                                <div class="col-sm-10">
                                    <input style="margin-left: 10px;" type="file" class="form-control" id="file"
                                           name="file" required>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class=" col-sm-10">
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


                   <center> <img src="images/addlaw.jpg" class="img-rounded img-responsive"  width="500" style="margin-top: 8%;"></center>
                </div>

            </div>


           <%@include  file="adminprofilenav.html" %>
           <br>
            <%@include  file="footer.html" %>
        </div>   <%-- end of conatiner--%>

    </body>
</html>