<html>
<head>
<title>KVCH Noida</title>
<link rel="stylesheet" href="css/style.css"> 
</head>
<body>
<div>
<div id="header">KVCH NOIDA</div>
<div id="content">
<div id="leftbar">
<ul id="menubar">
<li><a href="index.jsp">home</a></li>
<li><a href="about.jsp">about</a></li>
<li><a href="service.jsp">service</a></li>
<li><a href="contact.jsp">contact</a></li>
<li><a href="register.jsp">register</a></li>
</ul>
<center>
<!-- <form action="contactform.jsp" method="post"> -->
<table border=1>
<tr>
<th>Name</th>
<td><input type="text" id="name" name="name" required></td>
</tr>
<tr>
<th>Email</th>
<td><input type="email" id="email" name="email" required></td>
</tr>
<tr>
<th>Contact</th>
<td><input type="text" id="contact" name="contact" required></td>
</tr>

<tr>
<th>Message</th>
<td>
<textarea rows="5" cols="20" id="message" name="message"></textarea>

</td>
</tr>
<tr>

<tr>
<th></th>
<td><input type="button" id="btn" value="REGISTER" ></td>
</tr>
</table>

</center>
</div>
<div id="rightbar">
<center>
<fieldset id="loginbar">
<legend>LOGIN</legend>
<form action="login.jsp" method="post">
<table border=1>
<tr>
<th>Email</th>
<td><input type="email" id="email" name="email" required /></td>
</tr>
<tr>
<th>Password</th>
<td><input type="password" id="password" name="password" required /></td>
</tr>
<tr>
<th></th>
<td><input type="submit" value="LOGIN" /></td>
</tr>
</table>
</form>
</fieldset>
</center>

</div>
</div>
<div id="footer">Developed by Siddhant & Team</div>
</div>
</body>
</html>
<script src="JS/jquery.js">
</script>
<script>
$("document").ready(function(){
//alert();
$("#btn").click(function()
{
var name=$("#name").val();
var email=$("#email").val();
var contact=$("#contact").val();
var message = $("#message").val();
//alert(name+" "+email+" "+contact+" "+message);

$.post("contactform.jsp",{name:name,contact:contact,email:email,message:message},function(data){
alert(data);
$("#name").val(" ");
$("#email").val(" ");
$("#contact").val(" ");
$("#message").val(" ");
});

});
});


</script>