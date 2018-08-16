/* the bar option allows to draw simple verticle bar charts.
 */

const int nx=8;
string os_X[nx] = { "8", "32", "128", "512", "2048", "8192", "32768", "131072"};
float d_35_0[nx] = {0.75, -3.30, -0.92, 0.10, 0.08, -1.69, -1.29, -2.37};
float d_35_1[nx] = {1.01, -3.02, -0.65, 0.37, 0.34, -1.42, -1.02, -2.10};

TCanvas* cb = new TCanvas("cb", "cb", 600, 400);
cb->SetGrid();

gStyle->SetHistMinimumZero();

TH1F * h1b = new TH1F("h1b", "Option B example", nx, 0, nx);
h1b->SetFillColor(4);
h1b->SetBarWidth(0.4);
h1b->SetBarOffset(0.1);
h1b->SetStats(0);
h1b->SetMinimum(-5);
h1b->SetMaximum(5);

for (int i=0; i<=nx; i++) {
    h1b->SetBinContent(i, d_35_0[i-1]);
    h1b->GetXaxis()->SetBinLabel(i, os_x[i-1].c_str());
}

h1b->Draw("b");

TH1F* h2b = new TH1F("h2b", "h2b", nx, 0, nx);
h2b->SetFillColor(38);
h1b->SetBarWidth(0.4);
h1b->SetBarOffset(0.5);
h1b->SetStats(0);
for (int i=1; i<=nx; i++) h2b->SetBinContent(i, d_35_1[i-1]);
h2b->Draw("b same");

return cb;
