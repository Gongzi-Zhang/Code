// global style

gStyle->SetPalette(1, 0);   // color scheme

// Statistical box
gStyle->SetOptStat(0);	    // stat box
gStyle->SetOptTitle(0);	    // show title or not
gStyle->SetOptDate(0);	    // ?
gStyle->SetOptFit(1111);    // fitting
gStyle->SetStatH(0.3);
gStyle->SetStatW(0.3);

// axis
gStyle->SetLabelSize(0.03, "xyz");  // size of axis value font
gStyle->SetTitleSize(0.035, "xyz"); // size of axis title font
gStyle->SetTitleFont(22, "xyz");    // axis title font
gStyle->SetLabelFont(22, "xyz");    // axis label font
gStyle->SetTitleOffset(1.2, "y");   // axis title offset
gStyle->SetTitleYOffset(1.2);	    // axis title offset
gStyle->SetTitleH(0.1);
gStyle->SetTitleW(0.2);

// default canvas options
gStyle->SetCanvasDefW(500);	// canvas width
gStyle->SetCanvasDefH(500);	// canvas height
gStyle->SetCanvasColor(0);	// canvas color
gStyle->SetCanvasBorderMode(0);	// canvas border mode
gStyle->SetCanvasBorderSize(0);	// canvas border size
/// pad options
gStyle->SetPadBottomMargin(0.1);
gStyle->SetPadTopMargin(0.1);
gStyle->SetPadLeftMargin(0.1);
gStyle->SetPadRightMargin(0.1);
gStyle->SetPadGridX(0);		// grid 
gStyle->SetPadGridY(0);		
gStyle->SetPadTickX(1);		// tickmarks
gStyle->SetPadTickY(1);		
gStyle->SetFrameBorderMode(0);	// Frame Boder
gStyle->SetPaperSize(20, 24)	// paper size ???

gROOT->SetStyle("myStyle");	// set personal style
