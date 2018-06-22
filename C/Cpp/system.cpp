#include "TSystem.h"
#include <iostream>
#include <fstream>

using namespace std;

void main()
{
    char buf[1000];
    getcwd(buf, sizeof(buf));
    setenv("LOCAL", buf, 1);
    FILE* fp;

}
