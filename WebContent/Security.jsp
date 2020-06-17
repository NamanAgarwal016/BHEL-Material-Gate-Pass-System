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
	Security security = new Security();
security.enable(session, response);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Gate Pass - Security</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
   <link rel="stylesheet" href="css/security.css"> 
    
    
    
    </head>
<body>
<body>
	<%
		try {
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
		String database = "zvp0njb2yauy3fgk";
		String userid = "pjyaoyeilkkbtjg8";
		String password = "ejzn69wchxp2bv6j";
		Class.forName(driver);
		Connection connection = null;
		Statement statement = null;
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();

		String userlabel = (String) request.getAttribute("GateNumber");
		String loggedInUser = "select * from SecurityView where PassNumber='" + userlabel + "'";
		ResultSet rs = statement.executeQuery(loggedInUser);
	%>

    
    <div class="container-fluid header">
     <h1 >Gate Pass Security Portal
     <form name="logout_button" action="<%=request.getContextPath()%>/logout"  method="get">
     <input class="btn btn-sign-out" type="submit" value="Sign Out">
    </form>
     </h1>
    </div>
    
	<table border=1 align=center class="table table-striped">
		<thead>
			<tr>
				<th>Gate Pass Number</th>
				<th>Staff ID</th>
				<th>Initiating Officer</th>
				<th>Material</th>
				<th>Quantity</th>
				<th>Unit</th>
				<th>Return Date</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("PassNumber")%></td>
				<td><%=rs.getString("staff_id")%></td>
				<td><%=rs.getString("InitiatingOfficer")%></td>
				<td><%=rs.getString("Materials")%></td>
				<td><%=rs.getString("Quantity")%></td>
				<td><%=rs.getString("Unit")%></td>
				<td><%=rs.getString("Date_of_return")%></td>
				<td><%=rs.getString("status")%></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>

     <div class="container-fluid ">
	<div class="row fixed-bottom">
	<div class="col text-center">
	<form name="login_form" action="<%=request.getContextPath()%>/Leaving"
		method="post">

		<input type="hidden" id="GatePass" name="GatePass"
			value=<%=userlabel%>> <input class="btn btn-primary"
			type="submit" value="Material Leaving">

	</form>
	</div>
	<div class="col"></div>
	<div class="col text-center">
	<form name="login_form"
		action="<%=request.getContextPath()%>/Returning" method="post">
		<input type="hidden" id="GatePass" name="GatePass"
			value=<%=userlabel%>> <input class="btn btn-primary"
			type="submit" value="Material Returning">
	</form>
	</div>
	</div>
	</div>

	<%
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>