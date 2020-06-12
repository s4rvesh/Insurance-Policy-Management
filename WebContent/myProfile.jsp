<%@ page import="JDBC.jsp.*"%>
<% 
	String username= (String)session.getAttribute("current_user");
	System.out.println(username);
    cust_profile c = new cust_profile();
	String tuple[] =c.cust_p(username);

%>

<style>
.form-group{
	display:inline-flex;
}
.control-label{
	width:600px !important;
}
.container{
	padding-bottom:50px;
}
label{
	font-weight:bold;
}
.selectpicker{
	width:216px;
}

</style>


<div class="container">
	<link rel="stylesheet" href="dashboard/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="dashboard/vendor/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="dashboard/vendor/bootstrap/css/bootstrapValidator.min.css">
	<form class="well form-horizontal" action="cust_p_changes.jsp" method="get"
		id="contact_form">

		<fieldset>
			<!-- Form Name -->
			<h1 style="padding-bottom: 1em;padding-top: 0.5em;margin-left:1%;">My Profile</h1>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">First Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="first_name"
							placeholder="First Name" class="form-control" type="text" value="<%out.println(tuple[0]);%>">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Middle Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="middle_name"
							placeholder="First Name" class="form-control" type="text" value="<%out.println(tuple[1]);%>">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Last Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="last_name"
							placeholder="Last Name" class="form-control" type="text" value="<%out.println(tuple[2]);%>">
					</div>
				</div>
			</div>
`			<br>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="email"
							placeholder="E-Mail Address" class="form-control" type="text" value="<%out.println(tuple[6]);%>">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Phone</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="phone"
							placeholder="(845)555-1212" class="form-control" type="text" value="<%out.println(tuple[4]);%>">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Address</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="address"
							placeholder="Address" class="form-control" type="text" value="<%out.println(tuple[3]);%>">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Date Of Birth</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="city"
							placeholder="city" class="form-control" type="text" value="<%out.println(tuple[5]);%>">
					</div>
				</div>
			</div>
      		<br>

  <button class="btn btn-primary" type="submit" style="margin-top:3em;" value="Submit">Save Changes</button>

		</fieldset>
	</form>
</div>
</div>
<!-- /.container -->