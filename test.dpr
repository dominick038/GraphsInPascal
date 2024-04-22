program test;

uses
  Vcl.Forms,
  fMainMenu in 'fMainMenu.pas' {DataVisMainMenu},
  fLineGraph in 'fLineGraph.pas' {LineGraphChildForm},
  fBarGraph in 'fBarGraph.pas' {BarGraphChildForm},
  fPieChart in 'fPieChart.pas' {PieChartChildGraph};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataVisMainMenu, DataVisMainMenu);
  Application.CreateForm(TPieChartChildGraph, PieChartChildGraph);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
