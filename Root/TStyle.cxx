#include "TStyle.cxx"

/* This class can set some of the following object attributes:
 * Canvas
 * Pad
 * Histogram axis
 * Lines
 * Fill areas
 * Text
 * Markers
 * Functions
 * Histogram Statistics and Titles
 *
 * All objects that can be drawn in a pad inherit from one or more 
 * attributes classes: TAttline, TAttFill, TAttText, TAttMarker
 * When the objects are created, their default attributes are taken
 * from the current style, which is an object of the clss TStyle and 
 * can be referenced via the global variable gStyle.
 */


// default style: gStyle
// show statistics box
gStyle->SetOptStat(11..1);
gStyle->SetStatY(0.9);	// set stats box y position
gStyle->SetStatX(0.9);	// set stats box x position
gStyle->SetStatW(0.4);	// set stats box width
gStyle->SetStatX(0.2);	// set stats box height

// show fit parameters in statistics box
gStyle->SetOptStat(11..1);
// suppress title boxes on graphs and histograms 
gStyle->SetOptTitle(0);
// for animations: add pause in milliseconds
gStyle->Sleep(UInt_t t);

// things that can be displayed in stat box:
// Name, Entries, Mean, RMS, Underflow, Overflow, Integral, Skewness,
// Kurtosis
// set on one bit by another in order, Name is LSB, Kurtosis is MSB
gStyle->SetOptStat(111110110); // turns on all, except RMS and Name

// an updated methods of setting it:
// kKsSiourRmMen
// k : kurtosis printed
// K : kurtosis and kurtosis error printed
// s : skewness printed
// S : skewness and skewness error printed
// i : integral of bins printed
// o : number of overflows printed
// u : number of underflows printed
// r : rms printed
// R : rms and rms error printed
// m : mean value printed
// M : mean value mean error values printed
// e : number of entries printed
// n : name of histogram is printed 

gStyle.SetLabelSize(0.03, "xy");
gStyle.SetTitleSize(0.03, "xy");
gStyle.SetTitleOffset(1.2, "xy");
gStyle.SetPadLeftMargin(0.15);
gStyle.SetPadRightMargin(0.1);
gStyle.SetPadTopMargin(0.1);
gStyle.SetPadBottomMargin(0.1);
