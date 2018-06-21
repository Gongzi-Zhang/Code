#include "TMath.h"

double y = 10, x = 9;
TMath::ATan2(y,x); 
// the reason to use ATan2(y,x) instead of atan(y/x) is that atan2 can
// handles correctly the case when x=0;
