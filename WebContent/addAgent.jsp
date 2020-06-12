
<%@ page import="JDBC.jsp.*,java.sql.*,JDBC.jsp.*"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.*"%>
<%
	/* String username= (String)session.getAttribute("current_user");
	System.out.println(username);
	cust_profile c = new cust_profile();
	String tuple[] =c.cust_p(username); */
%>

<script type="text/javascript">
$(document).ready(function() {
	$('#addcustbtn')
			.click(
					function() {
			var fname = $('#first_name').val();
			console.log(fname);
			var lname = $('#last_name').val();
			console.log(lname);
			var email = $('#email').val();
			console.log(email);
			var phone = $('#phone').val();
			console.log(phone);
			var add = $('#address').val();
			console.log(add);
			var uname = $('#uname').val();
			console.log(uname);
			var passwd = $('#passd').val();
			console.log(passwd);
			$('#ad_main').load("agentAddSuccess.jsp?first_name="+fname+"&last_name="+lname+"&email="+email+"&phone="+phone+"&address="+add+"&uname="+uname+"&passd="+passwd);
	});
	
	$('.alph').keydown(function(e){
		console.log("aplh");
	    // Allow: backspace, delete, tab, escape, enter and .
	    if (e.keyCode == 32) {
	        e.preventDefault();
	    }
	    e = e || window.event;
	    var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
	    var charStr = String.fromCharCode(charCode);
	    if (/\d/.test(charStr)) {
	        return false;
	    }
		});

		$('.nums').keydown(function(e){
	    // $('#phone_number').removeClass("highlight")
	    // Allow: backspace, delete, tab, escape, enter and .
	    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 || (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || (e.keyCode >= 35 && e.keyCode <= 40)) {
	        // Allow: home, end, left, right, down, up

	        // let it happen, don't do anything
	        return;
	    }
	    // Ensure that it is a number and stop the keypress
	    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	        e.preventDefault();
	    }
		});
	
});	
</script>
<style>
.form-group {
	display: inline-flex;
}

.control-label {
	width: 600px;
}

.container {
	padding-bottom: 50px;
}

label {
	font-weight: bold;
}

.selectpicker {
	width: 216px;
}
</style>


<div class="container">
	<div class="well form-horizontal">

		<fieldset>
			<!-- Form Name -->
			<h1 style="padding-bottom: 50px;">Add new Agent</h1>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">First Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="first_name" placeholder="First Name"
							class="alph form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Last Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="last_name" placeholder="Last Name"
							class="alph form-control" type="text">
					</div>
				</div>
			</div>

			<br>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="email" placeholder="E-Mail Address"
							class="form-control" type="email">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Phone</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="phone" placeholder="(845)555-1212"
							class="nums form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Address</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="address" placeholder="Address"
							class="alph form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Username</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="uname" placeholder="Username" class="form-control"
							type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Password</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="passd" placeholder="Password" class="form-control"
							type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->


			<button id="addcustbtn" style="margin: 14px" class="btn btn-primary">Add
				Agent</button>

		</fieldset>
	</div>
</div>
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<!-- /.container -->

