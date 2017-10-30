dlibrary ShareSDK;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Service in 'Service.pas';
  //Service
{$R *.res}

var
   webService:ServiceSoap;

//初始化
procedure  initialize;
begin
  if not Assigned(webService) then
  begin
    webService:=GetServiceSoap();
  end;  
end;  
//修改密码
function  changePassWord(const username: WideString; const password: WideString; const newpwd: WideString): Integer; stdcall;
begin
   initialize;
   Result := webService.changePassWord(username,password,newpwd);
end;
//查询余额
function  getBalance(const username: WideString; const password: WideString):Integer;stdcall;
begin
   initialize;
   Result := webService.getBalance(username,password);
end;
//发送短信
function  sendMessage(const username: WideString; const pwd: WideString; const phones: WideString; const contents: WideString; const scode: WideString; const setTime: WideString): Integer; stdcall;
begin
   initialize;
   Result := webService.sendMessage(username,pwd,phones,contents,scode,setTime);
end;

exports
   changePassWord,
   getBalance,
   sendMessage;
begin
end.
