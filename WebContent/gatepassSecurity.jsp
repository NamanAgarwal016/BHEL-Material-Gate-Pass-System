<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="login.web.Security"%>
<%
Security security = new Security();
security.enable(session, response);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Security Portal</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
   <link rel="stylesheet" href="css/security.css"> 
    
    
    
    </head>
<body>
      
     <div class="container-fluid header">
     <h1 >Gate Pass Security Portal
     <form name="logout_button" action="<%=request.getContextPath()%>/logout"  method="get">
     <input class="btn btn-sign-out" type="submit" value="Sign Out">
    </form>
     </h1>
    </div>

    <div class="container security text-center">
    <img src="img_src/securityLogo.png" class="guard-photo" width="200" height="200">
    <div class="container-main">
	<form name="login_form" action="<%=request.getContextPath()%>/SecurityG" method="post">
	    
		<label for="Gnumber">Gate Pass Number</label> <img
			src="img_src\key_icon.png" class="icon" width="45" height="20">
		<input class="loginField" type="text" name="Gnumber" placeholder="Enter Gate Pass Number" ng-model="gate.no" ng-required="true" required size="21"><br>
			<div class="button-leaf">
			<input class="btn btn-primary" type="submit" value="Enter">
			</div>
	</form>
	</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  
</body>
</html>