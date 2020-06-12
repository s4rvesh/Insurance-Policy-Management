<%@ page import="java.sql.*,JDBC.jsp.*,a_JDBC.jsp.*"%>

					<%
						String r_name=request.getParameter("name");
						int agent_id = (Integer) session.getAttribute("Id");
						int pols[] = new int[30];
						int day_diff[] = new int[30];
						int cust_id[] = new int[30];
						int pol_no[] = new int[30];
						int cnt = 0, acnt = 0;
						int details[][] = new Details().c_details(agent_id);

						/*int day_diff[] = new int[30];
						String sql1 = "select pol_no from customer_policy where cust_id=?";*/
						//String sql2 = "select datediff(curdate(),?)";
						for (int i = 0; i < 30; i++) {
							if (details[i][1] == 0) {
								break;
							} else {
								cust_id[cnt] = details[i][0];
								pol_no[cnt] = details[i][1];
								day_diff[cnt] = new Premium().date(cust_id[cnt], pol_no[cnt]);
								cnt++;
							}
						}
						for (acnt = 0; acnt < cnt; acnt++) {
							String name[] = new Cust_name().c_name(cust_id[acnt]);
							String first = name[0];
							String mid = name[1];
							String last = name[2];
							String full = first + " " + mid + " " + last;
							if ((!full.toLowerCase().contains(r_name.toLowerCase())))
								continue;
					%>
					<!-- Project One -->



					<div class="row"
						style="text-align: center; margin-top: 3em; padding: 0;">


						<div class="col-md-1">

							<span style="font-size: 1em;"> <%
 	out.println(acnt + 1);
 %>
							</span>


						</div>
						<div class="col-md-3">
							<span style="font-size: 1.0em;font-weight:700;"> <%
 	out.println(full);
 %>
							</span>
						</div>



						<div class="col-md-2">

							<span style="font-size: 1em;"> <%
 	out.println(new Prem_name().p_name(pol_no[acnt]));
 %>
							</span>

						</div>

						<div class="col-md-2">

							<span style="font-size: 1em;"> <%
 	int prem[] = new Prem_amount().p_details(pol_no[acnt]);
 		out.println(prem[0]);
 %>
							</span>


						</div>


						<div class="col-md-1">

							<span style="font-size: 1em;"> <%
 	if (day_diff[acnt] < 0) {
 			out.println("<span style='color:red'>Late</span>");
 		} else if (day_diff[acnt] == 0) {
 			out.println("<span style='color:red'>Today</span>");
 		} else if (day_diff[acnt] > 0) {

 			out.println(day_diff[acnt] + " days");
 			//+ " days on " + new Prem_date().due_date(id, pols[acnt]) + ".");

 		}
 %>
							</span>

						</div>


						<div class="col-md-2">
							<span style="font-size: 1em; padding-left: 1.8em;"> <%
 	if (day_diff[acnt] < 0)
 			out.println("-");
 		else
 			out.println(new Prem_date().due_date(cust_id[acnt], pol_no[acnt]));
 %></span>
						</div>

						<div class="col-md-1">
							<a class=" btn btn-primary checkout_done"
								style="color: white; margin-left: 2em;"
								id="<%out.print(pol_no[acnt]);%>">Pay now</a>
						</div>
					</div>



					<hr style="width:81em">

					<%
						}
					%>