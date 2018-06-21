#include "TImage.h"


TCanvas * c1;
TImage * img = TImage::Open("colors.png");
img->SetConstRatio(0);	// keep orginal size

