#include "TText.h"
#include "TLatex.h"

TText text(0.33, 0.165, "Text");    // the x, y value is not fraction of canvas, but the real x, y in a coordinate. But you can extented them to beyond the x,y range shown in the axises.
// Horizontal align: 1: left;	2: center;	3: right
// Vertical align:   1: bottom;	2: center;	3: top
text.SetTextAlign(13);	// left top 
// kHAlignLeft   = 10, kHAlignCenter = 20, kHAlignRight = 30,
// kVAlignBottom = 1,  kVAlignCenter = 2,  kVAlignTop   = 3
text.SetTextAlign(kHAlignLeft+kVAlignTop);  // 13
text.SetTextAngle(45);	// unit ???
text.SetTextSize(0.12);
text.SetFont(53);   // font code = 10*fontnumber + precision
/* Font number         X11 Names             Win32/TTF Names
 * 1 :       times-medium-i-normal	    "Times New Roman"
 * 2 :       times-bold-r-normal            "Times New Roman"
 * 3 :       times-bold-i-normal            "Times New Roman"
 * 4 :       helvetica-medium-r-normal      "Arial"
 * 5 :       helvetica-medium-o-normal      "Arial"
 * 6 :       helvetica-bold-r-normal        "Arial"
 * 7 :       helvetica-bold-o-normal        "Arial"
 * 8 :       courier-medium-r-normal        "Courier New"
 * 9 :       courier-medium-o-normal        "Courier New"
 * 10 :      courier-bold-r-normal	    "Courier New"
 * 11 :      courier-bold-o-normal          "Courier New"
 * 12 :      symbol-medium-r-normal         "Symbol"
 * 13 :      times-medium-r-normal          "Times New Roman"
 * 14 :                                     "Wingdings"
 * 15 :      Symbol italic (derived from Symbol)
 *
 * Precision	    explanation
 *  0		    fast hardware fonts
 *  1		    scalable and rotatable hardware fonts
 *  2		    scalable and rotatable hardware fonts
 *  3		    scalable and rotatable hardware fonts. Text size is given in pixels
 */





TLatex *t = new TLatex();
t->SetNDC();
t->SetTextAlign(22);
t->SetTextFont(63);
t->SetTextSizePixels(22);
t->DrawLatex(0.4, 0.6, "Z^{#/}(700GeV) #rightarrow q #bar{1}");


t->SetTextAlign(13); // align to top left
t->SetTextAlign(12); // left, vertically centered.
t->SetTextAlign(22); // centered horizontally and vertically
t->SetTextAlign(11); // default bottom alignment
