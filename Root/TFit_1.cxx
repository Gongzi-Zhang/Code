// Fit in general

// Minimisation method 
// The default minimiser in ROOT is MINUIT.

/* Example of a negative log likelihood fit (unbinned)
 * based on the ROOT classes TVirtualFitter and TMinuit
 */

// global variables for this macro
TF1 * PDF;	// probability density function
TNtuple * inpdata;
int NFitPar=2;	// # of fit parameters

// The function to be minimized, called by MINUIT, must have this form.
void fFCN(Int_t &npar,	// # of parameters, optional
	  double *gin,	// array of derivatives w.r.t para. optional
	  double &n2lL, // the function value
	  double *par,  // array of parameters
	  int iflag)	// internal flag
{
    // calculate negative log likelihood
    n2lL=0.;
    // set parameters of PDF
    PDF->SetParameters(par[0], par[1]);
    // calculate -log L, loop over ntuple
    float * ntrow;
    for (int i=0; i<inpdata->GetEntries(); ++i){
	inpdata->GenEntry(i);
	ntrow=inpdata->GetArgs();
	n2lL -= log(PDF->Eval(ntrow[0]));
    }
    n2lL *= 2.;
}

// ----------------- main program, fit control---------------------
void negLogLfit() {
    PDF = new TF1("eplusconstPDF", "(1.-[1])*(exp(-x/[0])-exp(-5./[0]))/[0]+[1]/(5.)", 0., 5);

    inpdata = new TNtuple("InputData", "InputData", "x");
    infstream inp; 
    double x;
    inp.open("expob.dat");
    while(!(inp >> x) == 0) {inpdata->Fill(x);}
    inp.close();

    // create fitter instance and initialize (using Minuit)
    TVirtualFitter::SetDefaultFitter("Minuit");
    TFitter * fit = (TFitter *) TVirtualFitter::Fitter(NULL, NFitPar);
    /* The above type cast is a bit ugly -- needed to gain access to TMinuit
     * object, which is possible only via class TFitter */
    fit->SetFCN(fFCN);  // assign func to be minimized

    // set initial values of parameters
    fit->SetParameter(0,	// parameter index
	    "tau",	// parameter name
	    1.,		// value
	    0.1,	// uncertainty, 0 fixes parameter
	    0,		// upper limit	- 0: not set
	    0);		// lower limit  - 0: not set
	    
    fit->SetParameter(1, "off", 0.5, 0.1, 0, 0);

    // run the fit
    double arglist[2] = {5000, 0..01};  // {max. # of func calls, tolerance}
    fit->ExecuteCommand("MINIMIZE", arglist, 2);	// performs SIMPLEX + MIGRAD algorithms
    fit->ExecuteCommand("MINOS", arglist, 0);   // MINOS error evaluation

    // ------- retrieve output ------------
    int nvpar, nparx;
    double amin, edm, errdef;
    if(fit->GetStats(amin, edm, errdef, nvpar, nparx) == 3) {
	cout << endl << "*==* Fit converged:"
	    << " nlL=" << amin << " edm=" << edm << " nvpar=" << nvpar << " nparx" << nparx << endl << endl;
	fit->PrintResults(4, amin);
    }

    // plot data, fit result, and parameter contours
    TCanvas *c = new TCanvas("c", "contours", 10, 10, 400, 600);
    c->Divide(1,2);
    c->cd(1);
    inpdata->Draw("x");
    TH1F * htemp = (TH1F*) gPad->GetPrimitive("htemp");
    TH1F * ht = (TH1F*) htemp->Clone();
    ht->SetLineWidth(2);
    ht->SetLineColor(kBlue);
    // PDF must be scaled to take account of # of Entries and bin width
    ht->Eval(PDF);
    ht->Scale( inpdata->GenEntries() * ht->GetBinWidth(1); )
    ht->Draw("C SAME");

    // plot contours
    c->cd(2);
    // Get contour for parameter 0 versus para 1 for ERRDEF = 4
    fit->SetErrorDef(4);	// note 4 and not 2!
    TMinuit * minuit = fit->GetMinuit();
    TGraph * gr2 = (TGraph*) minuit->Contour(40,0,1);
    gr2->SetTitle("1#sigma and 2#sigma contours ;tau;off-set;");
    gr2->SetFillColor(42);
    gr2->Draw("alf");
    // Get contour for parameter 0 versus para 1 for ERRDEF = 1
    fit->SetErrorDef(1);	
    TGraph * gr1 = (TGraph*) minuit->Contour(40,0,1);
    gr2->SetFillColor(38);
    gr2->Draw("lf");

    // clean up
    delete inpdata;
    delete PDF;
}
