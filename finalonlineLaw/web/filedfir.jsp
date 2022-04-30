<%@page import="onlineLaw.db"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="main.css" rel="stylesheet">
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                        <script>
                            var request;
                            function display()
                            {
                                var url = "searchformuser.jsp";

                                if (window.XMLHttpRequest) {
                                    request = new XMLHttpRequest();
                                } else if (window.ActiveXObject) {
                                    request = new ActiveXObject("Microsoft.XMLHTTP");
                                }

                                try
                                {
                                    request.onreadystatechange = getsearchform;
                                    request.open("GET", url, true);
                                    request.send();
                                } catch (e)
                                {
                                    alert("Unable to connect to server");
                                }
                            }

                            function getsearchform() {
                                if (request.readyState === 4) {
                                    var val = request.responseText;
                                    document.getElementById('searchform').innerHTML = val;
                                }
                            }
                            function searchmodify() {
                                var url = "usermodifysearchfir.jsp?victim=" + document.getElementById("vname").value + "&status=" + document.getElementById("status").value;

                                if (window.XMLHttpRequest) {
                                    request = new XMLHttpRequest();
                                } else if (window.ActiveXObject) {
                                    request = new ActiveXObject("Microsoft.XMLHTTP");
                                }

                                try
                                {
                                    request.onreadystatechange = getfir;
                                    request.open("GET", url, true);
                                    request.send();
                                } catch (e)
                                {
                                    alert("Unable to connect to server");
                                }
                                return false;
                            }
                            function getfir() {
                                if (request.readyState === 4) {
                                    var val = request.responseText;
                                    document.getElementById('filedfirs').innerHTML = val;
                                }
                            }
                        </script>
                        <title>Filed FIR(s)</title>
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

                                <center>
                                    <div class="row" id="welcome">
                                        <div class="col-sm-4">
                                            <h2 id="userhead">Filed FIR(s)</h2>
                                            <div id="firform">
                                                <form action="usermanagefir" method="post" class="form-horizontal" >
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-2" for="id">ID</label>
                                                        <div class="col-sm-10">
                                                            <input style="margin-left: 10px;" type="text" class="form-control" id="id"
                                                                   placeholder="Enter ID of fir to withdraw" name="id" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="submit" value="SUBMIT" class="btn btn-success"> 
                                                        </div>
                                                    </div>

                                                </form>

                                                <%
                                                    if (request.getAttribute("success") != null) {
                                                        String success = (String) request.getAttribute("success");
                                                        out.print("<font style='color:maroon; background-color:lightpink;' >" + success + "</font>");
                                                    } else if (request.getAttribute("failure") != null) {
                                                        String Error = (String) request.getAttribute("failure");
                                                        out.print("<font style='color:maroon; background-color:lightpink;'>" + Error + "</font>");
                                                    } else if (request.getAttribute("autherr") != null) {
                                                        String Err = (String) request.getAttribute("autherr");
                                                        out.print("<font style='color:maroon; background-color:lightpink;'>" + Err + "</font>");
                                                    } else if (request.getAttribute("firupdate") != null) {
                                                        String Err = (String) request.getAttribute("firupdate");
                                                        out.print("<font style='color:maroon; background-color:lightpink;'>" + Err + "</font>");
                                                    }
                                                %>
                                            </div>
                                        </div>
                                        <br>
                                            <br>
                                                <div class="col-sm-8" id="searchform">        
                                                    <button class="btn btn-success col-sm-offset-2 col-sm-2" onclick="display()">SEARCH</button>    
                                                </div>
                                                </div>
                                                <div class="row" >
                                                    <div class="col-sm-12" id="filedfirs"> 

                                                        <br>

                                                            <%
                                                                Connection con = null;
                                                                PreparedStatement ps = null;
                                                                ResultSet rs = null;
                                                                try {
                                                                    con = db.gc();
                                                                    ps = con.prepareStatement("select * from fir where username=? order by dateofaction DESC");
                                                                    ps.setString(1, (String) session.getAttribute("uname"));
                                                                    rs = ps.executeQuery();
                                                                    out.println("<div class='table-responsive'  style='overflow-y: scroll ; height : 200px;'><table class='table table-hover'>");
                                                                    out.println("<thead><tr><th>Id</th>"
                                                                            + "<th>Victim</th>"
                                                                            + "<th>Accused</th>"
                                                                            + "<th>Crime</th>"
                                                                            + "<th>Date</th>"
                                                                            + "<th>Place</th>"
                                                                            + "<th>Status</th>"
                                                                            + "</tr>"
                                                                            + "</thead><tbody>");
                                                                    while (rs.next()) {
                                                                        out.println("<tr ><td >" + rs.getString(1)
                                                                                + "</td><td>" + rs.getString(2)
                                                                                + "</td><td>" + rs.getString(3)
                                                                                + "</td><td>" + rs.getString(4)
                                                                                + "</td><td>" + rs.getString(5)
                                                                                + "</td><td>" + rs.getString(6)
                                                                                + "</td><td>" + rs.getString(7));
                                                                    }
                                                                    con.close();
                                                                } catch (Exception e) {
                                                                    System.out.println("Error : " + e);
                                                                }
                                                                out.println("</tbody>");
                                                                out.println("</table></div>");
                                                            %>

                                                            <!--</form>-->

                                                    </div>
                                                </div>
                                                </center>
                                                <%@include  file="userprofilenav.html" %>
                                                <br>
                                    <div class="row">
                                        <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px">  Enter the ID of the FIR you want to withdraw and then click submit.</div></div>
                                    <div class="row"> <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px"> To filter FIR(s) on the basis of some parameter, click on Search Button.</div></div>
                                    <div class="row"> <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px"> Modify Search either on the basis of victim's name or status of FIR or both.</div></div>
                                    <br>

                                                    <%@include file="footer.html" %>
                                                    </div>
        </body>
</html>