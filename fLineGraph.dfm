object LineGraphChildForm: TLineGraphChildForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Line graph'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object LineGraphChart: TChart
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 634
    Height = 474
    MarginBottom = 5
    MarginLeft = 5
    MarginRight = 5
    MarginTop = 0
    Title.Text.Strings = (
      'TChart')
    Align = alClient
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
end
