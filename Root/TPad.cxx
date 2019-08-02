/* A pad is a graphical container in the sense it contains other 
 * graphical objects. It may contain other pads (sub-pads) as well. 
 * A pad is a linked list of primitives of any type (graphs, histos,
 * shapeds, tracks, etc). Drawing an object is nothing more than 
 * adding its pointer to this list. The actual painting is done by
 * the paint() method of each object.
 */

// gPad	-> the active pad

/* TPad::GetPrimitive(const char* name)	-> to access objects in a pad
 * GetPrimitive("className")	-> return the instance of the class 
 * that was first created, to retrieve a later instance, use
 * TPad::GetListOfPrimitives() -> return a list of all the objects
 * on the pad.
