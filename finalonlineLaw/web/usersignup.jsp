<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<script src="inputscripts.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
$('[data-toggle="tooltip"]').tooltip();   
});
</script>
<title>User Signup</title>
</head>
<body onload="refresh()" id="body">

<div class="container-fluid">   <%-- start of conatiner--%>

<%@include file="header.html"%>

<div class="row">
<div class="col-sm-12">

<center>
<h1>User Signup</h1>
</center>
</div>
</div>
<div class="row">
<div class="col-sm-12">
<form action="usersignup" method="post" class="form-horizontal" 
enctype="multipart/form-data">
<div class="form-group">
<label class="control-label col-sm-2" for="name">Full Name</label>
<div class="col-sm-4">
<input required type="text" class="form-control" id="name"
placeholder="Enter your full name" name="name" required>
</div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="image">Profile
Picture</label>
<div class="col-sm-4">
<input required type="file" class="form-control" id="image"
placeholder="Profile Image" name="image" required>
</div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="aadhaar">Aadhaar</label>
<div class="col-sm-4">
<input required type="text" class="form-control" id="aadhaar" maxlength="12"
placeholder="Enter aadhaar number" onblur="checkaadhar()" name="aadhaar" required>
</div>
<div class="col-sm-6 " style="margin-top: 6px; margin-left:0px"><span id="spanaadhaar" style="color:maroon;" ></span></div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="mobile">Mobile
Number</label>
<div class="col-sm-4">
<input required type="text" maxlength="10" onblur="checkmobile()" class="form-control" id="mobile"
placeholder="Enter 10 digit mobile number +91-" name="mobile">
</div>
<div class="col-sm-6" style="margin-top: 6px; margin-left:0px">  <span id="spanmobile" style="color:maroon;" ></span></div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="email">Email</label>
<div class="col-sm-4">
<input required type="text" class="form-control" id="email"
onblur="sendemail()"   placeholder="Enter valid email id" name="email" required>
</div>
<div class="col-sm-6 " style="margin-top: 6px;margin-left:0px">  <span id="span3" style="color:maroon;" ></span></div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="uname">User Name</label>
<div class="col-sm-4">
<input required type="text" class="form-control" id="uname"
placeholder="Enter username" onblur="sendusername()" name="uname" required>
</div>
<div class="col-sm-6 " style="margin-top: 6px;margin-left:0px">  <span id="span1" style="color:maroon;"></span></div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="pwd">Password</label>
<div class="col-sm-4">
<input required type="password" class="form-control" id="pwd"
placeholder="Enter password" onblur="password()" name="pwd" required>
</div>
<div class="col-sm-1" style="margin-right: 0px;"><a href="#" data-toggle="tooltip" title="Password should contain letters,numbers and !/@/#/$/& and should be atleast 8 characters long." data-placement="right" ><img src="images/question.png" height="15px" width="15px" style="margin-top: 5%;"> </a>
</div>
<div class="col-sm-5" style="margin-top: 4px; margin-left:0px">  <span id="spanpwd" style="color:maroon;"></span>
</div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="cpwd">Confirm
Password</label>
<div class="col-sm-4">
<input required type="password" class="form-control" id="cpwd"
placeholder="Enter password" onblur="checkpassword()" name="cpwd" required>
</div>
<div class="col-sm-6" style="margin-top: 6px;margin-left:0px">  <span id="spancpwd" style="color:maroon;"></span></div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="captcha">
Captcha</label>
<div class="col-sm-2">
<img class="img-responsive img-rounded" src="" id="captcha" height="100" width="250" name="c" />
</div>
<div class="col-sm-4" style="float:left;">
<button onclick="return refresh()"  title="Click to refresh captcha"  name="cap" id="catext"><img src="images/reload.png" height="30px" width="30px"></button>
</div>
</div>
    
<div class="form-group">
<label class="control-label col-sm-2" for="captcha">
Enter Captcha</label>
<div class="col-sm-4">
<input type="text" class="form-control" placeholder="Enter the text shown in captcha" required name="captcha" id="caha" required>
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<input required type="submit" value="SUBMIT" class="btn btn-default">
</div>
</div>
    
</form>
</div>
</div>

<%
if (request.getAttribute("failure") != null) {
String Error = (String) request.getAttribute("failure");
out.print("<font style='color:maroon; background-color:lightpink;'>" + Error + "</font>");
} else if (request.getAttribute("captchastatus") != null) {
String Error = (String) request.getAttribute("captchastatus");
out.print("<font style='color:maroon; background-color:lightpink;'>" + Error + "</font>");
}
%>
<div class="alert alert-warning">
<strong>Warning!</strong> Please verify your Aadhaar Number before filling the form. To verify <a target="_blank" href="https://resident.uidai.gov.in/aadhaarverification">Click Here</a>
</div>
<%@include file="footer.html"%>
</div>
</body>
</html>