#!/usr/bin/python 
##############
## Make Plots
##############

########################
# Libraries and Includes
########################

# Python System Modules
import os,sys,glob
import logging

import array
# Python Paths

# Python Math Modules
import array
from math import sqrt,fabs,sin,pow

# ROOT Modules
from ROOT import TFile,TTree,TChain,TBranch,TH1F,TH2F,THStack
from ROOT import TCanvas,TPad
from ROOT import TLorentzVector
from ROOT import gROOT, gDirectory,gStyle
from ROOT import TPaveText, TLegend, TLatex
import ROOT

###############################
# User defined drawing function
###############################

if __name__ == "__main__":

    ############################
    # Plot for Unfolding Results
    ############################
    
    VAR = ["leadingJetPt", "secondJetPt", "met", "met_soft", "oppositeJet", "mTZZ", "zPt", "zEta", "M2Lep", "dLepR", "dMetZPhi", "mjj", "detajj", "jetSumPt", "METOHT" ]
    TITLE = { "leadingJetPt" : "Pt_leadingJet[GeV]",
              "secondJetPt"  : "Pt_SubleadingJet[GeV]",
              "oppositeJet"  : "#eta_{j1} * #eta_{j2}",
              "met"          : "Missing Et[GeV]",
              "met_soft"     : "Missing Et_{soft} [GeV]",
              "mTZZ"         : "mT_{ZZ}[GeV]",
              "zPt"          : "Pt_{Z}[GeV]",
              "zEta"         : "#eta_{Z}",
              "M2Lep"        : "M_{ll}[GeV]",
              "dLepR"        : "#DeltaR_{ll}",
              "dMetZPhi"     : "#Delta#phi_{MET,Z}",
              "mjj"          : "M_{jj}[GeV]",
              "detajj"       : "#Delta#eta_{jj}",
              "jetSumPt"     : "#SigmaPt_{jet}",
              "METOHT"       : "MET/H_{T}",
              "score"        : "score",
              "score_cut"    : "score",
            }
    # open file
    sig_file      = TFile("sig_hist.root")
    Diboson_file  = TFile("Diboson_hist.root")
    Triboson_file = TFile("Triboson_hist.root")
    Top_file      = TFile("Top_hist.root")
    W_jets_file   = TFile("W+jets_hist.root")
    Z_jets_file   = TFile("Z+jets_hist.root")
    data_file     = TFile("data_hist.root")

    
    for var in VAR:
        hs = THStack(var, "")
        # load basic histograms
        sig_hist      = sig_file.Get(var) 
        Diboson_hist  = Diboson_file.Get(var) 
        Triboson_hist = Triboson_file.Get(var) 
        Top_hist      = Top_file.Get(var) 
        W_jets_hist   = W_jets_file.Get(var) 
        Z_jets_hist   = Z_jets_file.Get(var) 
        data_hist     = data_file.Get(var) 

        # renormalization
        scale = 36.5/40;
        sig_hist.Scale( scale )
        Diboson_hist.Scale( scale )
        Triboson_hist.Scale( scale )
        Top_hist.Scale( scale )
        W_jets_hist.Scale( scale )
        Z_jets_hist.Scale( scale )

        MC_hist = sig_hist.Clone()
        MC_hist.Add(Diboson_hist)
        MC_hist.Add(Triboson_hist)
        MC_hist.Add(Top_hist)
        MC_hist.Add(W_jets_hist)
        MC_hist.Add(Z_jets_hist)
        ratio_hist = data_hist.Clone(var+"_ratio")
        ratio_hist.Divide(MC_hist)

#        hs.Add(sig_hist)
        hs.Add(W_jets_hist)
        hs.Add(Triboson_hist)
        hs.Add(Top_hist)
        hs.Add(Diboson_hist)
        hs.Add(Z_jets_hist)

        sig_hist.SetFillColor(2)
        sig_hist.SetMarkerColor(2)
        sig_hist.SetMarkerSize(1)
        sig_hist.SetMarkerStyle(ROOT.kFullCircle)
        sig_hist.SetLineColor(2)
        sig_hist.SetLineWidth(2)
        Diboson_hist.SetFillColor(3)
        Diboson_hist.SetMarkerColor(3)
        Diboson_hist.SetMarkerSize(1)
        Diboson_hist.SetMarkerStyle(0)
        Diboson_hist.SetLineColor(3)
        Diboson_hist.SetLineWidth(0)
        Triboson_hist.SetFillColor(4)
        Triboson_hist.SetMarkerColor(4)
        Triboson_hist.SetMarkerSize(1)
        Triboson_hist.SetMarkerStyle(0)
        Triboson_hist.SetLineColor(4)
        Triboson_hist.SetLineWidth(0)
        Top_hist.SetFillColor(6)
        Top_hist.SetMarkerColor(6)
        Top_hist.SetMarkerSize(1)
        Top_hist.SetMarkerStyle(0)
        Top_hist.SetLineColor(6)
        Top_hist.SetLineWidth(0)
        W_jets_hist.SetFillColor(7)
        W_jets_hist.SetMarkerColor(7)
        W_jets_hist.SetMarkerSize(1)
        W_jets_hist.SetMarkerStyle(0)
        W_jets_hist.SetLineColor(7)
        W_jets_hist.SetLineWidth(0)
        Z_jets_hist.SetFillColor(5)
        Z_jets_hist.SetMarkerColor(5)
        Z_jets_hist.SetMarkerSize(1)
        Z_jets_hist.SetMarkerStyle(0)
        Z_jets_hist.SetLineColor(5)
        Z_jets_hist.SetLineWidth(0)
        data_hist.SetFillColor(1)
        data_hist.SetMarkerColor(1)
        data_hist.SetMarkerSize(1)
        data_hist.SetMarkerStyle(ROOT.kFullSquare)
        data_hist.SetLineColor(1)
        data_hist.SetLineWidth(2)


        leg = TLegend(0.77, 0.7, 0.97, 0.99)
        leg.AddEntry(data_hist, "Data", "lep")
        leg.AddEntry(Diboson_hist, "Diboson")
        leg.AddEntry(Triboson_hist, "Triboson")
        leg.AddEntry(Z_jets_hist, "Z+jets")
        leg.AddEntry(Top_hist, "Top")
        leg.AddEntry(W_jets_hist, "W+jets")
        leg.AddEntry(sig_hist, "signal", "lep")

        tex1 = TLatex(0.54,0.75, "#int Ldt = 36.5 fb^{-1}")
        tex1.SetNDC()
        tex1.SetTextFont(42)
        tex1.SetLineWidth(2)
        tex2 = TLatex(0.54,0.85, "#sqrt{s} = 13 TeV")
        tex2.SetNDC()
        tex2.SetTextFont(42)
        tex2.SetLineWidth(2)
        tex3 = TLatex(0.54,0.93, "ATLAS Internal")
        tex3.SetNDC()
        tex3.SetTextFont(42)
        tex3.SetLineWidth(2)

        cc = TCanvas(var, var, 800, 750)
#        cc.SetLogy()
        pad1 = TPad("p1", "p1", 0, 0.25, 1, 1, 0, 0)
        pad1.SetMargin(0.15, 0.03, 0, 0.01)
        pad2 = TPad("p2", "p2", 0, 0, 1, 0.25, 0, 0)
        pad2.SetMargin(0.15, 0.03, 0.3, 0.01)
        pad2.SetGrid()
        pad1.Draw()
        pad2.Draw()

        pad1.cd()
        pad1.SetLogy()
        hs.SetMinimum(0.1)
        hs.Draw("HIST")
#        hs.GetXaxis().SetTitle(TITLE[var])
        hs.GetYaxis().SetTitle("Events")
        hs.GetYaxis().SetTitleOffset(0.8)
        hs.GetYaxis().SetTitleSize(0.05)
        data_hist.Draw("same""LPE")
        sig_hist.Draw("same""LPE")
        leg.Draw()
        tex1.Draw()
        tex2.Draw()
        tex3.Draw()

        ROOT.gStyle.SetOptStat(0)
        ROOT.gStyle.SetOptTitle(0)
        pad2.cd()
        ratio_hist.SetMarkerColor(4)
        ratio_hist.SetMarkerSize(1)
        ratio_hist.SetMarkerStyle(ROOT.kFullCircle)
        ratio_hist.Draw()
        ratio_hist.GetXaxis().SetTitle(TITLE[var])
        ratio_hist.GetXaxis().SetTitleOffset(0.9)
        ratio_hist.GetXaxis().SetTitleSize(0.15)
        ratio_hist.GetXaxis().SetLabelSize(0.1)
        ratio_hist.GetYaxis().SetTitle("Data/MC")
        ratio_hist.GetYaxis().SetTitleOffset(0.3)
        ratio_hist.GetYaxis().SetTitleSize(0.15)
        ratio_hist.GetYaxis().SetLabelSize(0.1)
        ratio_hist.SetMinimum(0)
        ratio_hist.SetMaximum(2)
        ratio_hist.GetYaxis().SetNdivisions(5+100*5)
        cc.Update()
        cc.SaveAs("{0}.png".format(var))
        
    sig_file.Close()
    Diboson_file.Close()
    Triboson_file.Close()
    Top_file.Close()
    W_jets_file.Close()
    Z_jets_file.Close()
    data_file.Close()
