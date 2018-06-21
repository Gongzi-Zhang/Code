#include "TGraph.h"

/* Draw Option:[ options are not case sensitive and they can be concatenated randomly]
 * "L" A simple poly-line between every points is drawn
 * "F" A fill area is drawn
 * “F1” Idem as "F" but fill area is no more repartee around X=0 or Y=0
 * "F2" draw a fill area poly line connecting the center of bins
 * "A" Axis are drawn around the graph
 * "C" A smooth curve is drawn
 * "*" A star is plotted at each point
 * "P" The current marker of the graph is plotted at each point
 * "B" A bar chart is drawn at each point
 * "[]" Only the end vertical/horizontal lines of the error bars are drawn. This option only applies to the TGraphAsymmErrors.
 * "1" ylow = rwymin 
 */
int x[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int y[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
TGraph Scatter_plot(10, x, y);
Scatter_plot.SetMarkerColor(8);
Scatter_plot.SetMarkerSize(3);
Scatter_plot.SetMarkerStyle(21);
Scatter_plot.Draw();
