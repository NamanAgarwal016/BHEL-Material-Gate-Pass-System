<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form name="login_form"
		action="<%=request.getContextPath()%>/SecurityG" method="post"
		align="center">
		<label for="Gnumber">Gate Pass Number</label> <img
			src="img_src\useLogo.png" class="icon" width="20" height="20">
		<input class="loginField" type="text" name="Gnumber"
			placeholder="Enter Gate Pass Number" ng-model="user.name"
			ng-required="true" required> <br> <input
			class="btn btn-outline-primary" type="submit" value="Enter">
	</form>
</body>
</html>