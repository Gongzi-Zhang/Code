#include "TH1F.h"
#include "TH2F.h"


// Constructor
TH1F * h1 = new TH1F("count", "Count Rate; N_{Counts}; # occurencies", 100, -.5, 15.5);	// set all titles in one statement

// fill histogram from txt file
ifstream inp;
double x;
inp.open("expo.dat");
while(! (inp >> x) == 0) 
    h1->Fill(x);
inp.close();
// dump histogram contents into an ASCII file
h1->Print("all"); > dump.txt // note the semicolon after the parenthesis.

// reset
h1->Reset();

// rebin
h1->SetBit(TH1::kCanRebin); // allow the histo to re-bin itself
// Re-binning means that if a value is supplied to the histo that's
// outside its limits, it will adjust those limits automatically. It
// does this by summing existing bins then doubling the bin width;

// Drawing
h1->DrawNormalized();

gROOT->ForceStyle();
/* 
 * Draw options for 1D-Histograms
 * "AXIS"   Draw only axis
 * "AH"	    Draw hist. but not the axis labels and tick marks
 * "]["	    Draw without the first and last vertical lines of the hist.
 * "B"	    Bar chart
 * "C"	    Draw a smooth Curve through the hist. bins
 * "E"	    Error bars
 * "E0"	    Draw error bars including bins with 0 contents
 * "E1"	    Draw error bars with perpendicular lines at the edges
 * "E2"	    Draw error bars with rectangles
 * "E3"	    Draw a fill area throught the end points of the vertical error bars
 * "E4"	    Draw a smoothed filled area through the end points of the error bars
 * "L"	    Draw a line through the bin contents
 * "P"	    Draw current market at each bin except empty bins
 * "P0"	    Draw current market at each bin including empty bins
 * "*H"	    Draw hist. with a * at each bin
 * "LF2"    Draw hist. like with option "L" but with a fill area. Note that "L" draws also
 *	    a fill area if the hist fillcolor is set but the fill area corresponds to the hist. contour.
 */

/* Drawing options for 2D-histograms
 * AXIS	    only axis
 * ARR	    arrow mode. Shows gradient between adjacent cells
 * BOX	    a box is drawn for each cell with surface proportional to contents
 * COL	    a box is drawn for each cell with a color scale varying with contents
 * COLZ	    same as "COL". In addition the color palette is also drawn
 * CONT	    contour plot ( same as CONT0 )
 * CONT0    contour plot using surface colors to distinguish contours
 * CONT1    contour plot using line styles 
 * CONT2    contour plot using the same line style for all contours
 * CONT3    contour plot using fill area colors
 * CONT4    contour plot using fill surface colors ( SURF option at theta = 0 )
 * CONT5    contour plot using Delaunay triangles
 * LIST	    generate a list of TGraph objects for each contour
 * FB	    draw current marker at each bin including empty bins
 * BB	    draw histogram with a * at each bin
 * SCAT	    draw a scatter-plot (default)
 * TEXT	    dtaw bin contents as text
 * TEXTnn   draw b n contents as text at angle nn (0<nn<90)
 * [cutg]   draw only the sub-range selected by the TCutG named "cutg"
 */
h1->Draw("P HIST"); // draw only points, no error bar

// Styles
h1->SetLineStyle(4);	// see TAttLine.png
h1->SetLineColor(kRed);
h1->SetLineWidth(2);
h1->SetMarkerStyle(3);	// see TAttMarker.png
h1->SetMarkerColor(kBlue);
h1->SetMarkerSize(2);
h1->SetFillStyle(3001); // see TAttFill.png
h1->SetFillColor(kYellow);
// statistics
h1->GetMean();
h1->GetMean(1); // for axis = 1,2 or 3 returns the mean value of the hist along X, Y and Z axis.
h1->GetMeanError();
h1->GetMeanError(1);
h1->GetRMS();
h1->GetRMS(1); 
h1->GetRMSError();
h1->GetRMSError(1);
h1->GetSkewness();
h1->GetKurtosis();
h1->GetIntegral();

// Addition and Divition
// suppose h1, h2, h3, h4 are 4 histo pointer
TH1F histos[4] = {h1, h2, h3, h4};
for(int i=0; i<4; i++) 
{
    histos[i]->Sumw2();	// *Very* Important, cause the squares of 
			// weights to be stored inside the histos
			// (equivalent to the number of entries per
			// bin if weights of 1 are used). This info is
			// needed to correctly calculate the errors of
			// each bin entry when the methods TH1::Add or
			// TH1::Divide are applied.
    histos[i]->SetLineColor(i);
}
// Sum
TH1F * sum_h = new TH1F(*h1);
sum_h->Add(h2, 1.);
sum_h->SetTitle("Sum of two histos");
sum_h->SetLineColor(kBlue);
// Divide
TH1F * divided = new TH1F(*h3);
divided->Divide(h4);


// bi-dimensional Histograms
TH2F bidi_h("bidi_h", "2D Histo; Gaussian Vals; Exp. Vals", 
	30, -5, 5,	// X axis 
	30, 0, 10);     // Y axis
// Profiles and Projections
// Projection is the sum of another variable
// Profile is the average of all the bin contents along another axis 
//+ together with their RMS and displayed as a symbol with error bar
bidi_h.ProjectionX()->DrawClone();
bidi_h.ProjectionY()->DrawClone();
bidi_h.ProfileX()->DrawClone();
bidi_h.ProfileY()->DrawClone();

// Correlations
double covariance = bidi_h.GetCovariance();
double correlationFactor = bidi_h.GetCorrelationFactor();

