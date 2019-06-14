#include <TGClient.h>
#include <TCanvas.h>
#include <TF1.h>
#include <TRandom.h>
#include <TGButton.h>
#include <TGFrame.h>
#include <TRootEmbeddedCanvas.h>
#include <RQ_OBJECT.h>

class MyGui{
    RQ_OBJECT("MyGui")
    private:
	TGMainFrame	    *fMain;
	TRootEmbeddedCanvas *fEcanvas;
    public:
	MyGui(const TGWindow *p, UInt_t w, UInt_t h);
	virtual ~MyGui();
	void DoDraw();
};

MyGui::MyGui(const TGWindow *p, UInt_t w, UInt_t h){
    // Create a main frame
    fMain = new TGMainFrame(p, w, h);

    // Create canvas widget
    fEcanvas = new TRootEmbeddedCanvas("Ecanvas", fMain, 200, 200);
    fMain->AddFrame(fEcanvas, new TGLayoutHints(kLHintsExpandX | kLHintsExpandY, 10, 10, 10, 1));

    // horizontal frame widget with buttons
    TGHorizontalFrame *hframe = new TGHorizontalFrame(fMain, 200, 40);
    // draw button
    TGTextButton *draw = new TGTextButton(hframe, "&Draw");
    draw->Connect("Clicked()", "MyGui", this, "DoDraw()");
    hframe->AddFrame(draw, new TGLayoutHints(kLHintsCenterX, 5, 5, 3, 4));
    // exit button
    TGTextButton *exit = new TGTextButton(hframe, "&Exit", "gApplication->Terminate(0)");
    hframe->AddFrame(exit, new TGLayoutHints(kLHintsCenterX, 5, 5, 3, 4));
    fMain->AddFrame(hframe, new TGLayoutHints(kLHintsCenterX, 2, 2, 2, 2));

    // main frame name
    fMain->SetWindowName("Gui Example");

    // map all subwindows of main frame
    fMain->MapSubwindows();

    // Initialize the layout algorithm
    fMain->Resize(fMain->GetDefaultSize());

    // Map main frame
    fMain->MapWindow();
    DoDraw();
}

void MyGui::DoDraw() {
    TF1* f1 = new TF1("f1", "sin(x)/x", 0, gRandom->Rndm()*10);
    f1->SetLineWidth(3);
    f1->Draw();
    TCanvas *fCanvas = fEcanvas->GetCanvas();
    fCanvas->cd();
    fCanvas->Update();
}

MyGui::~MyGui() {
    // Clean up used widgets: frames, buttons, layout hints
    fMain->Cleanup();
    delete fMain;
}

void gui() {
    new MyGui(gClient->GetRoot(), 200, 200);
}
