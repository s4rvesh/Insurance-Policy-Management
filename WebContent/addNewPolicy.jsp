
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
$(document).ready(function() {
$('#addpolbtn')
			.click(
					function() {
	
			var pname = $('#policy_name').val();
			var dur = $('#duration').val();
			var lfee = $('#late_fee').val();
			var prem = $('#premium').val();
			var comm = $('#commision').val();
			var desc = $('#policy_desc').val();
		
			$('#ad_main').load("newPolAddSuccess.jsp?policy_name="+pname+"&duration="+dur+"&late_fee="+lfee+"&premium="+prem+"&commision="+comm+"&policy_desc="+desc);
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
.form-group{
	display:inline-flex;
}
.control-label{
	width:600px;
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
	<div class="well form-horizontal">

		<fieldset>
			<!-- Form Name -->
			<h1 style="padding-bottom:50px;">Add New Policy</h1>

			
			
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Policy Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="policy_name"
							placeholder="Policy Name" class="alph form-control" type="text">
					</div>
				</div>
			</div>
			
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Duration (in months)</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="duration"
							placeholder="Duration" class="nums form-control" type="text">
					</div>
				</div>
			</div>
			
			
			<br>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Late fee</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="late_fee" placeholder="Late fee"
							class="form-control nums" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Premium</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="premium" placeholder="Premium"
							class="form-control nums" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Percentage of commission</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="commision"
							placeholder="Commission" class="nums form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->
<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Policy Description</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="policy_desc"
							placeholder="Policy Description" class="form-control" type="text">
					</div>
				</div>
			</div>
			
			<br>
			<!-- Text input-->


			<button id="addpolbtn" style="margin:14px" class="btn btn-primary">Add
				policy</button>

		</fieldset>
	</div>
</div>
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<!-- /.container -->

