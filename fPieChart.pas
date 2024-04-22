unit fPieChart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VclTee.Series;

type
  TDataArray = TArray<Integer>;

  TPieChartChildGraph = class(TForm)
    PieChart: TChart;
    procedure FormCreate(Sender: TObject);
  private
    procedure InitializePieChartSettings;
    procedure AddSliceToPie(const Values: TDataArray; const Captions: TArray<String>; const Colors: TArray<TColor>);
  public
    { Public declarations }
  end;

var
  PieChartChildGraph: TPieChartChildGraph;

implementation

{$R *.dfm}

procedure TPieChartChildGraph.AddSliceToPie(const Values: TDataArray; const Captions: TArray<String>; const Colors: TArray<TColor>);
var
  PieSeries: TPieSeries;
  i: Integer;
begin
  PieSeries := TPieSeries.Create(Self);
  PieSeries.MultiPie := mpAutomatic;
  PieSeries.Marks.Style := smsPercent;

  for i := 0 to High(Values) do
  begin
    PieSeries.Add(Values[i], Captions[i], Colors[i]);
  end;

  PieChart.AddSeries(PieSeries);
end;

procedure TPieChartChildGraph.FormCreate(Sender: TObject);
const
  SampleValues: TDataArray = [25, 15, 60];
  SampleCaptions: TArray<String> = ['Huur', 'Eten', 'Anders'];
  SampleColors: TArray<TColor> = [clRed, clGreen, clBlue];
begin
  InitializePieChartSettings;
  AddSliceToPie(SampleValues, SampleCaptions, SampleColors);
end;

procedure TPieChartChildGraph.InitializePieChartSettings;
begin
  PieChart.View3D := True;
  PieChart.Title.Font.Size := 20;
  PieChart.Title.Caption := 'Maandelijkse uitgaven';
  PieChart.Legend.Visible := True;
end;

end.

