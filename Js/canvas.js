function draw() {
    var canvas = document.getElementById('canvas');
    if (canvas.getContext) {
	var ctx = canvas.getContext("2d");  // 2D draw place (context)
	ctx.beginPath();
	ctx.moveTo(120.0, 32.0);
	ctx.bezierCurveTo(120.0, 36.4, 116.4, 40.0, 112.0, 40.0);
	ctx.lineTo(8.0, 40.0);
	ctx.bezierCurveTo(3.6, 40.0, 0.0, 36.4, 0.0, 32.0);
	ctx.lineTo(0.0, 8.0);
	ctx.bezierCurveTo(0.0, 3.6, 3.6, 0.0, 8.0, 0.0);
	ctx.lineTo(112.0, 0.0);
	ctx.bezierCurveTo(116.4, 0.0, 120.0, 3.6, 120.0, 8.0);
	ctx.lineTo(120.0, 32.0);
	ctx.closePath();
	ctx.fill();
	ctx.lineWidth = 2.0;
	ctx.strokeStyle = "tgb(255, 255, 255)";
	ctx.stroke();
    }
}

function converToGS(img) {  // convert to gray scale
    if (!Modernizr.canvas) return;
    img.color = img.src ;
    img.grayscale = createGSCanvas(img);
    img.onmouseover = function() {
	this.src = this.color;
    }
    img.onmouseout = function() {
	this.src = this.grayscale;
    }
}

function createGSCanvas(img) {
    var canvas = document.createElement("canvas");
    canvas.width = img.width;
    canvas.height = img.height;

    var ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0);

    // getImageData can only operate img that lies in the same area as js code
    var c = ctx.getImageData(0, 0, img.width, img.height);
    for (var i=0; i<c.height; i++) {
	for(var j=0; j<c.width; j++) {
	    var x = (i*4) * c.width + (j*4);
	    var r = c.data[x];
	    var g = c.data[x+1];
	    var b = c.data[x+2];
	    c.data[x] = c.data[x+1] = c.data[x+2] = (r+g+b)/2;
	}
    }

    ctx.putImageData(c, 0, 0, 0, 0, c.width, c.height);
    return canvas.toDataURL();
}
