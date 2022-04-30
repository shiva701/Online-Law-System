<%@page import="onlineLaw.db"%>
<%@page import="java.sql.*"%>
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
        <title>Lawyer Profile</title>
        <script>
            var request;
            function sendInfo(i)
            {
                var x = "updtstatus" + i;
                var y = "editbtn" + i;
                var id = document.getElementById(y.toString()).innerHTML;
                var stat = document.getElementById(x.toString()).value;
                var url = "lawyercaseupdate?caseid=" + id + "&status=" + stat;

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
                    document.getElementById('caselist').innerHTML = val;
                }
            }
        </script>
    </head>
    <body id="body">
        <%!String lawyer = "";%>
        <div class="container-fluid">

            <%@include  file="header.html" %>
            <div class="row">
                <%
                    if (session.getAttribute("lawyer") != null) {
                        lawyer = (String) session.getAttribute("lawyer");
                %>
                <div id="welcome">
                    <%
                        out.print("<font class='report' >Welcome " + lawyer + "</font>");
                    %>
                </div> </div>
                <%
                } else {
                    request.setAttribute("Error1", "Please do login first!");
                %>
                <jsp:forward page="lawyerlogin.jsp"></jsp:forward>
                <%}%>

            <div class="row" id="userhead">
                <h2>List Of Case Requests</h2>
            </div>
            <div class="row">
                <div class="col-sm-12" id="caselist">
                    <%
                        try {
                            Connection con = db.gc();
                            PreparedStatement ps = con.prepareStatement("select * from lawyercase where lawyer_id=? order by expected_date DESC");
                            ps.setString(1, lawyer);
                            ResultSet rs = ps.executeQuery();
                            out.println("<div id='lawyercase' class='table-responsive' style='overflow-y: scroll ; height : 300px;'><table class='table table-hover'>");
                            out.println("<thead><tr><th>Case ID</th>"
                                    + "<th>Client Name</th>"
                                    + "<th>Case</th>"
                                    + "<th>Client Email</th>"
                                    + "<th>Expected Date</th>"
                                    + "<th>City</th>"
                                    + "<th>Current Status</th>"
                                    + "<th>Update Status</th></tr>"
                                    + "</thead><tbody>");
                            int i = 1;
                            while (rs.next()) {

                                out.println("<tr><td ><button class='btn btn-danger' id='editbtn" + i + "' onclick='sendInfo(" + i + ")'>" + rs.getString(1) + "</button></td>"
                                        + "</td><td>" + rs.getString(3)
                                        + "</td><td>" + rs.getString(4)
                                        + "</td><td>" + rs.getString(5)
                                        + "</td><td>" + rs.getString(6)
                                        + "</td><td>" + rs.getString(9)
                                        + "</td><td>" + rs.getString(7)
                                        + "</td><td><select id='updtstatus" + i + "'> <option value='none'>Select one</option><option value='accepted'>Accept</option><option value='rejected'>Reject</option></tr>");
                                i++;
                            }
                            con.close();
                        } catch (Exception e) {
                            System.out.println("Error : " + e);
                        }
                        out.println("</tbody>");
                        out.println("</table></div>");
                    %> 
                </div>
            </div>
            <br>
            <row class="row">
                <form action="lawyerlogout" method="post">
                    <button class="btn btn-danger">LOGOUT</button>
                </form>
            </row>
            <br>
            <div class="row"> <div class="col-sm-10"><img src="images/note.png" height="30px" width="20px"> Select status and then click on particular CASEID to update.</div></div>
            <br>
            <%@include  file="footer.html" %>
        </div>
    </body>
</html>
