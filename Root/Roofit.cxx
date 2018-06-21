#include "TCanvas.h"
#include "TFrame.h"
#include "TString.h"
#include "TF1.h"
#include "TH1.h"
#include "TFile.h"
#include "TROOT.h"
#include "p_exp.cxx"
#include <string>
#include <fstream>

const double p_m = 0.938272;  // Gev/c
const double e_m = 5.109989e-04;

void select( const double energy, const TFile* mc, const TFile* real ){
	// construct filename from the energy mark
	std::string str = std::to_string(energy);
	std::string filename_tmp("PPbar_");
	filename_tmp += str;
	filename_tmp += ".root";
	const char * filename = filename_tmp.c_str();
	TFile f(filename,"UPDATE");

	if(!mc->IsOpen()) { 
		cout << "Invalid pointer to a root file!" <<endl;
		exit 1;
	}
	if(!real->IsOpen()){
		cout << "Invalid pointer!" << endl;
		exit 1;
	}

	mc->cd();
	double p_exp_p, e_exp_p;
	p_exp_p = p_exp(energy,p_m);
	e_exp_p = p_exp(energy,e_m);
	PPbar->Draw("p_p>>mc_p","p_p<(p_exp_p+e_exp_p)/2&&angle*180.8/3.1415926>178&&p_pz/p_p<0.8");
	PPbar->Draw("p_angle>>mc_angle","p_p<(p_exp_p+e_exp_p)/2&&angle*180.8/3.1415926>178&&p_pz/p_p<0.8");
	PPbar->Draw("p_pz/p_p>>mc_cos","p_p<(p_exp_p+e_exp_p)/2&&angle*180.8/3.1415926>178&&p_pz/p_p<0.8");
	mc_p->SetDirectory(&f);
	mc_angle->SetDirectory(&f);
	mc_cos->SetDirectory(&f);
	mc->Close();

	real->cd();
	PPbar->Draw("p_p>>real_p","p_p<(p_exp_p+e_exp_p)/2&&angle*180.8/3.1415926>178&&p_pz/p_p<0.8");
	PPbar->Draw("p_angle>>real_angle","p_p<(p_exp_p+e_exp_p)/2&&angle*180.8/3.1415926>178&&p_pz/p_p<0.8");
	PPbar->Draw("p_pz/p_p>>real_cos","p_p<(p_exp_p+e_exp_p)/2&&angle*180.8/3.1415926>178&&p_pz/p_p<0.8");
	real_p->SetDirectory(&f);
	real_angle->SetDirectory(&f);
	real_cos->SetDirectory(&f);
	real->Close();

	TCanvas angle("angle");
		gStyle->SetLineColor(5);
		mc_angle->UseCurrentStyle();
		mc_angle->DrawNormalized("same",4000);

		gStyle->SetLineColor(7);
		real_angle->UseCurrentStyle();
		real_angle->DrawNormalized("same",6000);

	angle.Write();
	angle.Destroyed();

	TCanvas cos("cos");
		gStyle->SetLineColor(5);
		mc_cos->UseCurrentStyle();
		mc_cos->DrawNormalized("same",4000);

		gStyle->SetLineColor(7);
		real_cos->UseCurrentStyle();
		real_cos->DrawNormalized("same",6000);

	cos.Write();
	cos.Destroyed();
		
	TCanvas p("p");
		gStyle->SetLineColor(5);
		mc_p->UseCurrentStyle();
		mc_p->DrawNormalized("same",4000);

		gStyle->SetLineColor(7);
		real_p->UseCurrentStyle();
		real_p->DrawNormalized("same",6000);

	p.Write();
	p.Destroyed();

		// fit gaussian + poly to mc data
		RooRealVar x("x","x",0,2);
		RooRealVar mean("mean","mean of mc",p_exp_p,0,2);
		RooRealVar sigma("sigma","sigma of mc",0,0,1);
		RooGaussian gauss("gauss","gauss(x,mean,sigma)",x,mean,sigma);

		// polynomial model for background event
//		RooPolynomial bg("bg","background",x,RooArgSet(RooConst(0),RooConst(2)));
//		function RooConst is undefined in current scope!
		RooConstVar low("low","low eadge",0);
		RooConstVar upper("upper","upper eadge",2);
		RooPolynomial bg("bg","background",x,RooArgSet(low,upper));
		

		// mixed model
		RooRealVar coef("coef","coefficient for bg",0.001,0,0.1);
		RooAddPdf model("model","model for mc",RooArgList(bg,gauss),coef);

		// data
		RooDataHist data("data","dataset of mc",x,mc_p);
		RooPlot * frame = x.frame();
		data.plotOn(frame);

		model.fitTo(data);
		model.plotOn(frame);

		double m = mean.getVal();
		double s = sigma.getVal();
		double c = coef.getVal();

		ofstream out;
		out.open("Fitting.txt",std::fstream::app);
		if(out.is_open()) {
		out << "Energy point: " << energy << endl;
		out << "Expect momentum: " << p_exp_p << endl;
		out << "RooFit result for mc: " << endl;
		out << "Gaussian: \n" << "mean:" << m << " sigma: " << s << endl;
		out << "bg: \n" << "coefficient" << c << endl;
		}

		RooRealVar mean1("mean1","mean of real",m,0,2);
		RooRealVar sigma1("sigma1","sigma of real",s,0,1);
		RooGaussian gauss1("gauss1","gauss1(x,mean1,sigma1)",x,mean1,sigma1);

		RooRealVar coef1("coef1","coefficient for bg",c,0,0.1);
		RooAddPdf model1("model1","model for real",RooArgList(bg,gauss1),coef1);
		
		RooDataHist data1("data1","dataset of real",x,real_p);
		data1.plotOn(frame);

		model1.fitTo(data1);
		model1.plotOn(frame);

		frame->Draw();

		m = mean1.getVal();
		s = sigma1.getVal();
		c = coef1.getVal();

		if(out.is_open()) {
		out << "RooFit result for realdata: " << endl;
		out << "Gaussian: \n" << "mean:" << m << " sigma: " << s << endl;
		out << "bg: \n" << "coefficient" << c << endl;
		}
		out.close();

}
