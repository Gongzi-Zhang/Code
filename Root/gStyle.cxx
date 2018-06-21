#include "TStyle.cxx"

// show statistics box
gStyle->SetOptStat(11..1);
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
