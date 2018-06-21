#include "TVirtualFitter.h"

// Set default fitter, e.g. name "Minuit"
TVirtualFitter::SetDefaultFitter(const char* name);
// Create Fitter instance
TVirtualFitter::Fitter(0, Int_t maxpar=25);
// define a parameter
Int_t SetParameter(Int_t ipar, const char* parname, Double_t value, Double_t verr, Double_t vlow, Double_t vhigh);
// set function to be minimized
SetFCN(void (*)(Int_t &, Double_t*, Double_t&f, Double_t*, Int_t) fcn);
// Get Pointer to active fitter instance
static TVirtualFitter* .GetFitter();
// get pointer to covariance matrix
Double_t * .GetCovarianceMatrix() const
