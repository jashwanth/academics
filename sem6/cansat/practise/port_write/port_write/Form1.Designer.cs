namespace port_write
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.send_from_com = new System.Windows.Forms.Button();
            this.receive = new System.Windows.Forms.Button();
            this.textBox = new System.Windows.Forms.TextBox();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.SuspendLayout();
            // 
            // send_from_com
            // 
            this.send_from_com.Location = new System.Drawing.Point(35, 23);
            this.send_from_com.Name = "send_from_com";
            this.send_from_com.Size = new System.Drawing.Size(94, 23);
            this.send_from_com.TabIndex = 1;
            this.send_from_com.Text = "send_from_com";
            this.send_from_com.UseVisualStyleBackColor = true;
            this.send_from_com.Click += new System.EventHandler(this.send_Click);
            // 
            // receive
            // 
            this.receive.Location = new System.Drawing.Point(158, 23);
            this.receive.Name = "receive";
            this.receive.Size = new System.Drawing.Size(120, 23);
            this.receive.TabIndex = 2;
            this.receive.Text = "Receive_to_com";
            this.receive.UseVisualStyleBackColor = true;
            this.receive.Click += new System.EventHandler(this.receive_Click);
            // 
            // textBox
            // 
            this.textBox.Location = new System.Drawing.Point(75, 102);
            this.textBox.Multiline = true;
            this.textBox.Name = "textBox";
            this.textBox.Size = new System.Drawing.Size(100, 93);
            this.textBox.TabIndex = 3;
            this.textBox.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(337, 288);
            this.Controls.Add(this.textBox);
            this.Controls.Add(this.receive);
            this.Controls.Add(this.send_from_com);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button send_from_com;
        private System.Windows.Forms.Button receive;
        private System.Windows.Forms.TextBox textBox;
        private System.IO.Ports.SerialPort serialPort1;

    }
}

