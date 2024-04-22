object DataVisMainMenu: TDataVisMainMenu
  Left = 0
  Top = 0
  Caption = 'Data Visualization'
  ClientHeight = 462
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object MainMenu: TMainMenu
    Left = 360
    Top = 256
    object LineGraph: TMenuItem
      Caption = 'Line Graph'
      OnClick = LineGraphClick
    end
    object BarGraph: TMenuItem
      Caption = 'Bar Graph'
      OnClick = BarGraphClick
    end
    object PieChart: TMenuItem
      Caption = 'Pie Chart'
      OnClick = PieChartClick
    end
  end
end
