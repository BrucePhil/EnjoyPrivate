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
     * 执行一个HTTP POST请求，返回请求响应的HTML   
     *   
     * @param url         请求的URL地址   
     * @param params    请求的查询参数,可以为null   
     * @param charset 字符集   
     * @return 返回请求响应的HTML   
     */  
    public static String doPost ( String url, NameValuePair[] params, String charset)   
    {   
          StringBuffer response = new StringBuffer();   
          HttpClient client = new HttpClient();   
          client.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, charset);//指定传送字符集为GBK格式

          client.getHttpConnectionManager().getParams().setConnectionTimeout(10000);//设置连接超时时间为10秒（连接初始化时间）

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
     * 发送短信
		username	用户名
		pwd	密码
		phones	手机号码字符串，请用半角逗号分隔（单次提交上限1000个）
		contents	短信内容，手机限70字，小灵通限54字，超长系统自动拆分
		scode	特服号（无特服号请传递空值）
		setTime	发送时间(格式为：yyyy-mm-dd HH:mm)，即时发送请传空值
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
     * 查询余额
     * @access public
     * @static
     * @param username   您的账号
     * @param password   您的密码
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
