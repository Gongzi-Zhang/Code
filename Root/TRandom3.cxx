#include "TRandom.h"
#include "TRandom1.h"
#include "TRandom2.h"
#include "TRandom3.h"

// Initialize random generator with random seed
TRandom(0);
// with specified seed
TRandom(Int_t seed);
TRandom.SetSeed();

// with a random generator, we can get random numbers disttributed 
// according to different probability density functions, like the
// Uniform one
TRandom random_generator;
double z;
z = random_generator.Uniform(-e, e);
z = random_generator.Binomial(10, .4);	// (int ntot, double prob)
z = random_generator.Poisson(e);    // e is the mean value
z = random_generator.Exp(4);	// 
z = random_generator.Gaus(0, 2);
