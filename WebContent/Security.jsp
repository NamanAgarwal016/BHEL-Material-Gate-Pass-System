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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Security</title>
</head>
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


	<table border=1 align=center style="text-align: center">
		<thead>
			<tr>
				<th>Gate Pass Number</th>
				<th>Staff ID</th>
				<th>Material</th>
				<th>Return Date</th>
				<th>Initiating Officer</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("PassNumber")%></td>
				<td><%=rs.getString("staff_id")%></td>
				<td><%=rs.getString("Materials")%></td>
				<td><%=rs.getString("Date_of_return")%></td>
				<td><%=rs.getString("InitiatingOfficer")%></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>

	<br>

	<form name="login_form" action="<%=request.getContextPath()%>/Leaving"
		method="post" align="center">

		<input type="hidden" id="GatePass" name="GatePass"
			value=<%=userlabel%> > <input class="btn btn-outline-primary"
			type="submit" value="Material Leaving">

	</form>

	<br>

	<form name="login_form"
		action="<%=request.getContextPath()%>/Returning" method="post"
		align="center">
		<input type="hidden" id="GatePass" name="GatePass"
			value=<%=userlabel%> > <input class="btn btn-outline-primary"
			type="submit" value="Material Returning">
	</form>

	<%
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>