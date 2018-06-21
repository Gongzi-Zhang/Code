#include "TChain.h"
/* deal with number of large Root files with same trees
 * TChain is just a collection of trees, use it like a tree.
 */

TChain chain("tree");	// takes the name of TTree as an argument
chain.Add("file1.root");
chain.Add("file2.root");
chain.Add("file3.root");
chain.Add("file*.root");    // wildcards  is allowed.
// if a file is add multitimes, it will be process more than once. 
// Be careful.
chain.Draw("x");

// TProof for parallel processing, or distributed system or 
// multi-core system
TProof::Open("workers=4");
ch->SetProof();

/* the Open method starts a local PROOF server, and the command 
 * ch->SetProof() enables processing of the chain using PROOF. Now, 
 * when issuing the command ch->Process("MySelector.C+"); the code in
 * MySelector.C is compiled and executed on each slave node.
 * The Begin() and Terminate() are executed on the master only.
 */

// TSelector
chain.Process("MySelector.C+");	// MySelector.C is produced from 
				// t->MakeSelector("MySelector") in 
				// TTree.cxx file.
// The "+" appended to the name of the macro to be executed initiates
// the compilation of the MySelector.C with the system compiler in 
// order to improve preformance.
