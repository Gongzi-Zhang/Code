#include "TF1.h"
#include "TF2.h"
#include "TROOT.h"
#include "TRandom3.h"
#include "TCanvas.h"

// For pre-defined functions, there is no need to set initial values. ROOT
// will do it automatically for you.

double minf=0.0, maxf=100.;
TF1 *gfit = new TF1("Gaussian","gaus",minf,maxf); // Create the fit function
h->Fit("Gaussian","RQ"); // Fit histogram h
// h->Fit(gfit,"RQ");

double chisq=gfit->GetChisquare();
double ndf=gfit->GetNDF();
double chisqdf=chisq/ndf;
cout << "Chisquare: " << chisq << "/" << ndf << " : " << chisqdf << endl;

Double_t amp = gfit->GetParameter(0); //value of 0th parameter
Double_t eamp = gfit->GetParError(0); //error on 0th parameter
Double_t mean = gfit->GetParameter(1); //value of 1st parameter
Double_t emean = gfit->GetParError(1); //error on 1st parameter

Doublet_t par[3];
  it->GetParameters(&par[0]);

void macro()
{
    gStyle->SetPalette(1);  // comment it to see different affects
    gROOT->SetStyle("Plain");

    const double e = .3;
    const int nd = 500;

    TRandom3 random_generator;
    TF2 *f2 = new TF2("f2", "1000*(([0]*sin(x)/x)*([1]*sin(y)/y)) + 200", -6.6, 6.6);
    f2->SetParameters(1, 1);
    TGraph2DErrors *dte = new TGraph2DErrors(nd);

    double rnd, x, y, z, ex, ey, ez;
    for(int i=0; i<nd; i++)
    {
	f2->GetRandom2(x,y);
	rnd = random_generator.Uniform(-e, e);
	z = f2->Eval(x,y)*(1+rnd);
	dte->SetPoint(i, x, y, z);
	ex = .05*random_generator.Uniform();
	ey = .05*random_generator.Uniform();
	ez = TMath::Abs(z*rnd);
	dte->SetPointError(i, ex, ey, ez);
    }
    f2->SetParameters(.7, 1.5);	// set initial values for fit
    f2->SetTitle("Fitted 2D function");
    dte->Fit(f2);

// retrieve fitting results
#ifdef __TVirtualFitter__
    TVirtualFitter * fit = TVirtualFitter::GetFitter(); // get fit method
    fit->PrintResults(2, 0.); // print fit results
    double npar = f2->GetNpar();
    // get covariance Matrix and print it.
    TMatrixD * covMatrix = new TMatrixD(npar, npar, fit->GetCovarianceMatrix());    
    covMatrix->Print();
#endif

#ifdef __Options__
// fit options
    dte->Fit(f2, "q");	// Chi2 fit
    dte->Fit(f2, "lq"); // Likelihood fit
#endif

#ifdef __GetSigma__
    dte->Fit("gaus");
    TF1 *fitfunc = dte->GetFunction("gaus");
    sig = fitfunc->GetParameter(2);
    mean = fitfunc->GetParameter(1);
#endif
    
    TCanvas *c1 = new TCanvas();
    f2->Draw("Surf1");
    dte->Draw("P0 Same");
// X and Y projections
    TCanvas* c_p = new TCanvas("ProjCan", "The Projections", 1000, 400);
    c_p->Divide(2,1);
    c_p->cd(1);
    dte->Project("x")->Draw();
    c_p->cd(2);
    dte->Project("y")->Draw();
}

