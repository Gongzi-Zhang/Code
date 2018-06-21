#include "TProof.h"
#include "TChain.h"

TChain * ch = new TChain("tree_name", "My Chain for example N_tuple");
ch->Add("example.file");

TProof::Open("workers=4");
ch->SetProof();
ch->Process("MySelector.C+") 

/* the Open method starts a local PROOF server, and the command 
 * ch->SetProof() enables processing of the chain using PROOF. Now, 
 * when issuing the command ch->Process("MySelector.C+"); the code in
 * MySelector.C is compiled and executed on each slave node.
 */
