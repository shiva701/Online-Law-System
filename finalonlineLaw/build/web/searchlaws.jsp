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
        <title>Search Laws</title>
    </head>
    <body id="body">


        <div class="container-fluid">
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

                <div class="col-sm-6">
                    <h2 id="userhead">Search Laws</h2>

                    <form action="lawsearched.jsp" method="post" class="form-horizontal" >

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="category">*Category</label>
                            <div class="col-sm-8">
                                <select id="cc" name="category" class="form-control" required>
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
                            <label class="control-label col-sm-2" for="state">*State</label>
                            <div class="col-sm-8">
                                <select id="cc" name="state" class="form-control" required>
                                    <option value="none">None</option>
                                    <option value="all">All(IPC)</option>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                    <option Value="Assam">Assam</option>
                                    <option Value="Bihar">Bihar</option>
                                    <option Value="Chattisgarh">Chattisgarh</option>
                                    <option Value="Delhi">Delhi</option>
                                    <option Value="Goa">Goa</option>
                                    <option Value="Gujarat">Gujarat</option>
                                    <option Value="Haryana">Haryana</option>                               
                                    <option Value="Himachal Pradesh">Himachal Pradesh</option>                                
                                    <option Value="Jammu & Kashmir">Jammu & Kashmir</option>
                                    <option Value="Jharkhand">Jharkhand</option>
                                    <option Value="Karnataka">Karnataka</option>
                                    <option Value="Kerela">Kerela</option>
                                    <option Value="Madhya Pradesh">Madhya Pradesh</option>
                                    <option Value="Maharashtra">Maharashtra</option>
                                    <option Value="Manipur">Manipur</option>
                                    <option Value="Meghalaya">Meghalaya</option>
                                    <option Value="Mizoram">Mizoram</option>
                                    <option Value="Nagaland">Nagaland</option>
                                    <option Value="Orissa">Orissa</option>
                                    <option Value="Chattisgarh">Puducherry</option>
                                    <option Value="Punjab">Punjab</option>
                                    <option Value="Rajasthan">Rajasthan</option>
                                    <option Value="Sikkim">Sikkim</option>
                                    <option Value="Tamilnadu">Tamilnadu</option>
                                    <option Value="Telangana">Telangana</option>
                                    <option Value="Tripura">Tripura</option>
                                    <option Value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option Value="Uttarakhand">Uttarakhand</option>
                                    <option Value="West Bengal">West Bengal</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-4" style="margin-left: 17%;">
                                <input type="submit" value="SEARCH" class="btn btn-success">
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
                <div class="col-sm-6">    
                    <center> <img src="images/law.jpg" class="img-rounded img-responsive" width="500"  style="margin-top: 6%;"></center>
                </div>
            </div>
            <%@include  file="userprofilenav.html" %>
            <div class="row">
                                        <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px">  Fields with * are necessary.</div></div>
            <br>       
            <%@include  file="footer.html" %>
        </div>  
    </body>
</html>
