object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Window Title Remover'
  ClientHeight = 315
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    423
    315)
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 19
    Width = 77
    Height = 15
    Caption = 'Windows titles'
  end
  object lblSavefile_: TLabel
    Left = 8
    Top = 292
    Width = 44
    Height = 12
    Anchors = [akLeft, akBottom]
    Caption = 'lblSavefile_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 298
  end
  object Label2: TLabel
    Left = 286
    Top = 208
    Width = 124
    Height = 15
    Alignment = taRightJustify
    Caption = 'Version: 1.0.0 (freeware)'
  end
  object btnRemoveTitleBar: TButton
    Left = 271
    Top = 40
    Width = 139
    Height = 33
    Caption = 'Remove selected'
    TabOrder = 0
    OnClick = btnRemoveTitleBarClick
  end
  object ListBox1: TListBox
    Left = 3
    Top = 40
    Width = 254
    Height = 202
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 25
    Items.Strings = (
      'pilot-1000'
      'center-1000')
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 271
    Top = 137
    Width = 139
    Height = 33
    Caption = 'Remove all'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Button1: TButton
    Left = 3
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Add title'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 165
    Top = 248
    Width = 92
    Height = 25
    Caption = 'Save list to file'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 84
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Delete title'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 271
    Top = 79
    Width = 139
    Height = 34
    Caption = 'Restore selected'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 335
    Top = 248
    Width = 75
    Height = 25
    Caption = 'About'
    TabOrder = 7
    OnClick = Button5Click
  end
end
