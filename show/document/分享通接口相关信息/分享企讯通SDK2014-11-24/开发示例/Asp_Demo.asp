'--------------------------------------------
'����Ƽ�SDK ASP����ʾ������ѯ�����Ͷ���ʾ��
'ver 1.0
'--------------------------------------------
<%
Dim url,SoapRequest,xmlhttp,xmlDOC
'��ѯ�˻�����������ʱʹ��
url = "http://www.go028.cn:888/sdk/Service.asmx/getBalance"
SoapRequest="username=test&password=123" '���滻��ȷ���˺�����
'���Ͷ��ţ���ʽʹ��
'url = "http://www.go028.cn:888/sdk/Service.asmx/sendMessage"
'SoapRequest="username=test&pwd=123&phones=13800138000&contents=���Ͷ��Ų���&scode=&setTime=" '���滻��ȷ���˺�����

Set xmlhttp = server.CreateObject("Msxml2.XMLHTTP")
xmlhttp.Open "POST",url,false
xmlhttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"'ע��
xmlhttp.setRequestHeader "Content-Length",LEN(SoapRequest)
xmlhttp.Send(SoapRequest)
'����������XMLHTTP�ɹ���������HTTP POSTʾ��������POST����.
'���һ���Ƿ�ɹ���
'����ɹ�  xmlhttp.Status ����ʾ 200 ok,���ɹ�����ʾ 500 �ڲ�����������

If xmlhttp.Status = 200 Then '����ɹ�
	Set xmlDOC = server.CreateObject("MSXML.DOMDocument")
	xmlDOC.load(xmlhttp.responseXML) 
	'�õ����ؽ�����ο�SDK�����ĵ�
	Response.Write xmlDOC.text 
	Set xmlDOC = nothing 
Else '����ʧ��,���������쳣�����
	Response.Write xmlhttp.Status&"&nbsp;"
	Response.Write xmlhttp.StatusText
End if
Set xmlhttp = Nothing
%>