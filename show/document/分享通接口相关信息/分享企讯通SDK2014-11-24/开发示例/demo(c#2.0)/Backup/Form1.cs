using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace demo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        /// <summary>
        /// WebService���ýӿ���
        /// </summary>
        private demo.ShareTech.Service webService = null;
        /// <summary>
        /// �ӿڷ���ֵ
        /// </summary>
        private int iResult = 0;

        private void Form1_Load(object sender, EventArgs e)
        {
            //ʵ�����ಢ�ı�ӿڵ�ַ
            webService = new demo.ShareTech.Service();
            webService.Url = lblURL.Text;
        }
        //�޸�����
        private void btnChangePWD_Click(object sender, EventArgs e)
        {
            iResult = webService.changePassWord(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtNewPWD.Text.Trim());
            if (iResult == 1)
            {
                MessageBox.Show("�����޸ĳɹ���");
            }
            else
            {
                MessageBox.Show("�����޸�ʧ�ܣ�" + iResult); //����ʧ��ԭ������տ����ĵ�
            }
        }
        //��ѯ���
        private void btnGetBalance_Click(object sender, EventArgs e)
        {
            iResult = webService.getBalance(txtUserName.Text.Trim(), txtPassWord.Text.Trim());
            if (iResult >= 0)
            {
                MessageBox.Show("��ǰ���Ϊ��" + iResult);
            }
            else
            {
                MessageBox.Show("��ѯ���ʧ�ܣ�" + iResult); //����ʧ��ԭ������տ����ĵ�
            }
        }
        //���Ͷ���
        private void btnSendMsg_Click(object sender, EventArgs e)
        {
            string scode="";   //�ط�����(�����ֶλ�δ���ã��봫��ֵ)
            string setTime = ""; //��ʱʱ��(��ʽ yyyy-dd-MM HH:mm) �������ֵ���߹��ڵ�ʱ�������������

            iResult = webService.sendMessage(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtPhones.Text.Trim(),txtContents.Text.Trim(),scode,setTime);
            if (iResult == 1)
            {
                MessageBox.Show("���ŷ��ͳɹ���");
            }
            else
            {
                MessageBox.Show("����ʧ�ܣ�" + iResult); //����ʧ��ԭ������տ����ĵ�
            }
        }
        //���Ͳ���
        private void btnSendMMS_Click(object sender, EventArgs e)
        {
            string scode = "";   //�ط�����(�����ֶλ�δ���ã��봫��ֵ)
            string setTime = ""; //��ʱʱ��(��ʽ yyyy-dd-MM HH:mm) �������ֵ���߹��ڵ�ʱ�������������
            byte[] mmsBytes = MakeMMS();//���ɲ���������

            if (mmsBytes == null || mmsBytes.Length == 0)
            {
                //MessageBox.Show("�����ļ�����ʧ�ܣ�");
                return;
            }
            iResult = webService.sendMMS(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtPhones.Text.Trim(), mmsBytes, scode, setTime);
            if (iResult == 1)
            {
                MessageBox.Show("���ŷ��ͳɹ���");
            }
            else
            {
                MessageBox.Show("���ŷ���ʧ�ܣ�" + iResult); //����ʧ��ԭ������տ����ĵ�
            }
        }
        /// <summary>
        /// ���ļ�ת��Ϊ������
        /// </summary>
        /// <returns></returns>
        private byte[] MakeMMS()
        {
            byte[] rbytes = null;
            System.IO.FileStream midStrm = null;
            System.IO.FileStream imgStrm = null;
            try
            {
                #region ׼���������ݲ��жϴ�С
                string title = "���Բ��ű���";
                //��һ֡ͼƬ
                string path = System.AppDomain.CurrentDomain.BaseDirectory + "1.jpg";
                imgStrm = new System.IO.FileStream(path, System.IO.FileMode.Open);
                //��һ֡����
                string strContents = "���ŵ�һ֡����";
                //��һ֡����
                path = System.AppDomain.CurrentDomain.BaseDirectory + "1.mid";
                midStrm = new System.IO.FileStream(path, System.IO.FileMode.Open);
                if ((title.Length + imgStrm.Length + midStrm.Length) > 50 * 1024)
                {
                    MessageBox.Show("�����ļ�����50K�����ܷ��ͣ�");
                    return null;
                }
                #endregion

                #region ��������ת��ΪEMS��ʽ�ļ�

                //EMS �ļ���ʽʾ��

                //<package64>
                //<subject>���ű���Base64����</subject>
                //<body>
                //<par dur="10000ms">
                //<img src="1.jpg">ͼƬBase64����</img>
                //<audio src="1.mid">����Base64����</audio>
                //<text src="1.txt">����Base64����</text>
                //</par>
                //<par dur="10000ms">
                //<img src="2.jpg">ͼƬBase64����</img>
                //<audio src="2.mid">����Base64����</audio>
                //<text src="2.txt">����Base64����</text>
                //</par>
                //</body>
                //</package64>

                System.Text.StringBuilder sbMMS = new StringBuilder();
                sbMMS.Append("<package64><subject>");

                string base64Str = Convert.ToBase64String(System.Text.Encoding.GetEncoding("gb2312").GetBytes(title)); //���ű���Base64����
                sbMMS.Append(base64Str + "</subject><body>");

                //��ӵ�һ֡������Ӷ�֡��������ܳ���15֡ ��ÿ֡�����һ��ͼƬ��һ�����֣�һ������������Ҫ����ӣ�

                sbMMS.Append("<par dur=\"10000ms\">"); //dur="10000ms" ��ʾ��һ֡����ʱ��Ϊ10��
                //��ӵ�һ֡ͼƬ(����Ҫ�����)
                sbMMS.Append("<img src=\"1.jpg\">"); //src="1.jpg" ��ʾͼƬ������Ϊ 1.jpg ������Ŀǰֻ֧�� GIF,JPG ���ָ�ʽ��ͼƬ
                rbytes=new byte[imgStrm.Length];
                imgStrm.Read(rbytes, 0, rbytes.Length);
                base64Str = Convert.ToBase64String(rbytes); //ͼƬת��ΪBase64����
                sbMMS.Append(base64Str+"</img>");

                //��ӵ�һ֡����(����Ҫ�����)
                sbMMS.Append("<audio src=\"1.mid\">"); //src="1.mid" ��ʾ����������Ϊ 1.mid ������Ŀǰֻ֧�� MID ��ʽ������
                rbytes = new byte[midStrm.Length];
                midStrm.Read(rbytes, 0, rbytes.Length);
                base64Str = Convert.ToBase64String(rbytes); //����ת��ΪBase64����
                sbMMS.Append(base64Str + "</audio>");

                //��ӵ�һ֡����(����Ҫ�����)
                sbMMS.Append("<text src=\"1.txt\">");
                rbytes = System.Text.Encoding.GetEncoding("gb2312").GetBytes(strContents);
                base64Str = Convert.ToBase64String(rbytes); //����ת��ΪBase64����
                sbMMS.Append(base64Str + "</text>");

                sbMMS.Append("</par>"); //��һ֡����
                sbMMS.Append("</body></package64>"); //�����ļ��������

                #endregion

                //EMS�ַ���ת��Ϊ������
                rbytes = System.Text.Encoding.ASCII.GetBytes(sbMMS.ToString()); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                //�ر��ļ���
                if (imgStrm != null)
                    imgStrm.Close();
                if (midStrm != null)
                    midStrm.Close();
            }
            return rbytes;
        }
        //��������
        private void btnChat_Click(object sender, EventArgs e)
        {
            string scode = "";   //�ط�����(�����ֶλ�δ���ã��봫��ֵ)
            string setTime = ""; //��ʱʱ��(��ʽ yyyy-dd-MM HH:mm) �������ֵ���߹��ڵ�ʱ�������������

            iResult = webService.sendChat(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtPhones.Text.Trim(), txtContents.Text.Trim(), scode, setTime);
            if (iResult == 1)
            {
                MessageBox.Show("���ŷ��ͳɹ���");
            }
            else
            {
                MessageBox.Show("����ʧ�ܣ�" + iResult); //����ʧ��ԭ������տ����ĵ�
            }
        }
        //���ն���
        private void btnGetChat_Click(object sender, EventArgs e)
        {
            string scode = "";   //�ط�����(�����ֶλ�δ���ã��봫��ֵ)

            string sResult = webService.getChat(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), scode);

            if (string.IsNullOrEmpty(sResult) || sResult.StartsWith("-"))
            {
                MessageBox.Show("����ʧ�ܣ�" + sResult); //����ʧ��ԭ������տ����ĵ�
            }
            else if (sResult == "1")
            {
                MessageBox.Show("û���յ����ţ�");
            }
            else
            {
                //��������ж��Ŵ�����᷵��һ���̶���ʽ���ַ���
                //�ط��ţ��ֻ��ţ����ݣ���Ҫ�����ݽ���URL���룩��ʱ��
                //���ж������Իس����и���
                //ʾ����
                //1,13812345065,ceshi%2fhello,2009-10-1915:51:05 
                //1,13912341404,test%2fok,2009-10-19 15:51:17

                //��������
                if (sResult.IndexOf("\r\n") > 0)
                {
                    sResult = sResult.Replace("\r\n", "\r");
                    string[] strs = sResult.Split(new char[] { '\r' }, StringSplitOptions.RemoveEmptyEntries);
                    if (strs != null && strs.Length > 0)
                    {
                        StringBuilder sb = new StringBuilder();
                        foreach (string msgStr in strs)
                        {
                            if (string.IsNullOrEmpty(msgStr) || msgStr.IndexOf(",") == -1)
                                continue;
                            string[] bodys = msgStr.Split(new char[] { ',' });
                            sb.Append("�ط��ţ�" + bodys[0] + " �ֻ��ţ�" + bodys[1] + " ���ݣ�" + System.Web.HttpUtility.UrlDecode(bodys[2]) + " ����ʱ�䣺" + bodys[3] + "\r\n");
                        }
                        MessageBox.Show(sb.ToString());
                    }
                }
                else
                {
                    //��������
                    string[] bodys = sResult.Split(new char[] { ',' });
                    string str = "�ط��ţ�" + bodys[0] + " �ֻ��ţ�" + bodys[1] + " ���ݣ�" + System.Web.HttpUtility.UrlDecode(bodys[2], Encoding.GetEncoding("gb2312")) + " ����ʱ�䣺" + bodys[3];
                    MessageBox.Show(str);
                }
            }
        }
    }
}