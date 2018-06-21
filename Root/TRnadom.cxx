#include "TRandom.h"
#include "TF1.h"

float x, y, z;
TRandom r;
x = r.Gaus(10,1);
y = r.Gaus(20,2);
z = r.Landau(2,1);

// get random number distributed according to TF1
TF1 * f1 = new TF1("fun", "sin(x)/x", 0, 10);
x = f1->GetRandom();
