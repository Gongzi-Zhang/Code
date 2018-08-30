#include "TFile.h"
// Open a file
TFile * f = new TFile("input_file.root");
// even input file doesn't exist, f will be assigned a value(not null);
if(! f->IsOpen() ) 
{
    printf("Error opening New root file \n");
    return 0;
}

// Get Object
// suppose there is a histogram in f
TH1F * h = (TH1F*) f->GetObjectChecked("my_histogram", "TH1F");
// checked, check what ???
// Although you can access an object within a file also with the Get
// function and a dynamic type cast, it is advisable to use 
// GetObjectChecked ???  Why???

// delete object
f->Delete("T;1");   // delete a tree

// save object
// Any object created are linked to the last opened file, to save an 
// object to another file, you have to specified it:
h->SetDirectory("file_name");

// file format
// "": padname.ps
// .[name]: the padname is added in front
// .eps: Encapsulated Postscript file
// .pdf
// .svg
// .gif: GIF
// .gif+NN an animated GIF file
// .xpm
// .png
// .jpg: JPEG
// .tiff
// .C | .cxx
// .root
// .xml
