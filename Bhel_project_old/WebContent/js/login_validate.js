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
