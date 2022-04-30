var request;
function sendusername()
{
    var url = "username?username=" + document.getElementById("uname").value;

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }

    try
    {
        request.onreadystatechange = usernameInfo;
        request.open("GET", url, true);
        request.send();
    } catch (e)
    {
        alert("Unable to connect to server");
    }
}

function usernameInfo() {
    if (request.readyState == 4) {
        var val = request.responseText;
        document.getElementById('span1').innerHTML = val;
    }
}

function sendemail()
{
    var url = "email?email=" + document.getElementById("email").value;

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }

    try
    {
        request.onreadystatechange = emailInfo;
        request.open("GET", url, true);
        request.send();
    } catch (e)
    {
        alert("Unable to connect to server");
    }
}

function emailInfo() {
    if (request.readyState == 4) {
        var val = request.responseText;
        document.getElementById('span3').innerHTML = val;
    }
}
function refresh()
{
    document.getElementById("captcha").src = 'Captcha?' + Math.random();
    return false;
}
function checkmobile()
{
    var x = document.getElementById("mobile");
    if (x.value.length < 10)
    {
        document.getElementById("spanmobile").innerHTML = "Please enter valid mobile number ( 10 digits ).";
    } else
        document.getElementById("spanmobile").innerHTML = "";
}
function checkaadhar()
{
    var x = document.getElementById("aadhaar");
    if (x.value.length < 12)
    {
        document.getElementById("spanaadhaar").innerHTML = "Please enter valid aadhar number ( 12 digits ).";
        return false;
    } else
        document.getElementById("spanaadhaar").innerHTML = "";
}
function password()
{
    var x = document.getElementById("pwd");
    len = x.value.length;
    if (len < 8)
    {
        document.getElementById("spanpwd").innerHTML = "Password must contain at least 8 characters.";
        return;
    } else
        document.getElementById("spanpwd").innerHTML = "";

    var s1 = "", s2 = "", s3 = "";

    s1 = x.value.match(/[A-Za-z]/g);
    s2 = x.value.match(/[0-9]/g);
    s3 = x.value.match(/[!@#$&]/g);


    if (s1 == null || s2 == null || s3 == null) {

        document.getElementById("spanpwd").innerHTML = "Password should be alphanumeric and contains special characters among (@,#,$,&,!)";

        return;
    } else
        document.getElementById("spanpwd").innerHTML = "";
}
function checkpassword()
{
    var x = document.getElementById("pwd");
    var x1 = document.getElementById("cpwd");
    if (!(x.value === x1.value))
    {
        document.getElementById("spancpwd").innerHTML = "Passwords don't match. Please re-enter!";
        x1.value = "";
        return;
    } else
        document.getElementById("spancpwd").innerHTML = "";
}
function setDate() {
    var d = new Date();
    var n = d.toLocaleString();
    var dd = n.substring(0, 1);
    var mm = n.substring(2, 3);
    var yy = n.substring(4, 8);
    if (dd < 10)
        dd = '0' + dd;
    if (mm < 10)
        mm = '0' + mm;
    document.getElementById("date").defaultValue = dd + "/" + mm + "/" + yy;
}