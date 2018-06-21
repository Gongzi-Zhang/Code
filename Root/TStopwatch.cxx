#include "TStopwatch.h"
#include <iostream>

TStopwatch timer;
timer.start();
timer.stop();

cout << timer.RealTime() << " " << timer.CpuTime() << endl;
