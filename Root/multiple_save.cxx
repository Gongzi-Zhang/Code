// save multiple pages to one document
TCanvas c1("c1");
h1.Draw(); // assumes that h1, h2, h3 are defined
c1.Print("c1.ps("); // write canvas and keep the ps file open
h2.Draw();
c1.Print("c1.ps");  // canvas is added to "c1.ps"
h3.Draw();
c1.Print("c1.ps)"); // canvas is added to "c1.ps" and ps file is closed
