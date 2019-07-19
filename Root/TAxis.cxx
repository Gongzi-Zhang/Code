#include "TF1.h"
#include "TGaxis.h"
#include "TAxis.h"

TH1F * hist = new TH1F("hist", "hist", 100, 0, 100);
hist->Fill("Gaus", 1000);
TAxis * xaxis = hist->GetXaxis();
xaxis->SetTitleSize(2);
xaxis->SetTitle("X axis");
xaxis->SetTitleOffset(0.15);
xaxis->SetLabelSize(2);
xaxis->SetNdivisions(-5);   // number of division


// Gaxis: The axis painter class
TF1 * f = new TF1("formula", "sin(x)/x", 0, 10);
f->GetXaxis()->SetTitle("x");
// centering
f->GetXaxis()->CenterTitle();
// rotate title
f->GetXaxis()->RotateTitle();

// add axis on right side
TGaxis * RAxis = new TGaxis(3.4, 0, 3.4,90, 209, "+L");
// constructor TGaxis(xlow, ylow, xhigh, yhigh, color ,"option")
// +: draw on positive side
// L: left adjusted
RAxis->SetName("RawYieldAxis");
RAxis->SetTextColor(2);
RAxis->SetTitle("Yield (8 < m_{ee} < 11 GeV/c^{2})");
RAxis->SetLabelColor(2);
RAxis->Draw();
