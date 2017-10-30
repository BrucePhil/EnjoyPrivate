public class Demo {
	
    public static void main ( String [] args )   
    {   
    	//查询余额
    	//String result =  String.valueOf(ShareSMS.getBalance("user","123"));
    	//发送短信
    	String result =  String.valueOf(ShareSMS.sendMessage("user","123","13541390000","你好","",""));
    	//返回结果
    	System.out.println(result);   
    }   
}  
