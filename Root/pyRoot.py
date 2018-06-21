#!/bin/python3.4

from ROOT import TTree, gDiretory

myfile = TFile('myfile')
mytree = gDirectory.Get("tree")
entries = mytree.GetEntriesFast()

chi2Hist = TH1D("chi2", "Histogram of Chi2", 100, 0, 20)
# loop goes here
for j in xrange( entries ):
    chi2 = mytree.chi2  # set branch address ???
    nb = mytree.GetEntry( j )
    if nb <= 0:
        continue
    chi2Hist.Fill(chi2)

chi2Hist.Draw()
