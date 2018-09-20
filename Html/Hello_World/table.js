// Create tables
function createTable(columns, items){
    if(typeof(items) != 'object'){	// items must be an array
	alert("items must be an array!");
	return false;
    }

    var body = document.getElementsByTagName('body')[0];
    var table = document.createElement("TABLE");
    table.style.width = '100%';
    table.setAttribute('border', '1');
    var tbody = document.createElement('tbody');

    var rows = Math.floor(items.length / columns);
    var res  = items.length % columns;

    for(var i=0; i<rows; i++){
	var tr = document.createElement('tr');
        for(var j=0; j<columns; j++){
	    var td = document.createElement('td');
	    td.appendChild(document.createTextNode(items[columns*i+j]));
	    tr.appendChild(td);
	}
	tbody.appendChild(tr);
    }

    var tr = document.createElement('tr');
    for(var j=0; j<res; j++) {
	var td = document.createElement('td');
	td.appendChild(document.createTextNode(items[columns*rows+j]));
        tr.appendChild(td);
    }
    tbody.appendChild(tr);
    table.appendChild(tbody);
    body.appendChild(table);
}
