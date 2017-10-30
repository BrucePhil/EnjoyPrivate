import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;   
import org.apache.commons.httpclient.HttpStatus;   
import org.apache.commons.httpclient.NameValuePair; 
import org.apache.commons.httpclient.params.HttpMethodParams;   


import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;


public class ShareSMS {
	private static String mainHost = "http://www.go028.cn:888/sdk/service.asmx/";
	private static String sendURL = mainHost + "sendMessage";
	private static String balanceURL = mainHost + "getBalance";
	
	/**   
     * ִ��һ��HTTP POST���󣬷���������Ӧ��HTML   
     *   
     * @param url         �����URL��ַ   
     * @param params    ����Ĳ�ѯ����,����Ϊnull   
     * @param charset �ַ���   
     * @return ����������Ӧ��HTML   
     */  
    public static String doPost ( String url, NameValuePair[] params, String charset)   
    {   
          StringBuffer response = new StringBuffer();   
          HttpClient client = new HttpClient();   
          client.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, charset);//ָ�������ַ���ΪGBK��ʽ

          client.getHttpConnectionManager().getParams().setConnectionTimeout(10000);//�������ӳ�ʱʱ��Ϊ10�루���ӳ�ʼ��ʱ�䣩

          PostMethod method = new PostMethod(url);
          if(params!=null)
          {
              method.setRequestBody(params);
          }
          try  
          {   
                client.executeMethod(method);   
                if ( method.getStatusCode() == HttpStatus.SC_OK )   
                {   
                      BufferedReader reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream(), charset));   
                      String line;   
                      while ( ( line = reader.readLine() ) != null )   
                      {   
                                  response.append(line);   
                      }   
                      reader.close();   
                }
          }   
          catch ( IOException e )   
          { 
        	  System.out.println("1");  
          }   
          finally  
          {   
                method.releaseConnection();   
          }   
          return response.toString();   
    }   
    /**
     * ���Ͷ���
		username	�û���
		pwd	����
		phones	�ֻ������ַ��������ð�Ƕ��ŷָ��������ύ����1000����
		contents	�������ݣ��ֻ���70�֣�С��ͨ��54�֣�����ϵͳ�Զ����
		scode	�ط��ţ����ط����봫�ݿ�ֵ��
		setTime	����ʱ��(��ʽΪ��yyyy-mm-dd HH:mm)����ʱ�����봫��ֵ
     */
	public static int sendMessage(String username, String pwd, String phones, String contents, String scode,String setTime)
	{
   	 	NameValuePair par1 = new NameValuePair("username",username);    
   	 	NameValuePair par2 = new NameValuePair("pwd",pwd);
   	    NameValuePair par3 = new NameValuePair("phones",phones);
	   	NameValuePair par4 = new NameValuePair("contents",contents);
	   	NameValuePair par5 = new NameValuePair("scode",scode);
	   	NameValuePair par6 = new NameValuePair("setTime",setTime);
   	 	NameValuePair[] pa = new NameValuePair[]{par1,par2,par3,par4,par5,par6} ;
        String result = doPost(sendURL,pa, "utf-8");   
 
	   	if(result!="")
	   	{
	   		 Document doc = null;
		try {
				 doc = DocumentHelper.parseText(result);
				 Element rootElt = doc.getRootElement(); 
		   		 return Integer.parseInt(rootElt.getText());
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   	}
	   	return -1;
	}
    /**
     * ��ѯ���
     * @access public
     * @static
     * @param username   �����˺�
     * @param password   ��������
     */
	public static int getBalance(String username,String password) 
	{
	 	NameValuePair par1 = new NameValuePair("username",username);    
   	 	NameValuePair par2 = new NameValuePair("password",password);
   	 	NameValuePair[] pa = new NameValuePair[]{par1,par2} ;

        String result = doPost(balanceURL,pa, "utf-8");   
	   	if(result!="")
	   	{
	   		 Document doc = null;
		try {
				 doc = DocumentHelper.parseText(result);
				 Element rootElt = doc.getRootElement(); 
		   		 return Integer.parseInt(rootElt.getText());
			} catch (DocumentException e) {
				e.printStackTrace();
			}
	   	}
	   	return -1;
	}
}
