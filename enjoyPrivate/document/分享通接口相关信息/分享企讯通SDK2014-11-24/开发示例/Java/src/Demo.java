public class Demo {
	
    public static void main ( String [] args )   
    {   
    	//��ѯ���
    	//String result =  String.valueOf(ShareSMS.getBalance("user","123"));
    	//���Ͷ���
    	String result =  String.valueOf(ShareSMS.sendMessage("user","123","13541390000","���","",""));
    	//���ؽ��
    	System.out.println(result);   
    }   
}  
