#include "TGraphPolar.h"

void polarGraph()
{
    double rmin = 0;
    double rmax = TMath::Pi()*6;
    const int npoints = 300;
    double r[npoints];
    double theta[npoints];
    for(int i=0; i<npoints; i++)
    {
	r[i] = i*(rmax - rmin)/(npoints-1.) + rmin;
	theta[i] = TMath::Sin(r[i]);
    }
    TCanvas *c = new TCanvas("c1", "c1", 600, 600);
    TGraphPolar grP1(npoints, r, theta);
    grP1.SetTitle("A Fan");
    grP1.SetLineWidth(3);
    grP1.SetLineColor(2);
    grP1.DrawClone("AOL");
}
