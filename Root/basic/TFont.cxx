#include "TEnv.h"

TString fp = gEnv->GetValue("Root.TTFontPath", "");
TString bc = fp + "/BlackChancery.ttf";
TString ar = fp + "/arial.ttf";

// Draw text over image with funny font
img->DrawText(120, 160, "Hello World!", 32, gRoot->GetColor(4)->AsHexString(), bc, TImage::kShadeBelow);
