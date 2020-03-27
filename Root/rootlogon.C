{ // rootlogon.C
printf(" \nWelcome to Zhang Weibin Ubuntu root \n ");
gROOT->SetStyle("Plain");	   // plain histogram style

gStyle->SetOptStat("nemruoi");     // expanded stats box
// gStyle->SetOptStat(0);

gStyle->SetLabelSize(0.06, "xy");   // Set label of axis, measure in percentage of pad height

gStyle->SetFrameFillColor(10);     // a different frame colour

gStyle->SetPadTickX(1);            // tic marks on all axes
gStyle->SetPadTickY(1);            
gStyle->SetPadGridX(kTRUE);        // draw horizonal and vertical grids
gStyle->SetPadGridY(kTRUE);
gStyle->SetPadTopMargin(0.1);
gStyle->SetPadRightMargin(0.1);
gStyle->SetPadBottomMargin(0.16);
gStyle->SetPadLeftMargin(0.12);

gStyle->SetOptFit(1111);           // results of the fits

gStyle->SetPalette(1,0);           // pretty and useful palette
gStyle->SetHistLineWidth(2);       // a thicker histogram line
gStyle->SetHistMinimumZero(true);  // 

gStyle->SetTitleSize(0.06, "xy");
gStyle->SetTitleOffset(1.2, "x");
gStyle->SetTitleOffset(1.0, "y");
gStyle->SetTitleFillColor(33);     // title colour to highlight it
gStyle->SetTitleW(.77);            // Title width
gStyle->SetTitleH(.07);            // Title height
}
