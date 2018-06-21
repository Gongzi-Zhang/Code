#include "TNtuple.h"

/* Advantage of N-tuples
 * optimised disk I/O
 * Possibility to store many n-tuple rows (millions)
 * write the n-tuple in ROOT files
 * Store not only numbers, but also objects in columns
 */

// Constructor
TNtuple* my_tuple = new TNtuple("InputData","InputData","x:y:z");
//		                 Name        title       varlist


// get ntuple contents
// suppose a ntuple instance--my_tuple, which contains four variables: potential:Current:Temperature:Pressure
float pot, cur, temp, pres;
float * row_content;

for (int i=0; i<my_tuple->GetEntries(); i++)
{
    my_tuple->GetEntry(i);
    row_content = my_tuple->GetArgs();
    pot = row_content[0];
    cur = row_content[1];
    temp = row_content[2];
    pres = row_content[3];
}

/* You should think about the design of your n-tuples and your analyses as
 * soon as the processing time exceeds some minutes
 * * try to keep your n-tuple simple and use appropriate variable types. If
 *   your measurement has only a limited precision, it is needless to store
 *   it with double precision.
 * * Experimental conditions that do not change with every single
 *   measurement should be stored in a seperate tree. Although the
 *   compression can handle redundant values, the processing time increase
 *   with every variable that has to be filled.
 * * the function SetCacheSize(long) specifies the size of the cache for
 *   reading a TTree object from a file. The default value id 30MB. A 
 *   manual increase may help in certain situation. Note that the caching
 *   mechanism can cover only one TTree object per TFile object
 * * You can select the branches to be coverd by the caching algorithm with
 *   AddBranchToCache() and deactivate unneede branches with
 *   SetBranchStatus. 
 * * You can measure the performance easily with TTreePerfStats. 
 */
