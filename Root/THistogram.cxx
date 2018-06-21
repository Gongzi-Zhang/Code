#include "TH1F.h"
#include "TProfile.h"
#include <iostream>

// Fill histograms randomly
TF1 * f1 = new TF1("f1", "x*10", 0, 1);
TH1F * histo =  new TH1F("h1","random number", 200, 0, 10);
histo->SetFillColor(45);
histo->FillRandom("f1", 10000);
// equal to 
for(int i=0; i<10000; i++)
{   histo->Fill(f1->GetRandom());   }

// fill histogram from txt file
TH1F * h = new TH1F("h", "example histo", 100, 0., 5.);
ifstream inp;
double x;
inp.open("expo.dat");
while(! (inp >> x) == 0) 
{   h->Fill(x);		}
inp.close();
// dump histogram contents into an ASCII file
h->Print("all"); > dump.txt // note the semicolon after the parenthesis.


// Superimposing histograms
TPaveStats * st = (TPaveStat*)c1->GetPrimitive("stats"); // assume c1 is a canvas pointer
if (st != NULL) {
    st->SetY1NDC(.4);  // bottom
    st->SetY2NDC(.6);   // top
    st->SetX1NDC(.8);  // left  
    st->SetX2NDC(1);   // right 
    st->SetTextColor(2); // the color of the font
    st->SetFillColor(17); // light gray
    st->SetFillStyle(3001);
    st->SetOptStat(1111);
    st->SetOptFit(0011);
    st->SetStatFormat("2.3e");
    st->SetFitFormat("2.3e");
    // if you want to add text you will need to clone it
    char name[30];
    float value = 20.4;
    sprintf(name, "MyVal = %.0f", value);
    TString text_line = TString(name);
    st->AddText(text_line.Data());  
    st->DrawClone();



// Histogram draw option
gROOT->ForceStyle();  // before importing to set the style for all hists

histo->SetFillColor(kYellow);
histo->SetMarkerStyle(20);
histo->SetMarkerColor(kBlue);
histo->SetMarkerSize(.6);

histo->GetXaxis()->SetRangerUser(.0, 3.); // if range is set, mean is computed over specified range
TString xaxis = "p_{T}(GeV/c)";
histo->GetXaxis()->SetTitle(xaxis);
histo->GetXaxis()->SetLabelSize(.03);
/*
    some basic draw options:
E0-4
    Draw error bars on the points
SAME
    Draw the histogram on the canvas without replacing what is 
    already there. Use to plot one histogram on top of another.
B
    Bar chart
P
    Draw a market at each point
L, LF2
    Draw a line and fill an area

     two dimensions:
Contour, contz
    use contz to get the colour key
    # Try and avoid too many bins as statical fluctuations can play
    # havoc with contour plots
Lego
    3D bar plot
Surface
*/

// Statistics
histo->GetEntries();
histo->GetMean();
histo->GetRMS();
histo->GetIntegral();
histo->GetMean(1); // for axis = 1,2 or 3 returns the mean value of the hist along X, Y and Z axis.
histo->GetMeanError(1);
histo->GetRMS(1); 
histo->GetRMSError(1);

// turn off stats box( default on )
histo->SetStats(kFALSE)

// Control contents of statistic box with
gStyle->SetOptStat(num)	    // num = 0001111

// Normalizing 
Double_t scale = hist->Integral();
hist->Scale(scale)

// addition, substraction, multiplication and divisioni of histo
h1->SumW2; d1->Sumw2();	    // assume d1 is a 1D histo
TH1F * rat = d1->Clone(); 
ratio->SetName("Ratio");
ratio->Divide(h1, d1, 1., 1., "B");



// Profile
TProfile * prof = a_2d_hist->ProfileX();
prof->Draw();

// to fit with prof
TF1 * pfit = new TF1("P1", "pol1", 0, 300);
prof->Fit(pfit, "RQ");

// Another construction
TProfile * hprof = new TProfile("hprof", "title", nxbins, xlow, xhigh, ylow, yhigh);
// fill like a regular 2D histogram
hprof->Fill(x,y);
// Draw like a 1D histogram ( Errors are on by default )            
hprof->Draw("option");
// error bars
TProfile * hprof = new TProfile("hprof", "title", nxbins, xlow, xhigh, ylow, yhigh, option);

// The default sets the errors to the error in the mean -- RMS/√n
// The spread option( option = "s" ) give the spread directly -- RMS

}


// "htemp" histogram, the hist created by default
t->Draw("x", "cuts");
TH1F * htemp = (TH1F*)gPad->GetPrimitive("htemp");
// or
t->Draw("x>>hnew", "cuts");
TH1F * hnew = (TH1F*)gPad->GetPrimitive("hnew");    // or
TH1F * hnew = (TH1F*)gDirectory->Get("hnew");

