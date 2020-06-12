
<%@ page import="JDBC.jsp.*,java.sql.*,JDBC.jsp.*"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	/* String username= (String)session.getAttribute("current_user");
	System.out.println(username);
	cust_profile c = new cust_profile();
	String tuple[] =c.cust_p(username); */
%>

<script type="text/javascript">
$(document).ready(function(){
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
	$('#addcustbtn')
			.click(
					function() {
	
			console.log("Tesitingertghjgf");
			var policy = $('#policy').val();
			console.log(policy);
			var fname = $('#first_name').val();
			console.log(fname);
			var mname = $('#middle_name').val();
			console.log(mname);
			var lname = $('#last_name').val();
			console.log(lname);
			var email = $('#email').val();
			console.log(email);
			var phone = $('#phone').val();
			console.log(phone);
			var add = $('#address').val();
			console.log(add);
			var dob = $('#dob').val();
			console.log(dob);
			var uname = $('#uname').val();
			console.log(uname);
			var passwd = $('#passd').val();
			console.log(passwd);
			var desig = $('#desig').val();
			console.log(desig);
			$('#amain').load("custAddSuccess.jsp?policy="+policy+"&first_name="+fname+"&middle_name="+mname+"&last_name="+lname+"&email="+email+"&phone="+phone+"&address="+add+"&dob="+dob+"&uname="+uname+"&passd="+passwd+"&desig="+desig);
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


<div class="container" id="total">
	<div class="well form-horizontal">

		<fieldset>
			<!-- Form Name -->
			<h1 style="padding-bottom: 50px;">Add new Customer</h1>

			<div class="form-group has-feedback">
				<label class="col-md-4 control-label">Designation</label>
				<div class="col-md-4 selectContainer">
					<div class="input-group">
						<select id="desig" class="form-control selectpicker"
							data-bv-field="state" style="width: 216px;">
							<option value=" ">Designation</option>
							<option>Mr.</option>
							<option>Mrs.</option>
							<option>Master</option>
							<option>Miss</option>
						</select>
					</div>
					<small data-bv-validator="notEmpty" data-bv-validator-for="state"
						class="help-block" style="display: none;">Please select
						your state</small>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">First Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="first_name" placeholder="First Name"
							class="form-control alph" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Middle Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="middle_name"  placeholder="Middle Name"
							class="form-control alph" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Last Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="last_name" class="form-control alph" placeholder="Last Name"
							 type="text">
					</div>
				</div>
			</div>


			<br>
			<div class="form-group has-feedback">
				<label class="col-md-4 control-label">Select Policy</label>
				<div class="col-md-4 selectContainer">
					<div class="input-group">
						<select id="policy" class="form-control selectpicker"
							data-bv-field="state" style="width: 216px;">
							<option value=" ">Select Policy</option>

							<%
								String policies[] = new String[10];
								int polno[] = new int[10];
								String sql1 = "select pol_no,p_name from policy";
								try {
									Connection conn = new Connect().myDBConnect();
									Statement stmt1 = conn.createStatement();
									ResultSet rs1 = stmt1.executeQuery(sql1);
									int count = 0;
									while (rs1.next()) {
										policies[count] = rs1.getString("p_name");
										polno[count] = rs1.getInt("pol_no");
										count++;
									}
									for (int i = 0; i < count; i++) {
										/* policies[i]= rs1.getString("p_name"); */
										/* polno[i]= rs1.getInt("pol_no"); */
							%>
							<option value="<%out.print(polno[i]);%>"><%out.print(policies[i]);%></option>
							<%
								}
									conn.close();
								} catch (Exception e) {
									System.out.println(e);
								}
							%>

						</select>
					</div>
					<small data-bv-validator="notEmpty" data-bv-validator-for="state"
						class="help-block" style="display: none;">Please select
						your state</small>
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
							class="form-control nums" type="text">
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
							class="form-control alph" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Date Of Birth</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="dob" placeholder="Date of Birth" class="form-control"
							type="date" style="width: 216px;">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Username</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="uname" placeholder="Username" class="form-control alph"
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
				customer</button>

		</fieldset>
	</div>
</div>
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<!-- /.container -->

