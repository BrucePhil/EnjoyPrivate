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
        /// WebService引用接口类
        /// </summary>
        private demo.ShareTech.Service webService = null;
        /// <summary>
        /// 接口返回值
        /// </summary>
        private int iResult = 0;

        private void Form1_Load(object sender, EventArgs e)
        {
            //实例化类并改变接口地址
            webService = new demo.ShareTech.Service();
            webService.Url = lblURL.Text;
        }
        //修改密码
        private void btnChangePWD_Click(object sender, EventArgs e)
        {
            iResult = webService.changePassWord(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtNewPWD.Text.Trim());
            if (iResult == 1)
            {
                MessageBox.Show("密码修改成功！");
            }
            else
            {
                MessageBox.Show("密码修改失败：" + iResult); //具体失败原因，请对照开发文档
            }
        }
        //查询余额
        private void btnGetBalance_Click(object sender, EventArgs e)
        {
            iResult = webService.getBalance(txtUserName.Text.Trim(), txtPassWord.Text.Trim());
            if (iResult >= 0)
            {
                MessageBox.Show("当前余额为：" + iResult);
            }
            else
            {
                MessageBox.Show("查询余额失败：" + iResult); //具体失败原因，请对照开发文档
            }
        }
        //发送短信
        private void btnSendMsg_Click(object sender, EventArgs e)
        {
            string scode="";   //特服号码(保留字段还未启用，请传空值)
            string setTime = ""; //定时时间(格式 yyyy-dd-MM HH:mm) 如果传空值或者过期的时间则会立即发送

            iResult = webService.sendMessage(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtPhones.Text.Trim(),txtContents.Text.Trim(),scode,setTime);
            if (iResult == 1)
            {
                MessageBox.Show("短信发送成功！");
            }
            else
            {
                MessageBox.Show("发送失败：" + iResult); //具体失败原因，请对照开发文档
            }
        }
        //发送彩信
        private void btnSendMMS_Click(object sender, EventArgs e)
        {
            string scode = "";   //特服号码(保留字段还未启用，请传空值)
            string setTime = ""; //定时时间(格式 yyyy-dd-MM HH:mm) 如果传空值或者过期的时间则会立即发送
            byte[] mmsBytes = MakeMMS();//生成彩信数据流

            if (mmsBytes == null || mmsBytes.Length == 0)
            {
                //MessageBox.Show("彩信文件生成失败！");
                return;
            }
            iResult = webService.sendMMS(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtPhones.Text.Trim(), mmsBytes, scode, setTime);
            if (iResult == 1)
            {
                MessageBox.Show("彩信发送成功！");
            }
            else
            {
                MessageBox.Show("彩信发送失败：" + iResult); //具体失败原因，请对照开发文档
            }
        }
        /// <summary>
        /// 将文件转换为数据流
        /// </summary>
        /// <returns></returns>
        private byte[] MakeMMS()
        {
            byte[] rbytes = null;
            System.IO.FileStream midStrm = null;
            System.IO.FileStream imgStrm = null;
            try
            {
                #region 准备彩信内容并判断大小
                string title = "测试彩信标题";
                //第一帧图片
                string path = System.AppDomain.CurrentDomain.BaseDirectory + "1.jpg";
                imgStrm = new System.IO.FileStream(path, System.IO.FileMode.Open);
                //第一帧文字
                string strContents = "彩信第一帧文字";
                //第一帧声音
                path = System.AppDomain.CurrentDomain.BaseDirectory + "1.mid";
                midStrm = new System.IO.FileStream(path, System.IO.FileMode.Open);
                if ((title.Length + imgStrm.Length + midStrm.Length) > 50 * 1024)
                {
                    MessageBox.Show("彩信文件超过50K，不能发送！");
                    return null;
                }
                #endregion

                #region 彩信内容转换为EMS格式文件

                //EMS 文件格式示例

                //<package64>
                //<subject>彩信标题Base64编码</subject>
                //<body>
                //<par dur="10000ms">
                //<img src="1.jpg">图片Base64编码</img>
                //<audio src="1.mid">声音Base64编码</audio>
                //<text src="1.txt">文字Base64编码</text>
                //</par>
                //<par dur="10000ms">
                //<img src="2.jpg">图片Base64编码</img>
                //<audio src="2.mid">声音Base64编码</audio>
                //<text src="2.txt">文字Base64编码</text>
                //</par>
                //</body>
                //</package64>

                System.Text.StringBuilder sbMMS = new StringBuilder();
                sbMMS.Append("<package64><subject>");

                string base64Str = Convert.ToBase64String(System.Text.Encoding.GetEncoding("gb2312").GetBytes(title)); //彩信标题Base64编码
                sbMMS.Append(base64Str + "</subject><body>");

                //添加第一帧，可添加多帧，但最大不能超过15帧 （每帧可添加一幅图片，一段文字，一个声音，不需要则不添加）

                sbMMS.Append("<par dur=\"10000ms\">"); //dur="10000ms" 表示这一帧播放时间为10秒
                //添加第一帧图片(不需要则不添加)
                sbMMS.Append("<img src=\"1.jpg\">"); //src="1.jpg" 表示图片的名称为 1.jpg ，彩信目前只支持 GIF,JPG 两种格式的图片
                rbytes=new byte[imgStrm.Length];
                imgStrm.Read(rbytes, 0, rbytes.Length);
                base64Str = Convert.ToBase64String(rbytes); //图片转换为Base64编码
                sbMMS.Append(base64Str+"</img>");

                //添加第一帧声音(不需要则不添加)
                sbMMS.Append("<audio src=\"1.mid\">"); //src="1.mid" 表示声音的名称为 1.mid ，彩信目前只支持 MID 格式的声音
                rbytes = new byte[midStrm.Length];
                midStrm.Read(rbytes, 0, rbytes.Length);
                base64Str = Convert.ToBase64String(rbytes); //声音转换为Base64编码
                sbMMS.Append(base64Str + "</audio>");

                //添加第一帧文字(不需要则不添加)
                sbMMS.Append("<text src=\"1.txt\">");
                rbytes = System.Text.Encoding.GetEncoding("gb2312").GetBytes(strContents);
                base64Str = Convert.ToBase64String(rbytes); //文字转换为Base64编码
                sbMMS.Append(base64Str + "</text>");

                sbMMS.Append("</par>"); //这一帧结束
                sbMMS.Append("</body></package64>"); //彩信文件组包结束

                #endregion

                //EMS字符串转换为数据流
                rbytes = System.Text.Encoding.ASCII.GetBytes(sbMMS.ToString()); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                //关闭文件流
                if (imgStrm != null)
                    imgStrm.Close();
                if (midStrm != null)
                    midStrm.Close();
            }
            return rbytes;
        }
        //互动短信
        private void btnChat_Click(object sender, EventArgs e)
        {
            string scode = "";   //特服号码(保留字段还未启用，请传空值)
            string setTime = ""; //定时时间(格式 yyyy-dd-MM HH:mm) 如果传空值或者过期的时间则会立即发送

            iResult = webService.sendChat(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), txtPhones.Text.Trim(), txtContents.Text.Trim(), scode, setTime);
            if (iResult == 1)
            {
                MessageBox.Show("短信发送成功！");
            }
            else
            {
                MessageBox.Show("发送失败：" + iResult); //具体失败原因，请对照开发文档
            }
        }
        //接收短信
        private void btnGetChat_Click(object sender, EventArgs e)
        {
            string scode = "";   //特服号码(保留字段还未启用，请传空值)

            string sResult = webService.getChat(txtUserName.Text.Trim(), txtPassWord.Text.Trim(), scode);

            if (string.IsNullOrEmpty(sResult) || sResult.StartsWith("-"))
            {
                MessageBox.Show("操作失败：" + sResult); //具体失败原因，请对照开发文档
            }
            else if (sResult == "1")
            {
                MessageBox.Show("没有收到短信！");
            }
            else
            {
                //如果有上行短信存在则会返回一个固定格式的字符串
                //特服号，手机号，内容（需要对内容进行URL解码），时间
                //如有多条则以回车换行隔开
                //示例：
                //1,13812345065,ceshi%2fhello,2009-10-1915:51:05 
                //1,13912341404,test%2fok,2009-10-19 15:51:17

                //多条内容
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
                            sb.Append("特服号：" + bodys[0] + " 手机号：" + bodys[1] + " 内容：" + System.Web.HttpUtility.UrlDecode(bodys[2]) + " 接收时间：" + bodys[3] + "\r\n");
                        }
                        MessageBox.Show(sb.ToString());
                    }
                }
                else
                {
                    //单条内容
                    string[] bodys = sResult.Split(new char[] { ',' });
                    string str = "特服号：" + bodys[0] + " 手机号：" + bodys[1] + " 内容：" + System.Web.HttpUtility.UrlDecode(bodys[2], Encoding.GetEncoding("gb2312")) + " 接收时间：" + bodys[3];
                    MessageBox.Show(str);
                }
            }
        }
    }
}