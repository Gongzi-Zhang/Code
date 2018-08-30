#include "TLegend.h"

// adding a legend
Double_t x1 = .05, y1 = .75, x2 = x1 + .3, y2 = y1 + .125;  // unit in canvas rather than pad
TLegend * leg = new TLegend(x1, y1, x2, y2);

// Add Entry
leg->AddEntry(h1, "No Ecal", "p");
leg->AddEntry(h2, "Ecal included", "p"); // h1, h2 are histogram pointers
legend->AddEntry(histo, "Histo Random", "f"); // histo is a histogram
legend->AddEntry(sqroot, "xe^{x^{2}} |#frac{sin(x)}{x}| a Latex example", "l"); // sqroot is a formula
leg->AddEntry("name", "label"); // Add text entry

// options
leg->SetTextSize(0.04);
leg->SetTextFont(42);
leg->SetFillColor(10);
leg->SetLineColor(10);
leg->SetBorderSize(0);

leg->Draw();
