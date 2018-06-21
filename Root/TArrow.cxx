#include "TArrow.h"

// Draw an arrow on the canvas
// TArrow arrow(x_1, y_1, x_2, y_2, value, style);
TArrow arrow(8, 8, 6.2, 23, 0.02, "----|>");
arrow.SetLineWidth(2);
arrow.DrawClone();
