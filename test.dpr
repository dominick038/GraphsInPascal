program test;

uses
  Vcl.Forms,
  fMainMenu in 'fMainMenu.pas' {DataVisMainMenu},
  fLineGraph in 'fLineGraph.pas' {LineGraphChildForm},
  fBarGraph in 'fBarGraph.pas' {BarGraphChildForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataVisMainMenu, DataVisMainMenu);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
