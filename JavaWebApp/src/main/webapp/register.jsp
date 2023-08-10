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
<!-- <form action="registeruser.jsp" method="post"> -->
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
<th>Gender</th>
<td>
Male : <input type="radio" value="Male" id="gen1" name="gender" checked="checked">
Female : <input type="radio" value="Female" id="gen1" name="gender" >
 

</td>
</tr>
<tr>
<th>Address</th>
<td>
<textarea rows="5" cols="20" id="address" name="address"></textarea>

</td>
</tr>
<tr>
<th>Password</th>
<td><input type="text" id="password" name="password" required></td>
</tr>
<tr>
<th></th>
<td><input type="button" id="btn" value="REGISTER" ></td>
</tr>
</table>
<!-- </form> -->

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
<script src="JS/jquery.js"></script>
<script>
$("document").ready(function(){
	$("#btn").click(function(){
	var name=$("#name").val();
	var contact=$("#contact").val();
	var gen=$("#gen1").val();
	var address=$("#address").val();
	var password=$("#password").val();
	//alert(name+email+contact+gen+address+password);
	$.post("registeruser.jsp",{name:name, email:email, contact:contact, gender:gen, address:address, password:password}, function(data){
alert(data);
$("#name").val(" ");
$("#email").val(" ");
$("#contact").val(" ");
$("#address").val(" ");
$("#password").val(" ");
		});
		});
});
</script>