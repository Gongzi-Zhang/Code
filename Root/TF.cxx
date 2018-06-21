#include "TF1.h"
#include "TMath.h"

// predifined functions
// "gaus", "exp", "landau", "sin", "cos" "pol0" ... "pol9"

// different math operation
TF1 * f;
f = new TF1("parabola", "[0]+[1]*x+[2]*x**2", 0, 20);
f = new TF1("double-gaussian", "gaus(0)+gaus(3)", -10, 10);
// gaus(0) means to use the gaussian distribution starting with par 0;
// gaus(3) means to use the gaussian distribution starting with par 3;
// This means this func has 6 pars, P0, P1, P2, P3, P4, P5;
// and P0, P1, P2 are the "constant", "mean" , "sigma" of the first 
// gaussian, P3, P4,P5 belong to the second one.
f = new TF1("gaussian", "[0]*TMath::Gaus(x, [1], [2])", 0, 20);
// parameters
/// SetParameter(<paramter_number>, <parameter_value>)
TF1 *f1 = new TF1("f2", "[0]*sin([1]*x)/x", 0. 10.);
f1->SetParameter(0, 1);
f1->SetParameter(1, 1);
/// or set all in one act
f1->SetParameters(1, 1);
/// number of parameters
double npar = f1->GetNpar();
/// Get parameters
f1->GetParameter(0);
                   

// get X, get x value corresponding to the func value y
f1->GetX(.5);

// Ranges
/// It seems the range only affect drawing, but not affect evaluation
f1->Eval(11);
f1->Eval(-1);
// reset range
f1->SetRange(-1, 11);
//	      ^  ^  :x-min, x-max
double single(double *x, double *par)
{
    double const pi=4*atan(1.);
    return pow(sin(pi*par[0]*x[0])/(pi*par[0]*x[0]), 2);
}

double nslit0(double *x, double *par)
{
    double const pi=4*atan(1.);
    return pow(sin(pi*par[1]*x[0])/sin(pi*x[0]), 2);
}

double nslit(double *x, double *par)
{
    return single(x,par) * nslit0(x, par);
}

void slits()
{
    float r, ns;
    cout << "slit width / g ?";
    scanf("%f", &r);
    cout << "# of slits? ";
    scanf("%f", &ns);
    cout << "interference pattern for " << ns << " slits, width/distance: " << r << endl;

    TF1 * Fnslit = new TF1("Fnslit", nslit -5.001, 5., 2);
    Fnslit->SetNpx(500);	// set number of points to 500
    Fnslit->SetParameter(0, r);
    Fnslit->SetParameter(1, ns);
    Fnslit->Draw();
}
