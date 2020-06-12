<%@ page import="JDBC.jsp.*,java.sql.*,a_JDBC.jsp.*"%>

<%
String cust=request.getParameter("cust_id");
int cust_id=Integer.parseInt(cust);
%>
<head>
<link href="dashboard/css/sb-admin.css" rel="stylesheet">
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		$("#holder").delegate('.select', 'click', function() {
			var pol_no = $(this).attr('id');
			var cust_id=<%=cust_id%>
			$('#amain').load('polAddSuccess.jsp?pol_no=' + pol_no+'&cust_id='+cust_id);
		});

	});
</script>
</head>
<body>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-5">
		<h1 class="my-4">Select Policy</h1>
	</div>
	<div class="col-md-6"></div>
</div>
<div id="holder" style="padding-left: 8em;margin-top: 1em;">
<%
	String names[] = new Prem_names().p_name();
	int nos[] = new Pol_nos().p_name();
	for(int i=0;;i++)
	{
		if(names[i]==null)
			break;
%>
	<div class="select text-center thumbnail box shade ancient-bg addpolicybox" id="<%=nos[i]%>">
	<div id="content" style="z-index: 1;opacity:1;">
		<h3 ><%=names[i] %></h3>
		<h5 style="margin-top:1em;"><%out.print("Policy no: "+nos[i]); %></h5>
	</div>
	</div>	
<%} %>
</div>
</body>