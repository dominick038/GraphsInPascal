unit fLineGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VclTee.Series;

type

  TTwoDimensionalArray = TArray<TArray<Integer>>;

  TLineGraphChildForm = class(TForm)
    LineGraphChart: TChart;
    procedure FormCreate(Sender: TObject);
  private
    procedure InitializeLineGraphSettings;
    procedure AddLineToChart(const TwoDimensionalArray: TTwoDimensionalArray; const Caption: string; const LineColor: TColor); overload;
  end;

var
  LineGraphChildForm: TLineGraphChildForm;

const
  MoneySpentOverDaysPersonA: TTwoDimensionalArray = [
    [5, 1300], [10, 1100], [15, 965], [20, 435], [25, 201], [30, 58]
  ];

  MoneySpentOverDaysPersonB: TTwoDimensionalArray = [
    [5, 1800], [10, 1525], [15, 1300], [20, 800], [25, 435], [30, 295]
  ];

  LineWidth = 2;

implementation

{$R *.dfm}

procedure TLineGraphChildForm.AddLineToChart(const TwoDimensionalArray: TTwoDimensionalArray; const Caption: string; const LineColor: TColor);
begin
  var LineSeries := TLineSeries.Create(Self);
  LineSeries.LinePen.Width := LineWidth;
  LineSeries.Color := LineColor;
  LineSeries.Title := Caption;
  
  for var Axis in TwoDimensionalArray do
  begin
    LineSeries.AddXY(Axis[0], Axis[1]);
  end;

  LineGraphChart.AddSeries(LineSeries);
end;

procedure TLineGraphChildForm.FormCreate(Sender: TObject);
begin
  InitializeLineGraphSettings;

  AddLineToChart(MoneySpentOverDaysPersonB, 'Persoon A', clRed);  
  AddLineToChart(MoneySpentOverDaysPersonA, 'Persoon B', clBlue);
end;

procedure TLineGraphChildForm.InitializeLineGraphSettings;
begin
  LineGraphChart.View3D := False;
  LineGraphChart.Title.Font.Size := 20;
  LineGraphChart.Title.Caption := 'Rekening overzicht over 30 dagen';

  LineGraphChart.LeftAxis.Title.Font.Size := 10;
  LineGraphChart.LeftAxis.Title.Caption := 'Geld ($)';
  
  LineGraphChart.BottomAxis.Title.Font.Size := 10;
  LineGraphChart.BottomAxis.Title.Caption := 'Dag';
end;

end.
