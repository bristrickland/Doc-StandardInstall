void SetOKStyle()
{
  TStyle* OKStyle = new  TStyle("OKStyle", "OK Default Style");

  // Colors

  //set the background color to white
  OKStyle->SetFillColor(10);
  OKStyle->SetFrameFillColor(10);
  OKStyle->SetFrameFillStyle(0);
  OKStyle->SetFillStyle(0);
  OKStyle->SetCanvasColor(10);
  OKStyle->SetPadColor(10);
  OKStyle->SetTitleFillColor(0);
  OKStyle->SetStatColor(10);

  // Get rid of drop shadow on legends
  // This doesn't seem to work.  Call SetBorderSize(1) directly on your TLegends
  OKStyle->SetLegendBorderSize(1);

  //don't put a colored frame around the plots
  OKStyle->SetFrameBorderMode(0);
  OKStyle->SetCanvasBorderMode(0);
  OKStyle->SetPadBorderMode(0);

  //use the primary color palette
  OKStyle->SetPalette(1,0);

  //set the default line color for a histogram to be black
  OKStyle->SetHistLineColor(kBlack);

  //set the default line color for a fit function to be red
  OKStyle->SetFuncColor(kRed);

  //make the axis labels black
  OKStyle->SetLabelColor(kBlack,"xyz");

  //set the default title color to be black
  OKStyle->SetTitleColor(kBlack);

  //set the margins
  OKStyle->SetPadBottomMargin(0.15);
  OKStyle->SetPadLeftMargin(0.15);
  OKStyle->SetPadTopMargin(0.075);
  OKStyle->SetPadRightMargin(0.15);

  //set axis label and title text sizes
  OKStyle->SetLabelSize(0.04,"xyz");
  OKStyle->SetTitleSize(0.06,"xyz");
  OKStyle->SetTitleOffset(0.9,"xz");
  OKStyle->SetTitleOffset(1.1,"y");
  OKStyle->SetStatFontSize(0.05);
  OKStyle->SetTextSize(0.08);
  OKStyle->SetTitleBorderSize(0);

  //set line widths
  OKStyle->SetHistLineWidth(2);
  OKStyle->SetFrameLineWidth(2);
  OKStyle->SetFuncWidth(2);

  // Contour plots
  const Int_t NRGBs = 4;
  const Int_t NCont = 255;

  Double_t stops[NRGBs] = {  0.34, 0.61, 0.84, 1.00 };
  Double_t red[NRGBs]   = {  0.65, 0.40, 0.11, 0.00 };
  Double_t green[NRGBs] = {  0.74, 0.66, 0.56, 0.42 };
  Double_t blue[NRGBs]  = {  0.86, 0.81, 0.60, 0.35 };
  TColor::CreateGradientColorTable(NRGBs, stops, red, green, blue, NCont);
  OKStyle->SetNumberContours(NCont);

  // Misc

  //align the titles to be centered
  //OKStyle->SetTextAlign(22);

  //turn off xy grids
  OKStyle->SetPadGridX(0);
  OKStyle->SetPadGridY(0);

  //set the tick mark style
  OKStyle->SetPadTickX(1);
  OKStyle->SetPadTickY(1);

  //don't show the fit parameters in a box
  OKStyle->SetOptFit(0000);

  //set the default stats shown
  OKStyle->SetOptStat("nei");

  //marker settings
  OKStyle->SetMarkerStyle(8);
  OKStyle->SetMarkerSize(0.7);

  // Fonts
  //  OKStyle->SetStatFont(12);
  //  OKStyle->SetLabelFont(12,"xyz");
  //  OKStyle->SetTitleFont(12,"xyz");
  // OKStyle->SetTextFont(12);

  //  OKStyle->SetTitleSize(0.08);


  // Set the paper size for output
  OKStyle->SetPaperSize(TStyle::kA4);

  //done
  OKStyle->cd();

  cout << "Using OKStyle" << endl;
}
