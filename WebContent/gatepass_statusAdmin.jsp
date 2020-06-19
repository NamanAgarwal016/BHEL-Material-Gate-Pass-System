<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.Date" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.text.ParseException"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.util.concurrent.TimeUnit"%>


<%
	Security security = new Security();
security.enable(session, response);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Gate Pass - Admin</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
   <link rel="stylesheet" href="css/admin.css"> 
    
    
    
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
	%>

    
    <div class="container-fluid header">
     <h1 >Gate Pass Admin Portal
     <form name="logout_button" action="<%=request.getContextPath()%>/logout"  method="get">
     <input class="btn btn-sign-out" type="submit" value="Sign Out">
    </form>
     </h1>
    </div>
  <table border=1 align=center class="table table-striped">
		<thead>
			<tr>
				<th>Gate Pass Number</th>
				<th>Issuing Officer</th>
				<th>Status</th>
				<th>Date Of Leaving </th>
				<th>Date Of Closing</th>
				<th>Date of Return</th>
			</tr>
		</thead>
		  <%
    String loggedInUser;
	String insertTableSQL3 = "SELECT a.* ,b.status, b.Date_of_return from admin_view a, material b where a.GatePassNumber=b.PassNumber;";
	PreparedStatement st3 = connection.prepareStatement(insertTableSQL3);
	ResultSet rs1 = st3.executeQuery();
	int entry = 0;
	while (rs1.next()) {
	 %>
	
		<tbody>
			<tr>
				<td><%=rs1.getString("GatePassNumber")%></td>
				<td><%=rs1.getString("Issuing Officer")%></td>
				<td><%=rs1.getString("status")%></td>
				<td><%=rs1.getString("Date_of_Leaving")%></td>
				<td><%=rs1.getString("Date_of_Returning")%></td>
				<td><%=rs1.getString("Date_of_return")%></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>
	<%
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>