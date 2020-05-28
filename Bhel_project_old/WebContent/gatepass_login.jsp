<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">

<script>
function validate(){
var username=document.login_form.username.value;
var password=document.login_form.password.value;
if(username==""){
 alert("Enter Username!");
  return false;
}
if(password==""){
 alert("Enter Password!");
  return false;
}
return true;
}
</script>

  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<style media="screen">
  .blankSpace{
    width:100%;
    margin-bottom:150px;
  }
  .btn-primary{
    background-color:#993399;
    border-color:#993399;
  }
  .btn-primary:hover{
    background-color:violet;
    border-color:violet;
  }
</style>
  </head>
  <body>
  <div class="jumbotron-fluid" style="background-color:#993399;">
    <div class="container-fluid">
    <img src="img_src\login_logo.jpg" id="loginLogo" height="72px" align="left" style="margin-right:20px;">
    <h6 class="text-white">Bharat Heavy Electricals Limited</h6>
    <h7 class="text-white">Heavy Plates and Vessels Plant</h7>
      <br>
    <h8 class="text-white">Vishakhapatnam</h4>
    </div>
  </div>
  <div class="blankSpace"></div>
<div class="row">
  <div class="col"></div>
  <div class="col">
      <div class="container-fluid border-bottom-0 text-white" style="background-color:#993399;padding:10px 0px 10px 20px;border:solid 2px black;">Please Login</div>
  
  
  <form name="login_form" class="" action="<%=request.getContextPath()%>/login" method="post" onsubmit="javascript:return validate();" align="center" style="border:solid 2px;">
    <label for="uName">Username:</label>
    <input type="text" name="username" placeholder="Enter Username" style="margin:20px;padding:4px 4px;" ng-model="user.name" ng-required="true">
    <br>
    <label for="uPassw">Password:</label>
    <input type="password" name="password" placeholder="Enter Password" style="margin:20px;padding:4px 4px;" ng-model="user.pass" ng-required="true">
    <br>
    <input class="btn btn-primary" type="submit" value="Submit" style="margin:10px;">
  </form>
  
  
  </div>
  <div class="col"></div>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>
