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

