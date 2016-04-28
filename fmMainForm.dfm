object mainform: Tmainform
  Left = 369
  Top = 124
  Width = 303
  Height = 119
  Caption = #1055#1077#1095#1072#1090#1100' '#1089#1077#1088#1074#1080#1089#1085#1099#1093' '#1082#1072#1088#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pbProcess: TProgressBar
    Left = 0
    Top = 0
    Width = 287
    Height = 25
    Align = alTop
    TabOrder = 0
  end
  object rp: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38735.558183946800000000
    ReportOptions.LastChange = 42480.435207280090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var Stream: Char;  '
      'procedure PDF4171OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '       s:String;'
      '       numPolis:String;'
      '       i :Integer;'
      '       sTmp: String;'
      '       FIO: String;'
      '       FIObin: String;'
      '       Index: Integer;                                        '
      '       IndexD: Integer;            '
      '       sDays: string;'
      
        '       myDate : TDateTime;                                      ' +
        '        '
      'begin'
      '       myDate := EncodeDate(1900, 01, 01);    '
      
        '       IndexD:=0;                                               ' +
        '                 '
      
        '       numpolis:= Format('#39'%x'#39', [<numpolis>]);                   ' +
        '                       '
      '       s:= chr(2)+chr(0);'
      '       IndexD:=2;                             '
      '       for i:=0 to (Length(numPolis) div 2)-1 do'
      '       begin'
      '         sTmp:= '#39'$'#39'+Copy(numPolis, i*2+1, 2);'
      '         s:=s+chr(StrToInt(sTmp));'
      '         Inc(IndexD);                       '
      '       end;'
      '       FIO:= '#39#39';                         '
      '       FIO:= VarToStr(<fio>);'
      ''
      '       fioBin:='#39#39';                                '
      '       sTmp:='#39#39';'
      '       for i:=1 to Length(FIO) do'
      '       begin'
      '          fioBin:= fioBin+getByteBySymbol(fio[i]);'
      '          sTmp:=sTmp+FIO[i];'
      '       end;'
      '                                                       '
      '       Index:= Length(fioBin) div 4;'
      '       sTmp:= '#39#39';                              '
      '       for i:=0 to 300 do'
      '       begin'
      '         if (i<Index+1) then'
      '         begin'
      '          if ((i mod 2)=0) and (sTmp<>'#39#39')  then'
      '          begin'
      '            s:=s+chr(StrToInt('#39'$'#39'+sTmp));'
      '            Inc(IndexD);'
      '            stmp:= '#39#39';'
      '          end;'
      '          sTmp:= sTmp+BinToHexM(Copy(FIObin, i*4+1, 4));'
      '         end'
      '         else'
      '         begin'
      '          s:=s+chr(0);'
      '          Inc(IndexD);'
      '          if (IndexD=60) then break;'
      '         end;'
      '       end;                            '
      '       s:=s+chr(<pol>);'
      '       sDays:= Format('#39'%x'#39', [<koldays>]);'
      
        '                                                                ' +
        '     '
      '       for i:=0 to (Length(sDays) div 2)-1 do'
      '       begin'
      '         sTmp:= '#39'$'#39'+Copy(sDays, i*2+1, 2);'
      '         s:=s+chr(StrToInt(sTmp));'
      '         Inc(IndexD);                       '
      '       end;'
      '       Inc(IndexD);'
      
        '       s:= s + '#39'00SERVICECARD'#39'; // 00 - '#1090#1091#1090' '#1087#1086#1080#1076#1077#1077' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1089 +
        #1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1086#1083#1080#1089#1072', '#1085#1086' '#1087#1086#1095#1077#1084#1091'-'#1090#1086' '#1086#1085' '#1090#1091#1090' '#1074' '#1082#1086#1076#1077' '#1085#1077' '#1091#1087#1086#1084#1080#1085#1072#1077#1090#1089#1103'. ' +
        #1054#1089#1090#1072#1074#1083#1103#1077#1084' '#1077#1075#1086' '#1087#1091#1089#1090#1099#1084'                                            ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                  '
      
        '       IndexD:=IndexD + 13;                                     ' +
        '                                           '
      '       for i:=0 to 200 do'
      '       begin'
      '         if (IndexD<130) then'
      '         begin'
      '           s:=s+chr(0);'
      '           Inc(IndexD);                         '
      
        '         end else Break;                                        ' +
        '     '
      '       end; '
      '       pdfCode.Text:= s;'
      ''
      '      memoDb.text:= DateToStr(myDate+<koldays>);          '
      '      FIO:= VarToStr(<fio>);'
      '      memoFam.text:= Copy(FIO,1,pos('#39'|'#39',FIO)-1);'
      '      FIO:= Copy(FIO,pos('#39'|'#39',FIO)+1,500);'
      '      memoName.text:=Copy(FIO, 1, pos('#39'|'#39',FIO)-1);'
      '      FIO:= Copy(FIO,pos('#39'|'#39',FIO)+1,500);'
      '      memoOtch.text:= FIO;'
      ''
      '      sTmp:= VarToStr(<numpolis>);'
      '      s:='#39#39';                                             '
      '      for i:=1 to Length(sTmp) do'
      '      begin'
      '         s:= s+sTmp[i];'
      
        '         if (i mod 4)=0 then s:=s+'#39' '#39';                          ' +
        '                                    '
      '      end;'
      '      memoenp.text:= s;'
      
        '      if <pol>=1 then memoPol.text:= '#39#1052#39' else memoPol.text:= '#39#1046#39 +
        ';'
      '      eanbc.text:= <eancode>;'
      '      sTmp:= <eancode>;'
      ''
      '      memoPolBegin.Text:= <polbegin>;'
      '      memoPolEnd.Text := <polend>;'
      
        '      memoCardNum.Text := <cardnum>;                            ' +
        '    '
      'end;'
      '    '
      'function BinToHexM(str: String): string;'
      'var'
      '  Bin: array [0..15] Of String;'
      '  Hex: array [0..15] Of Char;'
      '  i: integer;                                   '
      'begin'
      '   bin[0]:='#39'0000'#39';  hex[0]:='#39'0'#39';                    '
      '   bin[1]:='#39'0001'#39';  hex[1]:='#39'1'#39';  '
      '   bin[2]:='#39'0010'#39';  hex[2]:='#39'2'#39';  '
      '   bin[3]:='#39'0011'#39';  hex[3]:='#39'3'#39';  '
      '   bin[4]:='#39'0100'#39';  hex[4]:='#39'4'#39';  '
      '   bin[5]:='#39'0101'#39';  hex[5]:='#39'5'#39';  '
      '   bin[6]:='#39'0110'#39';  hex[6]:='#39'6'#39';  '
      '   bin[7]:='#39'0111'#39';  hex[7]:='#39'7'#39';  '
      '   bin[8]:='#39'1000'#39';  hex[8]:='#39'8'#39';  '
      '   bin[9]:='#39'1001'#39';  hex[9]:='#39'9'#39';  '
      '   bin[10]:='#39'1010'#39';  hex[10]:='#39'A'#39';  '
      '   bin[11]:='#39'1011'#39';  hex[11]:='#39'B'#39';  '
      '   bin[12]:='#39'1100'#39';  hex[12]:='#39'C'#39';  '
      '   bin[13]:='#39'1101'#39';  hex[13]:='#39'D'#39';  '
      '   bin[14]:='#39'1110'#39';  hex[14]:='#39'E'#39';  '
      '   bin[15]:='#39'1111'#39';  hex[15]:='#39'F'#39';'
      '   for i:=0 to Length(Bin)-1 do'
      '   begin'
      '     if (str=bin[i]) then'
      '     begin'
      '       result:= hex[i];'
      '       break;                     '
      '     end;                            '
      '   end;             '
      'end;          '
      '  '
      'function getByteBySymbol(ch: string):string;'
      'var'
      '  code: array[1..49,1..49] of string;'
      '  i: Integer;'
      'begin'
      '  code[1,1]:='#39' '#39'; code[1,2]:='#39'000000'#39';'
      '  code[2,1]:='#39'.'#39'; code[2,2]:='#39'000001'#39';'
      '  code[3,1]:='#39'-'#39'; code[3,2]:='#39'000010'#39';'
      '  code[4,1]:='#39#39#39#39'; code[4,2]:='#39'000011'#39';'
      '  code[5,1]:='#39'0'#39'; code[5,2]:='#39'000100'#39';'
      '  code[6,1]:='#39'1'#39'; code[6,2]:='#39'000101'#39';'
      '  code[7,1]:='#39'2'#39'; code[7,2]:='#39'000110'#39';'
      '  code[8,1]:='#39'3'#39'; code[8,2]:='#39'000111'#39';'
      '  code[9,1]:='#39'4'#39'; code[9,2]:='#39'001000'#39';'
      '  code[10,1]:='#39'5'#39'; code[10,2]:='#39'001001'#39';'
      '  code[11,1]:='#39'6'#39'; code[11,2]:='#39'001010'#39';'
      '  code[12,1]:='#39'7'#39'; code[12,2]:='#39'001011'#39';'
      '  code[13,1]:='#39'8'#39'; code[13,2]:='#39'001100'#39';'
      '  code[14,1]:='#39'9'#39'; code[14,2]:='#39'001101'#39';'
      '  code[15,1]:='#39#1040#39'; code[15,2]:='#39'001110'#39';'
      '  code[16,1]:='#39#1041#39'; code[16,2]:='#39'001111'#39';'
      '  code[17,1]:='#39#1042#39'; code[17,2]:='#39'010000'#39';'
      '  code[18,1]:='#39#1043#39'; code[18,2]:='#39'010001'#39';'
      '  code[19,1]:='#39#1044#39'; code[19,2]:='#39'010010'#39';'
      ''
      '  code[20,1]:='#39#1045#39'; code[20,2]:='#39'010011'#39';'
      '  code[21,1]:='#39#1025#39'; code[21,2]:='#39'010100'#39';'
      '  code[22,1]:='#39#1046#39'; code[22,2]:='#39'010101'#39';'
      '  code[23,1]:='#39#1047#39'; code[23,2]:='#39'010110'#39';'
      '  code[24,1]:='#39#1048#39'; code[24,2]:='#39'010111'#39';'
      '  code[25,1]:='#39#1049#39'; code[25,2]:='#39'011000'#39';'
      '  code[26,1]:='#39#1050#39'; code[26,2]:='#39'011001'#39';'
      '  code[27,1]:='#39#1051#39'; code[27,2]:='#39'011010'#39';'
      '  code[28,1]:='#39#1052#39'; code[28,2]:='#39'011011'#39';'
      '  code[29,1]:='#39#1053#39'; code[29,2]:='#39'011100'#39';'
      '  code[30,1]:='#39#1054#39'; code[30,2]:='#39'011101'#39';'
      '  code[31,1]:='#39#1055#39'; code[31,2]:='#39'011110'#39';'
      '  code[32,1]:='#39#1056#39'; code[32,2]:='#39'011111'#39';'
      '  code[33,1]:='#39#1057#39'; code[33,2]:='#39'100000'#39';'
      '  code[34,1]:='#39#1058#39'; code[34,2]:='#39'100001'#39';'
      '  code[35,1]:='#39#1059#39'; code[35,2]:='#39'100010'#39';'
      '  code[36,1]:='#39#1060#39'; code[36,2]:='#39'100011'#39';'
      '  code[37,1]:='#39#1061#39'; code[37,2]:='#39'100100'#39';'
      '  code[38,1]:='#39#1062#39'; code[38,2]:='#39'100101'#39';'
      ''
      '  code[39,1]:='#39#1063#39'; code[39,2]:='#39'100110'#39';'
      '  code[40,1]:='#39#1064#39'; code[40,2]:='#39'100111'#39';'
      '  code[41,1]:='#39#1065#39'; code[41,2]:='#39'101000'#39';'
      '  code[42,1]:='#39#1068#39'; code[42,2]:='#39'101001'#39';'
      '  code[43,1]:='#39#1066#39'; code[43,2]:='#39'101010'#39';'
      '  code[44,1]:='#39#1067#39'; code[44,2]:='#39'101011'#39';'
      '  code[45,1]:='#39#1069#39'; code[45,2]:='#39'101100'#39';'
      '  code[46,1]:='#39#1070#39'; code[46,2]:='#39'101101'#39';'
      '  code[47,1]:='#39#1071#39'; code[47,2]:='#39'101110'#39';'
      '  code[48,1]:='#39'?'#39'; code[48,2]:='#39'101111'#39';'
      '  code[49,1]:='#39'|'#39'; code[49,2]:='#39'111111'#39';'
      ''
      '  result:= '#39'000000'#39';'
      '  for i:=1 to 50 do'
      '  begin'
      '    if (i=50) then Break;'
      '    if (code[i,1]=ch) then'
      '    begin'
      '      result:= code[i,2];'
      '      Break;'
      '    end;'
      '  end;'
      'end;            '
      ''
      ''
      'begin'
      '// Picture1.Picture.LoadFromFile('#39'C:\Photo.jpg'#39');  '
      'end.')
    OnStartReport = 'frxReport_OnBeforePrint'
    Left = 128
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object pgReport: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 86.000000000000000000
      PaperHeight = 54.000000000000000000
      PaperSize = 256
      object memoFam: TfrxMemoView
        Left = 18.897637800000000000
        Top = 147.448818900000000000
        Width = 147.401430790000000000
        Height = 15.118120000000000000
        ShowHint = False
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1056#152#1056#1030#1056#176#1056#1029#1056#1109#1056#1030)
        ParentFont = False
      end
      object memoName: TfrxMemoView
        Left = 18.897637800000000000
        Top = 161.299212600000000000
        Width = 147.401430790000000000
        Height = 15.118120000000000000
        ShowHint = False
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1056#152#1056#1030#1056#176#1056#1029)
        ParentFont = False
      end
      object memoOtch: TfrxMemoView
        Left = 18.897637800000000000
        Top = 175.346456692913400000
        Width = 128.503780790000000000
        Height = 15.118120000000000000
        ShowHint = False
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1056#152#1056#1030#1056#176#1056#1029#1056#1109#1056#1030#1056#1105#1057#8225)
        ParentFont = False
      end
      object memoDb: TfrxMemoView
        Left = 18.897637800000000000
        Top = 189.330708660000000000
        Width = 60.472240790000000000
        Height = 15.118120000000000000
        ShowHint = False
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          '01.01.1980')
        ParentFont = False
      end
      object eanbc: TfrxBarCodeView
        Left = 72.944881890000000000
        Width = 175.100000000000000000
        Height = 68.031498500000000000
        ShowHint = False
        BarType = bcCodeEAN13
        Rotation = 0
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.700000000000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
      end
      object pdfCode: TfrxPDF417
        Left = 22.677165350000000000
        Top = 96.267709210000000000
        Width = 279.685036930000000000
        Height = 52.913395590000000000
        OnBeforePrint = 'PDF4171OnBeforePrint'
        ShowHint = True
        AlignH = ahCenter
        AlignV = avCenter
        Color = clWhite
        CompactionMode = cmAuto
        CompactPDF = True
        DataColumns = 10
        DataRows = 15
        DrawMethod = dmRastr
        ErrorCorrectionLevel = ecl4
        ForeColor = clBlack
        FreezeEncode = False
        ModuleSize = 1.000000000000000000
        YXRatio = 3
      end
      object memoPol: TfrxMemoView
        Left = 82.590551180000000000
        Top = 189.330708660000000000
        Width = 26.456470790000000000
        Height = 15.118120000000000000
        ShowHint = False
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1056#8211)
        ParentFont = False
      end
      object memoenp: TfrxMemoView
        Left = 86.929124090000000000
        Top = 70.590543860000000000
        Width = 215.432970790000000000
        Height = 22.677180000000000000
        ShowHint = False
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'KievitCyr-RegularSC'
        Font.Style = []
        Memo.UTF8 = (
          '0000 0000 0000 0000')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 15.118120000000000000
        Top = 70.590546300000000000
        Width = 70.551226670000000000
        Height = 23.937023330000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1056#8226#1056#1169#1056#1105#1056#1029#1057#8249#1056#8470
          #1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109#1056#187#1056#1105#1057#1027#1056#176':')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 169.858262830000000000
        Top = 147.377952760000000000
        Width = 138.582766670000000000
        Height = 15.118110240000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        HAlign = haRight
        Memo.UTF8 = (
          #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#181#1056#1110#1056#1105#1057#1027#1057#8218#1057#1026#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1030' '#1056#1038#1056#1114#1056#1115':')
        ParentFont = False
      end
      object memoPolBegin: TfrxMemoView
        Left = 178.417274020000000000
        Top = 161.362204720000000000
        Width = 129.763863330000000000
        Height = 15.118110240000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        HAlign = haRight
        Memo.UTF8 = (
          '01.01.2016')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 155.519685040000000000
        Top = 175.346456692913400000
        Width = 79.370130000000000000
        Height = 15.118120000000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1056#1038#1057#1026#1056#1109#1056#1108' '#1056#1169#1056#181#1056#8470#1057#1027#1057#8218#1056#1030#1056#1105#1057#1039':')
        ParentFont = False
      end
      object memoPolEnd: TfrxMemoView
        Left = 235.110390000000000000
        Top = 175.346456690000000000
        Width = 73.070913330000000000
        Height = 15.118110240000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        HAlign = haRight
        Memo.UTF8 = (
          #1056#1029#1056#181' '#1056#1109#1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029)
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Left = 142.385826770000000000
        Top = 189.330708660000000000
        Width = 50.393733330000000000
        Height = 15.118110240000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        Memo.UTF8 = (
          #1074#8222#8211' '#1056#1108#1056#176#1057#1026#1057#8218#1057#8249':')
        ParentFont = False
      end
      object memoCardNum: TfrxMemoView
        Left = 193.055246670000000000
        Top = 189.330708660000000000
        Width = 115.905586670000000000
        Height = 15.118110240000000000
        ShowHint = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'KievitCyr-MediumSC'
        Font.Style = []
        HAlign = haRight
        Memo.UTF8 = (
          '86 003 303 0000000')
        ParentFont = False
      end
    end
  end
end
