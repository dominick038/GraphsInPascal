unit fBarGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VclTee.Series;

type
  TTwoDimensionalArray = TArray<TArray<Integer>>;

  TBarGraphChildForm = class(TForm)
    BarGraphChart: TChart;
    procedure FormCreate(Sender: TObject);
  private
    procedure InitializeBarGraphSettings;
    procedure AddBarToChart(const TwoDimensionalArray: TTwoDimensionalArray; const Caption: string; const BarColor: TColor); overload;
  public
    { Public declarations }
  end;

var
  BarGraphChildForm: TBarGraphChildForm;

const
  MoneySpentOverDaysPersonA: TTwoDimensionalArray = [
    [5, 1300], [10, 1100], [15, 965], [20, 435], [25, 201], [30, 58]
  ];

  MoneySpentOverDaysPersonB: TTwoDimensionalArray = [
    [5, 1800], [10, 1525], [15, 1300], [20, 800], [25, 435], [30, 295]
  ];

  BarWidth = 45; // Example width for bar series

implementation

{$R *.dfm}

procedure TBarGraphChildForm.AddBarToChart(const TwoDimensionalArray: TTwoDimensionalArray; const Caption: string; const BarColor: TColor);
begin
  var BarSeries := TBarSeries.Create(Self);
  BarSeries.BarWidthPercent := BarWidth;
  BarSeries.Color := BarColor;
  BarSeries.Title := Caption;

  for var Axis in TwoDimensionalArray do
  begin
    BarSeries.AddXY(Axis[0], Axis[1]);
  end;

  BarGraphChart.AddSeries(BarSeries);
end;

procedure TBarGraphChildForm.FormCreate(Sender: TObject);
begin
  InitializeBarGraphSettings;

  AddBarToChart(MoneySpentOverDaysPersonB, 'Persoon A', clRed);
  AddBarToChart(MoneySpentOverDaysPersonA, 'Persoon B', clBlue);

  BarGraphChart.Invalidate;
end;

procedure TBarGraphChildForm.InitializeBarGraphSettings;
begin
  BarGraphChart.View3D := False;
  BarGraphChart.Title.Font.Size := 20;
  BarGraphChart.Title.Caption := 'Rekening overzicht over 30 dagen';

  BarGraphChart.LeftAxis.Title.Font.Size := 10;
  BarGraphChart.LeftAxis.Title.Caption := 'Geld ($)';

  BarGraphChart.BottomAxis.Title.Font.Size := 10;
  BarGraphChart.BottomAxis.Title.Caption := 'Dag';
end;

end.

