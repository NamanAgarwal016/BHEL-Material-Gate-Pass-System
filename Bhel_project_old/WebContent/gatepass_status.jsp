<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="login.database.*"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
String id = request.getParameter("id");
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
ResultSet resultSet = null;
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gatepass Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<style media="screen">
  table {
    border:1px solid black;
  }
</style>
  </head>
  <body>
    <nav class="navbar navbar-toggleable navbar-inverse" style="background-color:#993399;">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#mainNav">
         <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="gatepass_status.jsp">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gatepass_raise.jsp">RAISE GATE PASS</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          VIEW
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="gatepass_approved.jsp">Approved</a>
          <a class="dropdown-item" href="gatepass_closed.jsp">Closed</a>
          <a class="dropdown-item" href="gatepass_pending.jsp">Pending</a>
          <a class="dropdown-item" href="gatepass_cancelled.js[]">Cancelled</a>
          <a class="dropdown-item" href="gatepass_inDraft.jsp">In Draft</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gatepass_print.jsp">PRINT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gatepass_help.jsp">HELP</a>
      </li>
    </ul>
  </div>
    </nav>
    <button class="btn btn-danger" style="float:right;margin:6px 6px 0 0;border-shadow:1px 1px 4px black;">Logout</button>
    <div class="container" style="margin-top:8%;">
    

     <h1 style="text-align:center;"><b>Hello Full_Name !!</b></h1>
 
 	<div class="container" style="margin-top:4%;">
      <table align="center" class="table table-striped">
      <thead class="thead-dark">
        <tr>
        <th scope="col" colspan="4" style="text-align:center;color:white;background-color:#993399;">WELCOME TO MATERIAL GATE PASS SYSTEM</th>
      </tr>
      </thead>
      

      
      
<tbody>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from gatepass_status";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
    <tr>
    <th>In Draft Mode</th>
    <td><%=resultSet.getString("In Draft Mode") %></td>
    <th>Pending Approval</th>
    <td><%=resultSet.getString("Pending Approval") %></td>
    </tr>
    <tr>
    <th>Approved</th>
    <td><%=resultSet.getString("Approved") %></td>
    <th>Permitted</th>
    <td><%=resultSet.getString("Permitted") %></td>
    </tr>
    <tr>
    <th>Closed</th>
    <td><%=resultSet.getString("Closed") %></td>
    <th>Cancelled</th>
    <td><%=resultSet.getString("Cancelled") %></td>
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
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>
