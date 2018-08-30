#include "TCanvas.h"
TCanvas * c = new TCanvas("c1", "Canvas");
c->SetFillColor(0); // what's canvas fill color

Int_t wtopx, wtopy;
UInt_t ww, wh;
TCanvas *c1 = new TCanvas("c1","Root Canvas",Int_t wtopx, Int_t wtopy, Int_t ww, Int_t wh);
TCanvas *c1 = new TCanvas("c1","Root Canvas",900,20,540,550);

c->SetRightMargin(0.20);

// Frames
c->GetFrame()->SetFillColor(12);
c->GetFrame()->SetBorderSize(12);
