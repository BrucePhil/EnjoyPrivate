unit Unit1;

interface

uses
  Windows, Messages, SysUtils,Service, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    btn2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   webService:ServiceSoap;
implementation

{$R *.dfm}

//≥ı ºªØ
procedure  initialize;
begin
  if not Assigned(webService) then
  begin
    webService:=GetServiceSoap();
  end;  
end;

procedure TForm1.btn1Click(Sender: TObject);
var str:string;
begin
   initialize;
   str := IntToStr(webService.getBalance(edt1.Text,edt2.Text));
   ShowMessage(str);
end;

procedure TForm1.btn2Click(Sender: TObject);
var str:integer;
begin                   
   initialize;
  str:=webService.sendMessage(edt1.Text,edt2.Text, Edit2.Text, Edit1.Text,'','');
             
   ShowMessage(IntToStr(str));
end;

end.
