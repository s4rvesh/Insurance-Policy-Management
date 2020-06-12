<%@ page import="a_JDBC.jsp.*"%>
<% 
	String username= (String)session.getAttribute("agent_user");
	System.out.println(username);
    AgentProfile a =new AgentProfile();
	String tuple[] =a.agent_p(username);

%>

<style>
.form-group{
	display:inline-flex;
}
.control-label{
	width:600px;
}
.cnt{
	padding-bottom:50px;
}
label{
	font-weight:bold;
}
.selectpicker{
	width:216px;
}

</style>

<div class="container cnt">
	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap-theme.min.css">
	<link rel="stylesheet" href="bootstrapValidator.min.css">
	<form class="well form-horizontal" action="agent_p_changes.jsp" method="get"
		id="contact_form">

		<fieldset>
			<!-- Form Name -->
			<h1 style="padding-bottom: 1em;margin-top: 1em;">My Profile</h1>

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

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input name="email"
							placeholder="E-Mail Address" class="form-control" type="text" value="<%out.println(tuple[5]);%>">
					</div>
				</div>
			</div>
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
			
  <button class="btn btn-primary" type="submit" value="Submit">Save Changes</button>

		</fieldset>
	</form>
</div>
</div>
<!-- /.container -->