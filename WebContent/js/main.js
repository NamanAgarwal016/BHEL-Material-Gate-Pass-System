function bhel() {
	var content = document.getElementById("bhelInfo");
	content.style.display = "block";
	var hide = document.getElementById("nonBhelInfo");
	hide.style.display = "none";
}
function nonBhel() {
	var content = document.getElementById("nonBhelInfo");
	content.style.display = "block";
	var hide = document.getElementById("bhelInfo");
	hide.style.display = "none";
}
function generate() {
	var num_rows = document.getElementById('noOfItems').value;
	var theader = '<table border="1" class="text-center table table-bordered">\n';
	var thead = '<thead><tr><th>S. No.</th><th>Description</th><th>Unit</th><th>Quantity</th><th>Date of Return</th></tr></thead>'
	var tbody = '';

	for (var i = 1; i <= num_rows; i++) {
		tbody += '<tr>';
		tbody += '<td>' + i + '.' + '</td>';
		tbody += '<td><input class="tableEntry" type="text" name="materialInfo">'
				+ '</td>';
		tbody += '<td><select class="tableEntry" name="materialUnit">'
				+ '<option></option><option>No.</option><option>Kgs</option><option>Mtr.</option><option>Set</option><option>Ltr.</option> '
				+ '</td>';
		tbody += '<td><input class="tableEntry" type="number" name="materialQuantity">'
				+ '</td>';
		tbody += '<td><input class="tableEntry" type="date"  name="materialDate">'
				+ '</td>';
		tbody += '</tr>\n';
	}
	var tfooter = '</table>';
	document.getElementById('wrapper').innerHTML = theader + thead + tbody
			+ tfooter;
}
function confirmClear() {
	var answer = confirm("Confirm to clear the Form??");
	if (answer) {
		var form = document
				.getElementById("gatepassMainForm");
		form.reset();
		var hide_1 = document
				.getElementById("bhelInfo");
		var hide_2 = document
				.getElementById("nonBhelInfo");
		hide_1.style.display = "none";
		hide_2.style.display = "none";
	} else {
		return false;
	}
	
}
function clear(){
	var form = document.getElementById("reason");
	form.clear();
}
function redirect(){
	window.location = "gatepass_decline.jsp";
}
function approve(){
	var answer = confirm("Confirm to clear the Approve??");
	if(answer)
		{
		    window.alert("Gatepass Approved Successfully");
		}
	else {
		return false;
	}
}
