<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
String database = "zvp0njb2yauy3fgk";
String userid = "pjyaoyeilkkbtjg8";
String password = "ejzn69wchxp2bv6j";

try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;

try {
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
	statement = connection.createStatement();
%>

<%
    // avoiding URL bypass
    
       String validUser= (String) session.getAttribute("username");
         
           if(validUser==null)
           response.sendRedirect("gatepass_login.jsp");

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Material Gate Pass - Home</title>

<!-- Importing the Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<!-- Importing the custom External CSS -->

<link rel="stylesheet" href="css/status.css">

</head>
<body>

	<!-- Creating the Navigation Menu -->

	<nav class="navbar navbar-toggleable navbar-inverse">
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#mainNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="gatepass_status.jsp">HOME <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_raise.jsp">RAISE GATE PASS</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> VIEW </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="gatepass_approved.jsp">Approved</a>
						<a class="dropdown-item" href="gatepass_closed.jsp">Closed</a> 
						<a class="dropdown-item" href="gatepass_pending.jsp">Pending</a> 
						 <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="gatepass_cancelled.jsp">Cancelled</a>
						<a class="dropdown-item" href="gatepass_inDraft.jsp">In Draft</a>
						 <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="gatepass_approval_portal.jsp">Approve Pending Requests</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_print.jsp">PRINT</a></li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_help.jsp">HELP</a></li>
			
			</ul>
		</div>
		
		<form name="logout_button" action="<%=request.getContextPath()%>/logout"  method="get" align="right">
    <input class="btn btn-sign-out" type="submit" value="Sign Out">
    </form>
	</nav>
	
	

	<!-- Displaying the Welcome Message -->

	<div class="container welcome-message">

		<%
			String user = (String) session.getAttribute("username");
		String pass = (String) session.getAttribute("password");
		String loggedInUser = "select * from login where username='" + user + "' and password='" + pass + "'";
		ResultSet rs1 = statement.executeQuery(loggedInUser);
		while (rs1.next()) {
		%>

		<h3 class="text-center">
			<b>Welcome, <%=rs1.getString("firstname")%> <%=rs1.getString("lastname")%>
				!
			</b>
		</h3>

		<%
			}
		%>

	</div>

	<!-- Creating the table for displaying status of gatepass -->

	<div class="container table-holder">
		<table align="center" class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="4" id="tableTitle">MATERIAL GATE PASS SYSTEM</th>
				</tr>
			</thead>
			<tbody>

				<%
					String status = "select * from gatepass_status";
				ResultSet rs2 = statement.executeQuery(status);
				while (rs2.next()) {
				%>
				<tr>
					<th>In Draft Mode</th>
					<td><%=rs2.getString("In Draft Mode")%></td>
					<th>Pending Approval</th>
					<td><%=rs2.getString("Pending Approval")%></td>
				</tr>
				<tr>
					<th>Approved</th>
					<td><%=rs2.getString("Approved")%></td>
					<th>Permitted</th>
					<td><%=rs2.getString("Permitted")%></td>
				</tr>
				<tr>
					<th>Closed</th>
					<td><%=rs2.getString("Closed")%></td>
					<th>Cancelled</th>
					<td><%=rs2.getString("Cancelled")%></td>
				</tr>

				<%
					}
				connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>

			</tbody>


		</table>
	</div>

	<!-- Importing tether,jQuery,Bootstrap javaScript -->

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>


</body>
</html>
