namespace demo
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.lblURL = new System.Windows.Forms.LinkLabel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtUserName = new System.Windows.Forms.TextBox();
            this.txtPassWord = new System.Windows.Forms.TextBox();
            this.btnChangePWD = new System.Windows.Forms.Button();
            this.txtNewPWD = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnGetBalance = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.txtPhones = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtContents = new System.Windows.Forms.TextBox();
            this.btnSendMsg = new System.Windows.Forms.Button();
            this.btnSendMMS = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.btnChat = new System.Windows.Forms.Button();
            this.btnGetChat = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblURL
            // 
            this.lblURL.AutoSize = true;
            this.lblURL.Location = new System.Drawing.Point(83, 11);
            this.lblURL.Name = "lblURL";
            this.lblURL.Size = new System.Drawing.Size(269, 12);
            this.lblURL.TabIndex = 0;
            this.lblURL.TabStop = true;
            this.lblURL.Text = "http://www.82009668.com:888/SDK/Service.asmx";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "接口地址";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 12);
            this.label2.TabIndex = 2;
            this.label2.Text = "用户名";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(236, 48);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 3;
            this.label3.Text = "密码";
            // 
            // txtUserName
            // 
            this.txtUserName.Location = new System.Drawing.Point(71, 45);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(148, 21);
            this.txtUserName.TabIndex = 4;
            this.txtUserName.Text = "测试账号";
            // 
            // txtPassWord
            // 
            this.txtPassWord.Location = new System.Drawing.Point(281, 45);
            this.txtPassWord.Name = "txtPassWord";
            this.txtPassWord.Size = new System.Drawing.Size(183, 21);
            this.txtPassWord.TabIndex = 5;
            this.txtPassWord.Text = "测试密码";
            // 
            // btnChangePWD
            // 
            this.btnChangePWD.Location = new System.Drawing.Point(238, 82);
            this.btnChangePWD.Name = "btnChangePWD";
            this.btnChangePWD.Size = new System.Drawing.Size(101, 36);
            this.btnChangePWD.TabIndex = 6;
            this.btnChangePWD.Text = "修改密码";
            this.btnChangePWD.UseVisualStyleBackColor = true;
            this.btnChangePWD.Click += new System.EventHandler(this.btnChangePWD_Click);
            // 
            // txtNewPWD
            // 
            this.txtNewPWD.Location = new System.Drawing.Point(69, 91);
            this.txtNewPWD.Name = "txtNewPWD";
            this.txtNewPWD.Size = new System.Drawing.Size(148, 21);
            this.txtNewPWD.TabIndex = 8;
            this.txtNewPWD.Text = "123456";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 94);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 12);
            this.label4.TabIndex = 7;
            this.label4.Text = "新密码";
            // 
            // btnGetBalance
            // 
            this.btnGetBalance.Location = new System.Drawing.Point(363, 82);
            this.btnGetBalance.Name = "btnGetBalance";
            this.btnGetBalance.Size = new System.Drawing.Size(101, 36);
            this.btnGetBalance.TabIndex = 9;
            this.btnGetBalance.Text = "获取账户余额";
            this.btnGetBalance.UseVisualStyleBackColor = true;
            this.btnGetBalance.Click += new System.EventHandler(this.btnGetBalance_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 136);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 12);
            this.label5.TabIndex = 10;
            this.label5.Text = "接收号码";
            // 
            // txtPhones
            // 
            this.txtPhones.Location = new System.Drawing.Point(83, 133);
            this.txtPhones.Name = "txtPhones";
            this.txtPhones.Size = new System.Drawing.Size(158, 21);
            this.txtPhones.TabIndex = 11;
            this.txtPhones.Text = "13800013800,02882009668";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(257, 136);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 12);
            this.label6.TabIndex = 12;
            this.label6.Text = "短信内容";
            // 
            // txtContents
            // 
            this.txtContents.Location = new System.Drawing.Point(316, 133);
            this.txtContents.Name = "txtContents";
            this.txtContents.Size = new System.Drawing.Size(148, 21);
            this.txtContents.TabIndex = 13;
            this.txtContents.Text = "测试下短信SDK";
            // 
            // btnSendMsg
            // 
            this.btnSendMsg.Location = new System.Drawing.Point(26, 170);
            this.btnSendMsg.Name = "btnSendMsg";
            this.btnSendMsg.Size = new System.Drawing.Size(101, 36);
            this.btnSendMsg.TabIndex = 14;
            this.btnSendMsg.Text = "发送短信";
            this.btnSendMsg.UseVisualStyleBackColor = true;
            this.btnSendMsg.Click += new System.EventHandler(this.btnSendMsg_Click);
            // 
            // btnSendMMS
            // 
            this.btnSendMMS.Location = new System.Drawing.Point(138, 170);
            this.btnSendMMS.Name = "btnSendMMS";
            this.btnSendMMS.Size = new System.Drawing.Size(101, 36);
            this.btnSendMMS.TabIndex = 15;
            this.btnSendMMS.Text = "发送彩信";
            this.btnSendMMS.UseVisualStyleBackColor = true;
            this.btnSendMMS.Click += new System.EventHandler(this.btnSendMMS_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(26, 246);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(438, 210);
            this.textBox1.TabIndex = 16;
            this.textBox1.Text = resources.GetString("textBox1.Text");
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(24, 221);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(101, 12);
            this.label7.TabIndex = 17;
            this.label7.Text = "接口返回参数说明";
            // 
            // btnChat
            // 
            this.btnChat.Location = new System.Drawing.Point(250, 170);
            this.btnChat.Name = "btnChat";
            this.btnChat.Size = new System.Drawing.Size(101, 36);
            this.btnChat.TabIndex = 18;
            this.btnChat.Text = "互动短信";
            this.btnChat.UseVisualStyleBackColor = true;
            this.btnChat.Click += new System.EventHandler(this.btnChat_Click);
            // 
            // btnGetChat
            // 
            this.btnGetChat.Location = new System.Drawing.Point(362, 170);
            this.btnGetChat.Name = "btnGetChat";
            this.btnGetChat.Size = new System.Drawing.Size(101, 36);
            this.btnGetChat.TabIndex = 19;
            this.btnGetChat.Text = "接收短信";
            this.btnGetChat.UseVisualStyleBackColor = true;
            this.btnGetChat.Click += new System.EventHandler(this.btnGetChat_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(491, 474);
            this.Controls.Add(this.btnGetChat);
            this.Controls.Add(this.btnChat);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.btnSendMMS);
            this.Controls.Add(this.btnSendMsg);
            this.Controls.Add(this.txtContents);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtPhones);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnGetBalance);
            this.Controls.Add(this.txtNewPWD);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnChangePWD);
            this.Controls.Add(this.txtPassWord);
            this.Controls.Add(this.txtUserName);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblURL);
            this.Name = "Form1";
            this.Text = "企信通WebService调用示例";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.LinkLabel lblURL;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtUserName;
        private System.Windows.Forms.TextBox txtPassWord;
        private System.Windows.Forms.Button btnChangePWD;
        private System.Windows.Forms.TextBox txtNewPWD;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnGetBalance;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtPhones;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtContents;
        private System.Windows.Forms.Button btnSendMsg;
        private System.Windows.Forms.Button btnSendMMS;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnChat;
        private System.Windows.Forms.Button btnGetChat;
    }
}

