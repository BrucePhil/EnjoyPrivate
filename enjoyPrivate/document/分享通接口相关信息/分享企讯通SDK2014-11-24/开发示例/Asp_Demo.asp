'--------------------------------------------
'分享科技SDK ASP调用示例，查询余额，发送短信示例
'ver 1.0
'--------------------------------------------
<%
Dim url,SoapRequest,xmlhttp,xmlDOC
'查询账户余额，开发调试时使用
url = "http://www.go028.cn:888/sdk/Service.asmx/getBalance"
SoapRequest="username=test&password=123" '请替换正确的账号密码
'发送短信，正式使用
'url = "http://www.go028.cn:888/sdk/Service.asmx/sendMessage"
'SoapRequest="username=test&pwd=123&phones=13800138000&contents=发送短信测试&scode=&setTime=" '请替换正确的账号密码

Set xmlhttp = server.CreateObject("Msxml2.XMLHTTP")
xmlhttp.Open "POST",url,false
xmlhttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"'注意
xmlhttp.setRequestHeader "Content-Length",LEN(SoapRequest)
xmlhttp.Send(SoapRequest)
'这样就利用XMLHTTP成功发送了与HTTP POST示例所符的POST请求.
'检测一下是否成功：
'如果成功  xmlhttp.Status 会显示 200 ok,不成功会显示 500 内部服务器错误

If xmlhttp.Status = 200 Then '请求成功
	Set xmlDOC = server.CreateObject("MSXML.DOMDocument")
	xmlDOC.load(xmlhttp.responseXML) 
	'得到返回结果，参考SDK开发文档
	Response.Write xmlDOC.text 
	Set xmlDOC = nothing 
Else '请求失败,比如网络异常等情况
	Response.Write xmlhttp.Status&"&nbsp;"
	Response.Write xmlhttp.StatusText
End if
Set xmlhttp = Nothing
%>