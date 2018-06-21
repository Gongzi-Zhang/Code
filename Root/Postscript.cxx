#include "TPostScript.h"
#include "TCanvas.h"

TPostScript ps(psfile, itype); // if no itype given, format is determined by extension

ps.Close();

// or simply call
c1->Print(psfile);
