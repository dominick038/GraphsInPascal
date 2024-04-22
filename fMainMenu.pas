unit fMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart;

type
  TDataVisMainMenu = class(TForm)
    MainMenu: TMainMenu;
    LineGraph: TMenuItem;
    BarGraph: TMenuItem;
    PieChart: TMenuItem;
    procedure LineGraphClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BarGraphClick(Sender: TObject);
    procedure PieChartClick(Sender: TObject);
  private
    FCurrentChildForm: TCustomForm;
    procedure LoadChildForm(ChildFormClass: TFormClass);
    procedure SetChildForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataVisMainMenu: TDataVisMainMenu;

implementation

uses
  fLineGraph,
  fBarGraph,
  fPieChart;

{$R *.dfm}

procedure TDataVisMainMenu.BarGraphClick(Sender: TObject);
begin
  LoadChildForm(TBarGraphChildForm);
end;

procedure TDataVisMainMenu.FormCreate(Sender: TObject);
begin
  FCurrentChildForm := TLineGraphChildForm.Create(Self);
  SetChildForm;

  WindowState := TWindowState.wsMaximized;
end;

procedure TDataVisMainMenu.LineGraphClick(Sender: TObject);
begin
  LoadChildForm(TLineGraphChildForm);
end;

procedure TDataVisMainMenu.LoadChildForm(ChildFormClass: TFormClass);
begin
  if FCurrentChildForm.ClassName = ChildFormClass.ClassName then
    Exit
  else
    FCurrentChildForm.Free;

  FCurrentChildForm := ChildFormClass.Create(Self);
  SetChildForm;
end;

procedure TDataVisMainMenu.PieChartClick(Sender: TObject);
begin
  LoadChildForm(TPieChartChildGraph);
end;

procedure TDataVisMainMenu.SetChildForm;
begin
  FCurrentChildForm.Parent := Self;
  FCurrentChildForm.Align := alClient;
  FCurrentChildForm.BorderStyle := bsNone;
  FCurrentChildForm.Visible := True;
end;

end.
