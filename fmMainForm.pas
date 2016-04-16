unit fmMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxPDF417, frxPDF417RTTI,frxBarcode, frxBarcodeRTTI,
  DateUtils, ComCtrls;

type
  Tmainform = class(TForm)
    rp: TfrxReport;
    pbProcess: TProgressBar;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function RemoveFiles(sDir, Mask : String) : Boolean;
var
  mainform: Tmainform;

implementation

{$R *.dfm}


procedure Tmainform.FormShow(Sender: TObject);
var
  f,logFile:TStringList;
  i,a:Integer;
begin
  if not FileExists('.\scard.txt') then
  begin
    ShowMessage('Файл scard.txt не найден');
  end
  else
  begin
    f:=TStringList.Create;
    try
      f:=TStringList.Create;
      f.LoadFromFile('.\scard.txt');
      a:=1;
      pbProcess.Max:= f.Count;
      rp.LoadFromFile('.\template.fr3');
      logFile:= TStringList.Create;
      logFile.SaveToFile('.\scard.log');
      logFile.Add(DateTimeToStr(Now())+' Начало обработки файла');
      Application.ProcessMessages;
      for i:=0 to f.Count-1 do
      begin
        if (a=1) then
        begin
          rp.Variables['numpolis']:= f.Strings[i];
          logFile.Add(DateTimeToStr(Now())+' Полис №: '+f.Strings[i]+' Начало обработки');
          Inc(a);
        end
        else if (a=2) then
        begin
          rp.Variables['fio']:= ''''+f.Strings[i]+'''';
          Inc(a);
        end
        else if (a=3) then
        begin
          rp.Variables['pol']:= StrToInt(f.Strings[i]);
          Inc(a);
        end
        else if (a=4) then
        begin
          rp.Variables['koldays']:= StrToInt(f.Strings[i]);
          Inc(a);
        end
        else if (a=5) then
        begin
          rp.Variables['eancode']:= f.Strings[i];
          Inc(a);
        end
        else if (a=6) then
        begin
          rp.Variables['polbegin']:= ''''+f.Strings[i]+'''';
          Inc(a);
        end
        else if (a=7) then
        begin
          rp.Variables['polend']:= ''''+f.Strings[i]+'''';
          Inc(a);
        end
        else if (a=8) then
        begin
          rp.Variables['cardnum']:= ''''+f.Strings[i]+'''';
          logFile.Add(DateTimeToStr(Now())+' Полис №: '+f.Strings[i-5]+' Окончание обработки');
          logFile.SaveToFile('.\scard.log');
          pbProcess.Position:= i;
          Application.ProcessMessages;
          rp.PrepareReport(false);
          a:=1;
        end;
      end;
    finally
      f.Free;
    end;
    logFile.Add(DateTimeToStr(Now())+' Печатные формы сформированы');
    logFile.SaveToFile('.\scard.log');
    rp.ShowPreparedReport;
    logFile.Free;
    RemoveFiles('.\', '*.txt');
    //RemoveFiles('.\', '*.jpg');
  end;
  Close;
end;


function RemoveFiles(sDir, Mask : String) : Boolean;
var
  iIndex : Integer;
  SearchRec : TSearchRec;
  sFileName : String;
begin
 Result := False;
 sDir := sDir + '\'+Mask;
 iIndex := FindFirst(sDir, faAnyFile, SearchRec);
 while iIndex = 0 do begin
  sFileName := ExtractFileDir(sDir)+'\'+SearchRec.Name;
  if SearchRec.Attr <> faArchive then
    FileSetAttr(sFileName, faArchive);
  if NOT DeleteFile(sFileName) then
    ShowMessage('Файл занят и не может быть удален ' + sFileName);
  iIndex := FindNext(SearchRec);
 end;
 FindClose(SearchRec);
 Result := True;
end;

    end.
