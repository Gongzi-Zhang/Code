// command used APIs
document.getElementById(id);
document.getElementByTagName(name);
document.createElement(name);
parentNode.appendChild(node);
element.innerHTML;
element.style.left;
element.setAttribute();
element.getAttribute();
element.addEventListener();
window.content;
window.onload;
window.dump();
window.scrollTo();

// create a onload function
window.onload=function(){
    // create a couple of elements in an otherwise empty THML page
    var heading = document.createElement("h1");
    var heading_text = document.creareTextNode("Hello World!");
    heading.appendChild(heading_text);
    document.body.appendChild(heading);
}


// Table object
var table = document.getElementById("table");
var tableAttrs = table.attributes;  // Node/Element interface
for (var i=0; i<tableAttrs.length; i++){
    // HTMLTableElement interface: border attribute
    if(tableAttrs[i].nodeName.toLowerCase() == "border")
	table.border = "1";
}
// HTMLTableElement interface: summary attribute
table.summary = "note: increased border";

