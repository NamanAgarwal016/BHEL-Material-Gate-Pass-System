<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>	
<%@page import="login.web.Security"%>
	
<%@page import="login.web.Security"%>
<%
Security security = new Security();
security.enable(session, response);
%>

<<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<title>Material Gate Pass - Approval Portal</title>

<!-- Adding Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/approvalForm.css">
<link rel="stylesheet" href="css/navbar-side.css">

<!-- Font Awesome JS -->
    
<script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
</head>
<body>


	<!-- Creating the Navigation Menu -->

	<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Material Gate Pass System</h3>
                <strong>GS</strong>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="gatepass_status.jsp">
                        <i class="fas fa-home" aria-hidden="true"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="gatepass_raise.jsp">
                        <i class="fas fa-ticket-alt"></i>
                        Raise
                    </a>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-copy"></i>
                        View
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="gatepass_approved.jsp">Approved</a>
                        </li>
                        <li>
                            <a href="gatepass_pending.jsp">Pending</a>
                        </li>
                        <li>
                            <a href="gatepass_inDraft.jsp">In Draft</a>
                        </li>
                        <li>
                            <a href="gatepass_closed.jsp">Closed</a>
                        </li>
                        <li>
                            <a href="gatepass_cancelled.jsp">Cancelled</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="gatepass_print.jsp">
                        <i class="fas fa-file-pdf"></i>
                        Print
                    </a>
                </li>
                <li>
                    <a href="gatepass_help.jsp">
                        <i class="fas fa-question"></i>
                        FAQ
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-paper-plane"></i>
                   Contact
              </a>
                </li>
            </ul>

            <ul class="list-unstyled components">
            <li>
                <a href="#" id="logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
                </a>
            </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-justify"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-left"></i>
                    </button>
                </div>
            </nav>


	<div class="container gatepassDetails">
	  <%
		try {
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
		String database = "zvp0njb2yauy3fgk";
		String userid = "pjyaoyeilkkbtjg8";
		String password = "ejzn69wchxp2bv6j";
		String gatepass = request.getParameter("id");
		String ApproverName = (String) session.getAttribute("Name");
		int staff_id = (Integer) session.getAttribute("ID");
		int i = 0;
		Class.forName(driver);
		Connection connection = null;
		Statement statement = null;
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String officer = "select * from material where PassNumber='"+ gatepass +"'";
		ResultSet rs6 = statement.executeQuery(officer);
		rs6.next();
	%>
		<table class="table">
			<thead>
				<tr>
					<th colspan="5" class="headerLeaf">GATE PASS DETAILS</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Gate pass Number:</th>
					<td><%=gatepass%></td>
					<td class="blank"></td>
					<th>Initiated By:</th>
					<td><%=rs6.getString("InitiatingOfficer")%></td>
				</tr>
							<%
			String loggedInUser = "select * from material where PassNumber='"+ gatepass +"'";
			ResultSet rs = statement.executeQuery(loggedInUser);
 %>
				
				<tr>
					<th>Sl. No</th>
					<th>Material Details</th>
					<th>Quantity</th>
					<th>Unit</th>
					<th>Date of Return</th>
				</tr>
				  <%
				while (rs.next()) {
					i++;
			%>
				<tr>
					<td><%=i%></td>
					<td><%=rs.getString("Materials")%></td>
					<td><%=rs.getString("Quantity")%></td>
					<td><%=rs.getString("Unit")%></td>
					<td><%=rs.getString("Date_of_return")%></td>
				</tr>
				 <%
	             }
	  
	  %>
				
				<%  
				    String receiver = "select * from receiver where gatepass='"+ gatepass +"'";
		            ResultSet rs1 = statement.executeQuery(receiver);
		            rs1.next(); %>
				<tr>
					<th colspan="5" class="headerLeaf">RECEIVER'S INFO</th>
				</tr>
				<tr>
					<th>Name:</th>
					<td><%=rs1.getString("name")%></td>
					<td class="splitter"></td>
					<th>Address:</th>
					<td><%=rs1.getString("address")%></td>
				</tr>
				<tr>
					<th>Designation:</th>
					<td><%=rs1.getString("designation")%></td>
					<td class="splitter"></td>
					<th>City:</th>
					<td><%=rs1.getString("city")%></td>
				</tr>
				<tr>
					<th>Department:</th>
					<td><%=rs1.getString("dept")%></td>
					<td class="splitter"></td>
					<th>State:</th>
					<td><%=rs1.getString("state")%></td>
				</tr>
				<tr>
					<th>Company:</th>
					<td><%=rs1.getString("company")%></td>
					<td class="splitter"></td>
					<th>Pin Code:</th>
					<td><%=rs1.getString("pincode")%></td>
				</tr>
				<tr>
					<th>Phone:</th>
					<td><%=rs1.getLong("contact")%></td>
					<td class="splitter"></td>
					<th>Email:</th>
					<td><%=rs1.getString("email")%></td>
				</tr>
					 <%
					 String custodian = "select * from material_details where gatepass='"+ gatepass +"'";
			            ResultSet rs2 = statement.executeQuery(custodian);
			            rs2.next();
	  %>
				<tr>
				<th colspan="5" class="headerLeaf">CUSTODIAN</th>
				</tr>
				<tr>
					<td colspan="5" rowspan="6"><%=rs2.getString("Details")%></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<th colspan="5" class="headerLeaf">TRANSPORT INFO</th>
				</tr>
				<% 
				 String check = "select * from bhel_person where gatepass='"+ gatepass +"'";
	            ResultSet rs3 = statement.executeQuery(check);
				if (rs3.next() == false) { 
					 String detail = "select * from nonbhel_person where gatepass='"+ gatepass +"'";
			            ResultSet rs4 = statement.executeQuery(detail);
			            rs4.next();
				%> 
					<tr>
					<th>Name:</th>
					<td><%=rs4.getString("name")%></td>
					<td class="splitter"></td>
					<th>BHEL/NON-BHEL:</th>
					<td>NON-BHEL</td>
				</tr>
				<tr>
					<th>Company</th>
					<td><%=rs4.getString("company")%></td>
					<td class="splitter"></td>
					<th>Address:</th>
					<td><%=rs4.getString("address")%></td>
				</tr>
				<%}
				else {
					 String detail = "select * from bhel_person where gatepass='"+ gatepass +"'";
			            ResultSet rs4 = statement.executeQuery(detail);
			            rs4.next();		
				%><tr>
					<th>Name:</th>
					<td><%=rs4.getString("name")%></td>
					<td class="splitter"></td>
					<th>BHEL/NON-BHEL:</th>
					<td>BHEL</td>
				</tr>
				<tr>
					<th>Designation</th>
					<td><%=rs4.getString("designation")%></td>
					<td class="splitter"></td>
					<th>Department:</th>
					<td><%=rs4.getString("department")%></td>
				</tr>
				<%}
				%>
				
				<tr>
					<th colspan="5" class="headerLeaf">APPROVER'S DETAILS</th>
				</tr>
				<tr>
					<th>Name:</th>
					<td><%=ApproverName%></td>
					<th>StaffID:</th>
					<td><%=staff_id%></td>
					<%connection.close();%>
					<th>Approval Date: <%=(new java.util.Date()).toLocaleString()%></th>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container-fluid button-leaf">
		<div class="row">
			<div class="col text-center">
			<form name="Buttons" action="<%=request.getContextPath()%>/ApprovePass" method="post">
		       <input type="hidden" id="Decision" name="Decision" value="Approved">
		       <input type="hidden" id="GatePass" name="GatePass" value=<%=gatepass%>>
		       <input type="hidden" id="Date" name="Date" value=<%=(new java.util.Date()).toLocaleString()%>>
			   <input type="hidden" id="Issuer" name="Issuer" value=<%=ApproverName %>>
			   <input class="btn btn-primary" type="submit" value="Approve">
			   
	</form>
	</div>
			<div class="col-2"></div>
			<div class="col text-center">
			   <form name="Buttons1" action="<%=request.getContextPath()%>/RejectPass" method="post">
		       <input type="hidden" id="Decision" name="Decision" value="Declined">
		       <input type="hidden" id="GatePass" name="GatePass" value=<%=gatepass%>>
		       <input type="hidden" id="Date" name="Date" value=<%=(new java.util.Date()).toLocaleString()%>>
			   <input type="hidden" id="Issuer" name="Issuer" value=<%=ApproverName %>>
			   <input class="btn btn-primary" type="submit" value="Decline">
			   
	</form>
			</div>
		
	</div>
<%	} catch (Exception e) {
			e.printStackTrace();
		} %>


<!-- Importing tether,jQuery,Bootstrap javaScript -->

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" 
	    integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	    crossorigin="anonymous"></script>

    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" 
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" 
        crossorigin="anonymous"></script>

<!-- jQuery for collapsing Sidebar -->

<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
        $("#logout").on('click', function() {
      	  window.location = "<%=request.getContextPath()%>/logout" 
      	});
    </script>
    
</body>

<script src="js/main.js"></script>
</html>
