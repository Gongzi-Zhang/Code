// asuume canvas c1
c1->SaveAs("filename.gif+10")	// if filename contains .gif+NN, an animated GIF file is produced
// NN: time iteration between consecutive plot???
// rendering thousands canvases in a for loop to obtain an animated gif after each iteration

// when you want to change dimension of a canvas, remember to clear previous dimension, otherwise you will get some weir plots
c1->Divide(2,4);
c1->Clear();
c1->Divide(3,3);


/* the canvas is not updated with each change for perfomance reasons.
 * when an object is drew, the object is ont painted at the moment, it 
 * is only attached to the active pad or canvas.
 */
