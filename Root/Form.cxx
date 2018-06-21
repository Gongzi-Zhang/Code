int id = 1;
TFile f(Form("myFile_%u.root", id), "recreate");
TH1F h(Form("myHisto_%u",id),"The Histo", 64, -4, 4);
