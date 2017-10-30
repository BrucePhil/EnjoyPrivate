// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:6555/WebService/Service.asmx?WSDL
// Encoding : utf-8
// Version  : 1.0
// (2010/7/14 14:55:21 - 1.33.2.5)
// ************************************************************************ //

unit Service;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns,OPConvert;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : http://www.82009668.com/
  // soapAction: http://www.82009668.com/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ServiceSoap
  // service   : Service
  // port      : ServiceSoap
  // URL       : http://localhost:6555/WebService/Service.asmx
  // ************************************************************************ //
  ServiceSoap = interface(IInvokable)
  ['{242261B4-3611-39F1-FA27-62079B7397C5}']
    function  changePassWord(const username: WideString; const password: WideString; const newpwd: WideString): Integer; stdcall;
    function  getBalance(const username: string; const password: string): Integer; stdcall;
    function  sendMessage(const username: WideString; const pwd: WideString; const phones: WideString; const contents: WideString; const scode: WideString; const setTime: WideString): Integer; stdcall;
    function  sendMMS(const username: WideString; const pwd: WideString; const phones: WideString; const mmsBytes: TByteDynArray; const scode: WideString; const setTime: WideString): Integer; stdcall;
  end;

function GetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceSoap;


implementation

function GetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceSoap;
const
  defWSDL = 'http://www.go028.cn:888/sdk/Service.asmx?WSDL';
  defURL  = 'http://www.go028.cn:888/sdk/Service.asmx?WSDL';
  defSvc  = 'Service';
  defPrt  = 'ServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
   //add-------to support UTF-8
    RIO.HTTPWebNode.UseUTF8InHeader := true;  //添加该行，指定采用UTF-8代码传输
    RIO.Converter.Encoding:='UTF-8';
    RIO.Converter.Options:=RIO.Converter.Options + [soUTF8InHeader,soUTF8EncodeXML];
    //add-------END
    Result := (RIO as ServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ServiceSoap), 'http://www.go028.cn', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceSoap), 'http://www.go028.cn/%operationName%');
  //手动添加这一行
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceSoap), ioDocument);
end. 