#include "TGraph.h"

/* The option "A" in TGraph::Draw computes the graph range , clear
 * the pad and draw the Axis. The statement gr->Draw("P") draws only
 * the graph in the current pad.
 * The reason why you see only part of the picture is that the default
 * canvas range is [0,1] in x and y.
 * You could have set the canvas/pad range, example:
 */
graph->Range(-0.3,-1,1.1,12);
gr->Draw("P");
