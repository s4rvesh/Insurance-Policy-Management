<%@ page import="JDBC.jsp.*"%>

<%
	String msg = "";
	boolean isPost = "POST".equals(request.getMethod());

	if (isPost == true) {
		if (request.getParameter("userC") != null && request.getParameter("passC") != null) {
			if ((request.getParameter("userC").equals("admin")) && (request.getParameter("passC").equals("admin"))) {
				response.sendRedirect("admin.jsp");
			} else {
				msg = "*Invalid Username or Password.";
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>


<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="CSS/style.css">


</head>

<body>
	<form action="adminlogin.jsp" method="post">
		<!--<img src="CSS/logo.jpeg"  style="position: absolute; left:15%;top:7%;width:25%">-->
		<img src="CSS/logo3.jpg"
			style="position: absolute; left: 10%; top: 13%; width: 35%; height: 75%;">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
					for="tab-1" class="tab">Admin</label> <input id="tab-2"
					type="radio" name="tab" class="sign-up"><label for="tab-2"
					class="tab"></label>
				<div class="login-form">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">Username</label> <input
								id="userC" name="userC" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input
								id="passC" name="passC" type="password" class="input"
								data-type="password">
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
					<h2 style="color: red">
						<%
							out.println(msg);
						%>
					</h2>
					</div>
					

				</div>
			</div>
		</div>
	</form>

</body>
</html>
