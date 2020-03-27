TPaveStats * st;
c1->Update();	// to force the generation of the stats box
st = (TPaveStats*) h->GetListOfFunctions()->FindObject("stats");    // remember to update canvas before you call this function, otherwise you will get an NULL pointer
st = (TPaveStats*)c1->GetPrimitive("stats");

// Change postion of statistic box
st->SetX1NDC(0.4);
st->SetX2NDC(0.6);
st->SetY1NDC(0.5);
st->SetY2NDC(0.7);

// stats and fit entries/format
st->SetOptStat(1111);
st->SetOptFit(0011);
st->SetStatFormat("2.3e");
st->SetFitFormat("2.3e");


st->SetName("MyStats");	// !!!Very important!!!, in order to change contents in stats box
h->SetStats(0);	// avoid automatic redrawing of stats


// add customized content
char name[30];
float value = 20.4;
sprintf(name, "MyVal = %.0f", value);
st->AddText(name);
st->DrawClone();
