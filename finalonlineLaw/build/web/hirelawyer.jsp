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

        <script>
            var request;
            function sendInfo()
            {
                var v = document.getElementById("cc").value;
                var url = "lawyerslist.jsp?val=" + v;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try
                {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e)
                {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById('lawyers').innerHTML = val;
                }
            }

        </script>

        <title>Hire Lawyer</title>
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
                            out.print("<font class='report' >User: " + uname + "</font>");
                        %>
                    </div></div></div>
                    <%
                    } else {
                        request.setAttribute("Error1", "Please do login first!");
                    %>
                    <jsp:forward page="user.jsp"></jsp:forward>
                    <% }%>

                    <div class="row">
                <div class="col-sm-12" id="lawyers">
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">


                    <h2 id="userhead">Hire Lawyer</h2>

                    <form action="hirelawyer" method="post" class="form-horizontal" >
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="category">Category</label>
                            <div class="col-sm-8">
                                <select style="margin-left: 10px;" id="cc" name="cat" class="form-control" onchange="sendInfo()" required>
                                    <option value="others">Others</option>
                                    <option value="civil">Civil</option>
                                    <option value="commercial">Commercial</option>
                                    <option value="constitutional">Constitutional</option>
                                    <option value="criminal">Criminal</option>
                                    <option value="cyber">Cyber</option>
                                    <option value="personal">Personal</option>
                                    <option value="property">Property</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="id">Lawyer's ID</label>
                            <div class="col-sm-8">
                                <input style="margin-left: 10px;" type="text" class="form-control" id="lawyerid"
                                       placeholder="Enter lawyer ID" name="lid" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="victim">Lawyer's Name</label>
                            <div class="col-sm-8">
                                <input style="margin-left: 10px;" type="text" class="form-control" id="lawyername"
                                       placeholder="Enter full name" name="lname" required>
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="control-label col-sm-2" for="cname">Client's Name</label>
                            <div class="col-sm-8">
                                <input style="margin-left: 10px;" type="text" class="form-control" id="clientname"
                                       placeholder="Enter full name" name="cname" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="crime">Case
                            </label>
                            <div class="col-sm-8">
                                <input style="margin-left: 10px;" type="text" class="form-control" id="crme"
                                       placeholder="Enter type(eg: murder)" name="crime" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="date">Date</label>
                            <div class="col-sm-8">
                                <input style="margin-left: 10px;" type="date" class="form-control" id="edate"
                                        name="date" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="city">City</label>
                            <div class="col-sm-8">
                                <input style="margin-left: 10px;" type="city" class="form-control" id="city"
                                        name="city" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-6" style="margin-left: 17%">
                                <input type="submit" value="SUBMIT" class="btn btn-success">
                            </div>
                        </div>

                    </form>
                    <center>
                    <%
                        if (request.getAttribute("success") != null) {
                            String success = (String) request.getAttribute("success");
                            out.print("<font style='color:maroon; background-color : lightpink;'>" + success + "</font>");
                        } else if (request.getAttribute("failure") != null) {
                            String Error = (String) request.getAttribute("failure");
                            out.print("<font style='color:maroon; background-color : lightpink;'>" + Error + "</font>");
                        } else if (request.getAttribute("autherr") != null) {
                            String Err = (String) request.getAttribute("autherr");
                            out.print("<font style='color:maroon; background-color : lightpink;'>" + Err + "</font>");
                        }
                        %></center>
                </div>
            </div>
                <br>
            <%@include  file="userprofilenav.html" %>
            <br>

            <%@include  file="footer.html" %>
        </div>

    </body>
</html>