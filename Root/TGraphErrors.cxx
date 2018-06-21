#include "TGraphErrors.h"

const int n_points = 10;
double x_vals[n_points] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
double y_vals[n_points] = {6, 12, 14, 20, 22, 24, 35, 45, 44, 53};
double y_errs[n_points] = {5, 5, 4.7, 4.5, 4.2, 5.1, 2.9, 4.1, 4.8, 5.43};

// constructor
TGraphErrors(const TH1* h); // create a TGraphErrors plot based on 
			    // values in a histogram.
TGraphErrors graph(n_points, x_vals, y_vals, NULL, y_errs);
// Define in one shot the title of the graph and the titles of the two
// axes, separated by ";"
graph.SetTitle("Measurement XYZ; lenght [cm]; Arb.Units");

graph.DrawClone("APE");
TF1 f("linear law", "[0]+x*[1]", .5, 10.5);
f.SetLineColor(kRed);
f.SetLineStyle(2);
graph.Fit(&f);	// fit, using a pointer to a function.

// another Constructor
TGraphErrors(const char *filename, const char *format="%lg %lg %lg %lg", Option_t *option="");

/*
 * "%lg %lg" read only 2 first columns into X,Y
 * "%lg %lg %lg" read only 3 first columns into X,Y and EY
 * "%lg %lg %lg %lg" read only 4 first columns into X,Y EX,EY
 */
// is there any case that we need X,Y and EX, in this case, we can
// transform X,Y and read X, Y and EY.
