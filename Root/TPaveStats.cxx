TPaveStats * st;
c1->Update();	// to force the generation of the stats box
st = (TPaveStats*) h->GetListOfFunctions()->FindObject("stats");    // remember to update canvas before you call this function, otherwise you will get an NULL pointer

// Change postion of statistic box
st->SetX1NDC(0.4);
st->SetX2NDC(0.6);
st->Set41NDC(0.5);
st->SetY2NDC(0.7);
