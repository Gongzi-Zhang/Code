#include "TROOT.h"

gROOT->Reset();		    // re-initialize ROOT
gROOT->SetStyle("Plain");   // Set empty TStyle
gStyle->SetOptStat(111111); // statics
gStyle->SetOptFit(1111);    // print fit result on plot
gStyle->SetPalette(1);	    // set nicer colors than default
gStyle->SetOptTitle(0);	    // suppress title box

gROOT->SetStyle("MyStyle"); // use personal style
gPad->UseCurretStyle();	    // this makes everything black and white
gROOT->ForceStyle();	    // force the style chosen above to be used.


// GetListOfFiles()
/* when you use any object in a root file, for example, draw a histogram from
 * a tree in the root file, then the copy of files will increase. Be Careful!!! 
 */
gROOT->GetListOfFiles();    // assume 1
tree->Draw("var");	    // draw something with tree in the file
gROOT->GetListOfFiles();    // This will return 2 now.
