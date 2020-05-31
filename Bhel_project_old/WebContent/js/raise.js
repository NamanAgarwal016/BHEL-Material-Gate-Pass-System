function bhel(){
  var content=document.getElementById("bhelInfo");
  content.style.display="block";
  var hide=document.getElementById("nonBhelInfo");
  hide.style.display="none";
}
function nonBhel(){
  var content=document.getElementById("nonBhelInfo");
  content.style.display="block";
  var hide=document.getElementById("bhelInfo");
  hide.style.display="none";
}
function clearForm(){
  var form=document.getElementById("gatepassMainForm");
  form.reset();
  var hide_1=document.getElementById("bhelInfo");
  var hide_2=document.getElementById("nonBhelInfo");
  hide_1.style.display="none";
  hide_2.style.display="none";
}
