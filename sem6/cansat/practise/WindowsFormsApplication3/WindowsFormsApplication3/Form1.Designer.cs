namespace WindowsFormsApplication3
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
            this.sendButton = new System.Windows.Forms.Button();
            this.ReadButton = new System.Windows.Forms.Button();
            this.textBox = new System.Windows.Forms.RichTextBox();
            this.StartCommButton = new System.Windows.Forms.Button();
            this.propertyButton = new System.Windows.Forms.Button();
            this.saveStatusButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // sendButton
            // 
            this.sendButton.Location = new System.Drawing.Point(12, 156);
            this.sendButton.Name = "sendButton";
            this.sendButton.Size = new System.Drawing.Size(75, 23);
            this.sendButton.TabIndex = 0;
            this.sendButton.Text = "Send";
            this.sendButton.UseVisualStyleBackColor = true;
            this.sendButton.Click += new System.EventHandler(this.sendButton_Click);
            // 
            // ReadButton
            // 
            this.ReadButton.Location = new System.Drawing.Point(150, 156);
            this.ReadButton.Name = "ReadButton";
            this.ReadButton.Size = new System.Drawing.Size(75, 23);
            this.ReadButton.TabIndex = 1;
            this.ReadButton.Text = "Read";
            this.ReadButton.UseVisualStyleBackColor = true;
            this.ReadButton.Click += new System.EventHandler(this.ReadButton_Click);
            // 
            // textBox
            // 
            this.textBox.Location = new System.Drawing.Point(28, 12);
            this.textBox.Name = "textBox";
            this.textBox.Size = new System.Drawing.Size(210, 118);
            this.textBox.TabIndex = 2;
            this.textBox.Text = "";
            this.textBox.TextChanged += new System.EventHandler(this.textBox_TextChanged);
            // 
            // StartCommButton
            // 
            this.StartCommButton.Location = new System.Drawing.Point(318, 107);
            this.StartCommButton.Name = "StartCommButton";
            this.StartCommButton.Size = new System.Drawing.Size(75, 23);
            this.StartCommButton.TabIndex = 3;
            this.StartCommButton.Text = "StartComm";
            this.StartCommButton.UseVisualStyleBackColor = true;
            this.StartCommButton.Click += new System.EventHandler(this.StartCommButton_Click);
            // 
            // propertyButton
            // 
            this.propertyButton.Location = new System.Drawing.Point(150, 213);
            this.propertyButton.Name = "propertyButton";
            this.propertyButton.Size = new System.Drawing.Size(75, 23);
            this.propertyButton.TabIndex = 4;
            this.propertyButton.Text = "Property";
            this.propertyButton.UseVisualStyleBackColor = true;
            this.propertyButton.Click += new System.EventHandler(this.propertyButton_Click_1);
            // 
            // saveStatusButton
            // 
            this.saveStatusButton.Location = new System.Drawing.Point(12, 213);
            this.saveStatusButton.Name = "saveStatusButton";
            this.saveStatusButton.Size = new System.Drawing.Size(75, 23);
            this.saveStatusButton.TabIndex = 5;
            this.saveStatusButton.Text = "Save Status";
            this.saveStatusButton.UseVisualStyleBackColor = true;
            this.saveStatusButton.Click += new System.EventHandler(this.saveStatusButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(496, 323);
            this.Controls.Add(this.saveStatusButton);
            this.Controls.Add(this.propertyButton);
            this.Controls.Add(this.StartCommButton);
            this.Controls.Add(this.textBox);
            this.Controls.Add(this.ReadButton);
            this.Controls.Add(this.sendButton);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button sendButton;
        private System.Windows.Forms.Button ReadButton;
        private System.Windows.Forms.RichTextBox textBox;
        private System.Windows.Forms.Button StartCommButton;
        private System.Windows.Forms.Button propertyButton;
        private System.Windows.Forms.Button saveStatusButton;
    }
}

