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
                        <title>Manage FIR</title>
                        <script>
                            var request;
                            function sendInfo(i)
                            {
                                var x = "updtstatus" + i;
                                var y = "editbtn" + i;
                                var id = document.getElementById(y.toString()).innerHTML;
                                var stat = document.getElementById(x.toString()).value;
                                var url = "adminmanage_fir.jsp?id=" + id + "&status=" + stat;

                                if (window.XMLHttpRequest) {
                                    request = new XMLHttpRequest();
                                } else if (window.ActiveXObject) {
                                    request = new ActiveXObject("Microsoft.XMLHTTP");
                                }

                                try
                                {
                                    request.onreadystatechange = Info;
                                    request.open("GET", url, true);
                                    request.send();
                                } catch (e)
                                {
                                    alert("Unable to connect to server");
                                }
                            }

                            function Info() {
                                if (request.readyState == 4) {
                                    var val = request.responseText;
                                    document.getElementById('firupdated').innerHTML = val;
                                }
                            }

                            function display()
                            {
                                var url = "searchformadmin.jsp";

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
                                if (request.readyState === 4) {
                                    var val = request.responseText;
                                    document.getElementById('searchform').innerHTML = val;
                                }
                            }

                            function searchmodify() {

                                var url = "adminmodifysearchfir.jsp?victim=" + document.getElementById("vname").value + "&status=" + document.getElementById("status").value;

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
                                    document.getElementById('firupdated').innerHTML = val;
                                }
                            }
                        </script>
                        </head>
                        <body id="body">
                            <div class="container-fluid"> 
                                <%@include  file="header.html" %>
                                <%!String s = "";%>

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


                                <center>
                                    <div class="row" id="welcome">
                                        <div class="col-sm-6">
                                            <h2 id="userhead">Manage FIR</h2>
                                        </div>

                                        <div class="col-sm-6" id="searchform">        
                                            <button class="btn btn-success col-sm-offset-2 col-sm-2" onclick="display()">SEARCH</button>    
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12" id="firupdated">

                                            <br>

                                                <%
                                                    Connection con = null;
                                                    PreparedStatement ps = null;
                                                    ResultSet rs = null;
                                                    try {
                                                        con = db.gc();
                                                        ps = con.prepareStatement("select * from fir order by dateofaction DESC");
                                                        rs = ps.executeQuery();
                                                        out.println("<div id='fir' class='table-responsive' style='overflow-y: scroll ; height : 300px;'><table class='table table-hover'>");
                                                        out.println("<thead><tr><th>Id</th>"
                                                                + "<th>Victim</th>"
                                                                + "<th>Accused</th>"
                                                                + "<th>Crime</th>"
                                                                + "<th>Date</th>"
                                                                + "<th>Place</th>"
                                                                + "<th>Current Status</th>"
                                                                + "<th>Update Status</th></tr>"
                                                                + "</thead><tbody>");
                                                        int i = 1;
                                                        while (rs.next()) {

                                                            out.println("<tr><td ><button class='btn btn-danger' id='editbtn" + i + "' onclick='sendInfo(" + i + ")'>" + rs.getString(1) + "</button></td>"
                                                                    + "</td><td>" + rs.getString(2)
                                                                    + "</td><td>" + rs.getString(3)
                                                                    + "</td><td>" + rs.getString(4)
                                                                    + "</td><td>" + rs.getString(5)
                                                                    + "</td><td>" + rs.getString(6)
                                                                    + "</td><td>" + rs.getString(7)
                                                                    + "</td><td><select id='updtstatus" + i + "'> <option value='none'>Select one</option><option value='closed'>Closed</option><option value='under processing'>Under Processing</option><option value='resolved'>Resolved</option></select></td></tr>");
                                                            i++;
                                                        }
                                                        con.close();
                                                    } catch (Exception e) {
                                                        System.out.println("Error : " + e);
                                                    }
                                                    out.println("</tbody>");
                                                    out.println("</table></div>");
                                                %>


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
                                    </div>
                                </center>
                                <%@include  file="adminprofilenav.html" %>
                                <br>
                                    <div class="row">
                                        <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px">  Select the new status of the FIR in update status column and then click on respective ID to update.</div></div>
                                    <div class="row"> <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px"> To filter FIR(s) on the basis of some parameter, click on Search Button.</div></div>
                                    <div class="row"> <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px"> Modify Search either on the basis of victim's name or status of FIR or both.</div></div>
                                    <br>
                                        <%@include file="footer.html" %>
                                        </div>

                                        </body>
                                        </html>