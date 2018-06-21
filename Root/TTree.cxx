#include "TTree.h"
#include "TH1F.h"
/* The TTree class is optimized to reduce disk space and enhance access
 * speed. ( How ??? )
 */

TTree * t = new TTree;

// Fill tree
int a;
vector<float> vf, * vi = new vector<float>;
// wrong input
// vector<float> * vi;  // pointer without initialized
t->Branch("a", &a, "a/I");
// all the three expression below will work, but for consistency with 
// the SetBranchAddress, the first expression is recommended. 
t->Branch("vi", &vi);
t->Branch("vf", &vf );
t->Branch("vp", vi);  

// If you going to store a variable array, you have to specify its length
// in the note.
int n, v[100];
t->Branch("n", &n, "n/I");  // specify the length of array
t->Branch("v", v,  "v[n]/I");	// note the [n] in the note.

// Branch
// the Branch() function requires a pointer to a variable and a 
// definintion of the variable type. 
/*  _______________________________________________________
 *  type              size    C++                identifier
 *  -------------------------------------------------------
 *  signed integer    32 bit  int		    I
 *                    64 bit  long                  L
 *  unsigned integer  32 bit  unsigned int          i
 *                    64 bit  unsigned long         l
 *  floating point    32 bit  float                 F
 *                    64 bit  double                D
 *  boolean            -      bool                  O
 *  ________________________________________________________
 */                   

// read the tree
int b;
vector<float> * vp;  // wrong, vp not initialized
double ar[5];
t->SetBranchAddress("a", &b);
t->SetBranchAddress("vf", &vp ); // note here, set branch address to the address of a pointer to vecor.
t->SetBranchAddress("ar", ar);	// array type

// Non-object Branches: e.g. C-style structs, or arrays of variables
Double_t values[5];
TBranch * branch(const char * name, void *address, const char* leaflist, Int_t bufsize);
// address is a pointer to the beginning of the data.
// leaflist is the list of variable names, separated by ":". Var types 
// separated by "/"
TBranch *b = t->Branch("val", values, "a/D:b:c:d:e");

// Object branch
TBranch* Branch(const char* name, const char* classname, void ** addobj, ...);
// addobj is the address of the pointer.
TH1D * h = new TH1D("h", "h", 10, 0, 1);
TBranch * b2 = t->Branch("hBranch", "TH1D", &h);

// remove a branch from a tree
TBranch *b = t->GetBranch("branch_name");
t->GetListOfBranches()->Remove(b);
t->Write();

// add a branch to a tree
TBranch * b3 = t->Branch("bname", &bname);
for (int i=0; i<(int)t->GetEntries(); i++)
{
    b3->Fill();
}
t->Write();

// Inspect the content of a specific entry numerically
t->Show(1);

// Extract histogram from a tree
t->Draw("val >> hist(100, 0, 100)");
TH1F* new_hist = (TH1F*) gDirectory->Get("hist");

// MakeClass and MakeCode
t->MakeCode("fastCode.cxx"); // for large trees with many branches and leaves, and complicated objects

// makeselector, this generates the file MySelector.h and MySelector.C
t->MakeSelector("MySelector");
/* The template contains the entry points Begin() and SlaveBegin() 
 * called before processing of the TChain starts, Process() called for 
 * every entry of the chain, and SlaveTerminate() and Terminate() 
 * called after the last entry has been processed. Typically, 
 * initialization like booking of histograms is performed in 
 * SlaveBegin(), the analysis, i.e. the selection fo entries, 
 * calculations and filling of histograms, is done in Process(), and
 * final operations like plotting and storing of results happen in 
 * SlaveTerminate() or Terminate().
 */

// scatter plot
t->Draw("vi:vf");
// Be careful: it’s easy to fall into the trap of thinking that each 
// (x,y) point on a scatterplot represents two values in your n−tuple. 
// In fact, the scatterplot is a grid and each square in the grid is 
// randomly populated with a density of dots that’s proportional to 
// the number of values in that grid.
