# Root

# Navigation
basic	    Basic usage, class, color, font, style, attribute
samples	    some usage examples

## Online tutorials
cd $ROOTSYS/tutorials

# about root
What's ROOT:
    0) Object Oriented
    1) Visulization of Data
    2) Interpreter of C++
    3) Fitting Tools 

As every command you type into ROOT is usually interpreted by CINT,
an "escape char" is needed to pass commands to ROOT directly. This 
char is the dot at the beginning of a line.


# Global Variables
All global varibale in ROOT begin with a small "g". 
* gROOT : the gROOT variable is the entry point to the ROOT system. 
Technically it is an instance of the TROOT class. Using the gROOT 
pointer one has access to basically every object created in a ROOT
based program. The TROOT object is essentially a container of several
lists pointing to the main ROOT objects.

* gRandom : the gRandom variable is a variable that points to a random
number generator instance of the type TRandom3. Such a varibale is 
useful to access in every point of a program the same random number
generator, in order to achieve a good quality of the random sequence.

* gStyle : By default ROOT creates a default style that can be 
accessed via the gStyle pointer. This class includes functions to set
some of the following object attributes.
    -- Canvas
    -- Pad
    -- Histogram axis
    -- Lines
    -- Fill areas
    -- Text
    -- Markers
    -- Functions
    -- Histogram Statistcs and Titles

* gSystem : An instance of a base class defining a generic interface
to the underlying OS




gROOT->Reset(); // re-initialize ROOT
gROOT->SetStyle("Plain");   // set empty TStyle(nicer on paper)
gStyle->SetOptStat(111111); // print statistics on plots (0) for no out
gStyle->SetOptFit(1111);    // print fit results on plot (0) for no out
gStyle->SetPalette(1);	    // set nicer colors than default
gStyle->SetOptTitle(0);	    // suppress title box

# ROOT Coding Conventions
* Class names start with capital T: TH1F, TVector
* Names of non-class data types end with _t: Int_t
* Class method names start with a capital letter: TH1F:Fill()
* Class data member names start with a f: TH1:fXaxis
* Global variable names start with a g: gPaf
* Constant names start with a k: TH1::kNoStats
* Seperate words within names are capitalized: TH1::GetTitleOffset()
* Two capital characters are normally avoided: TH1::GetXaxis(), not TH1::GetXAxis()

# PAW file
Before ROOT, physicists used a package called CERNLIB to analyze data.
If you come across a file created with PAW, HBOOK, or CENRLIB( 
actually, to first order these are three different names for the same
thing.), to read it in ROOT, we need to convert it into .root format
using h2root.
> h2root file.hbook


# Root in Science
What ROOT Do:
    1): compare of data with model, and fitting experimental data to get
model parameters.
	1.1) distribution of data (histogram)
	1.2) statical treatment to extract model parameters.
    2): Simulation
    By repeated generation of "pseudo-data", which are anaylysed in 
the same manner as intended for the real data, analysis procedures 
can be validated or compared. In many cases, the distribution of 
measurement errors is not precisely known, and simulation offers the 
possibility to test the effects of different assumptions.
	
    Very often it is necessary to study the statistical properties of
analysis procedures. This is most easily achieved by applying the 
anylysis to many sets of simulated data, each representing one possible
version of the true experiment. If the simulation only deals with the
final distributions observed in data, and does not perform a full
simulation of the underlying physics and the experimental apparatus,
the name "Toy Monte Carlo" is frequently used. Since the true values 
of all parameters are known in the pseudo-data, the differences 
between the parameter estimates from the analysis procedure w.r.t. 
the true value can be determined, and it is also possible to check that
the analysis procedure provides correct error estimates.


