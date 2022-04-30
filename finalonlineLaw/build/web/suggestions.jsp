<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
        
        <title>User</title>
        <script>
            var request;
            function down(i)
            {               
                var url = "forum?id=" + i + "&vote=downvote";


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
                //   return false;
            }
            function up(i)
            {
                var url = "forum?id=" + i + "&vote=upvote";


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
            function post_forum()
            {
                var url = "post_forum?text=" + document.getElementById("text1").value;


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
                return false;
            }

            function getInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById("div1").innerHTML = val;
                }
            }
        </script>

    </head>
    <body id="body">

        <div class="container-fluid">
            <%@include  file="header.html" %>

            <center>
                <h1>Suggestions</h1>
       
                    <div style="width:80%;">
                    <div id="div1" >                   
                        <%
                            try {
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "shivashukla", "system");
                                PreparedStatement ps = con.prepareStatement("select u.username, u.profile_image from forum f join userp u on( u.username = f.username ) order by id");
                                Blob image = null;
                                ResultSet rs = null;
                                rs = ps.executeQuery();
                                byte[] imagedata = null;
                                int i = 1;
                                while (rs.next()) {
                                    image = rs.getBlob(2);
                                    imagedata = image.getBytes(1, (int) image.length());
                                    FileOutputStream fout = new FileOutputStream("C:\\Users\\shiva\\Desktop\\project\\finalonlineLaw\\web\\images\\" + rs.getString(1) + ".jpg");
                                    fout.write(imagedata);
                                    fout.flush();
                                }
                                java.lang.Thread.sleep(2000);
                                ps = con.prepareStatement("select u.username, f.text, u.profile_image, f.upvote, f.downvote from forum f join userp u on( u.username = f.username ) order by id");
                                rs = ps.executeQuery();
                                while (rs.next()) {
                                    out.println(" <div class='row'>");
                                    out.println("<div class=' col-sm-2' >"
                                            + "<img src='images/" + rs.getString(1) + ".jpg'  width='100' class='img-responsive img-circle' /></div>");
                                    out.println(" <div class='col-sm-10'style=' "
                                            + "margin-top:1%; text-align:left;  '> "
                                            + "<font size=4 color='blue'  ><span id='u" + i + "' >" + rs.getString(1) + "</span></font><br/><br/><div style='width:100%;height:100px;overflow:auto;'>" + rs.getString(2) + "</div>");

                                    out.println("<br/> <button  onclick='up(" + i + ")' class=\"btn btn-default btn-sm\">"
                                            + "<span class=\"glyphicon glyphicon-thumbs-up\"></span>Upvote<br><sub>" + rs.getInt(4) + "<sub>"
                                            + "</button>");
                                    out.println(" <button onclick='down(" + i + ")'  class=\"btn btn-default btn-sm\">"
                                            + "<span class=\"glyphicon glyphicon-thumbs-down\"></span>Downvote<br><sub>" + rs.getInt(5) + "<sub>"
                                            + "</button> </div></div><hr>");

                                    ++i;
                                }
                                con.close();
                            } catch (Exception e) {
                                System.out.println(e);
                            }
                        %>

                        <br>
                        <br>
                        <form class="form-horizontal" action="" onsubmit="return post_forum()" method="post" style="margin-left: 3%;">

                            <div class="form-group">

                                <div class="col-sm-10"  >          
                                    <textarea name="text" id="text1" class="form-control" style="width: 100% ;max-width: 100%;max-height: 90%; height: 100%"> </textarea>
                                </div>
                            </div>
                            <div class="form-group">        
                                <div class="col-sm-2">
                                    <button type="submit"  class="btn btn-default" style="float:left;">Post</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div> 
            </center>
            <%@include  file="footer.html" %>
        </div>
    </body>