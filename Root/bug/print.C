#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include "TROOT.h"
#include "TStyle.h"
#include "TFile.h"
#include "TTree.h"
#include "TGraphErrors.h"
#include "TH1F.h"
#include "TF1.h"
#include "TCanvas.h"
#include "TPad.h"

using namespace std;

void CanvasPrint() {
  // vector<const char*> s_minirun; // bug appears onl when type is const char*, but not string
  // vector<char*> s_minirun;	    // char* also doesn't work
  vector<string> s_minirun;
  gROOT->SetBatch(1);

  for (int i=0; i<20; i++) {
      s_minirun.push_back(Form("entry_%d", i));
  }

  const int nminirun = s_minirun.size();
  TCanvas c("c", "c", 800, 600);
  // for (int i=0; i<10; i++) {
  for (int i=0; i<20; i++) {	// only when loop number is large enough

    cout << "Debug1: " << i << endl;
    for(int iminirun=0; iminirun<nminirun; iminirun++) {
      cout << "Debug1: " << s_minirun[iminirun] << endl;
    }

    c.Print("test.pdf");    // this line will affect s_minirun;

    cout << "Debug4: " << i << endl;
    for(int iminirun=0; iminirun<nminirun; iminirun++) {
      cout << "Debug4: " << s_minirun[iminirun] << endl;
    }
  }
}

int main() {
    CanvasPrint();
}
