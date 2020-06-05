function cancel(){
	var show      =       document.getElementById("reasonForCancellation");
	
	show.style.display="block";
	
	var disabled1  =        document.getElementById("cancel");
	
	cancel.disabled = true;
}
function undo(){
	var hide=document.getElementById("reasonForCancellation");
	hide.style.display="none";
	var enable  =        document.getElementById("cancel");
	enable.disable = false;
}