#include "TColor.h"


/* color names:
 * kWhite  = 0,   kBlack  = 1,   kGray    = 920, kRed    = 632, kGreen  = 416,
 * kBlue   = 600, kYellow = 400, kMagenta = 616, kCyan   = 432, kOrange = 800,
 * kSpring = 820, kTeal   = 840, kAzure   = 860, kViolet = 880, kPink   = 900
 */

vector<int> = { kBlack, kOrange, kRed, kGreen-9, kMagenta, kBlue, kAzure-8,
		kCyan, kGreen+2, kSpring, kYellow-3, kViolet-6, kSpring+10,
		kYellow+8, kRed-10, kRed-7, kRed-4, kRed-1, kRed+2, kRed+5, 
                kRed+8, kMagenta-10, kMagenta-7, kMagenta-4, kMagenta-1, kMagenta+2, 
		kMagenta+5, kMagenta+8, kBlue-10, kBlue-7, kBlue-4, kBlue-1, kBlue+2, 
		kBlue+5, kBlue+8, kCyan-10, kCyan-7, kCyan-4, kCyan-1, kCyan+2, 
		kCyan+5, kCyan+8, kGreen-10, kGreen-7, kGreen-4, kGreen-1, kGreen+2, 
		kGreen+5, kGreen+8
	      }

// list of colors
gROOT->GetListOfColors()->Print();

// to define your own color
TColor * colorname = new TColor(colornum, r,g,b, "colorname"); // colornum > 228, and 0< r,g,b < 1
TColor * myColor = new TColor(229, .3, .5, .6, "");
// redefined existing color
color = (TColor*)(gROOT->GetListOfColors()->At(colornum));
color->SetRGB(r,g,b);
