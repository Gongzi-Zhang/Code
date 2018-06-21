function init(){
    document.onkeydown = keyListener;
}

function keyListener(e){
    // if e doesn't already exist, we're in IE so make it
    if (!e) { e = window.event; }
    if (e.keyCode == 37){
	// action
    } // left arrow key

    if (e.keyCode == 38){
	// action
    } // up arrow key

    if(e.keyCode == 39){
	// action
    } // right arrow key

    if (e.keyCode ==40) {
	// action
    } // down arrow key
}
