namespace gauresh_debug
{
    partial class worker
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
            this.start_telemetry = new System.Windows.Forms.Button();
            this.stop_telemetry = new System.Windows.Forms.Button();
            this.state_text = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.gps_alt_text = new System.Windows.Forms.TextBox();
            this.gps_long_text = new System.Windows.Forms.TextBox();
            this.gps_lat_text = new System.Windows.Forms.TextBox();
            this.gps_time_text = new System.Windows.Forms.TextBox();
            this.miss_time_text = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.gps_longitude = new System.Windows.Forms.Label();
            this.gps_altitude = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.alt_sensor_txt = new System.Windows.Forms.TextBox();
            this.gps_sat_txt = new System.Windows.Forms.TextBox();
            this.temp_txt = new System.Windows.Forms.TextBox();
            this.bat_vol_txt = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // start_telemetry
            // 
            this.start_telemetry.Location = new System.Drawing.Point(12, 35);
            this.start_telemetry.Name = "start_telemetry";
            this.start_telemetry.Size = new System.Drawing.Size(75, 23);
            this.start_telemetry.TabIndex = 0;
            this.start_telemetry.Text = "start telemetry";
            this.start_telemetry.UseVisualStyleBackColor = true;
            this.start_telemetry.Click += new System.EventHandler(this.start_telemetry_Click_1);
            // 
            // stop_telemetry
            // 
            this.stop_telemetry.Location = new System.Drawing.Point(134, 35);
            this.stop_telemetry.Name = "stop_telemetry";
            this.stop_telemetry.Size = new System.Drawing.Size(75, 23);
            this.stop_telemetry.TabIndex = 1;
            this.stop_telemetry.Text = "stop telemetry";
            this.stop_telemetry.UseVisualStyleBackColor = true;
            this.stop_telemetry.Click += new System.EventHandler(this.stop_telemetry_Click_1);
            // 
            // state_text
            // 
            this.state_text.Location = new System.Drawing.Point(12, 99);
            this.state_text.Multiline = true;
            this.state_text.Name = "state_text";
            this.state_text.Size = new System.Drawing.Size(100, 23);
            this.state_text.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(27, 83);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "state";
            // 
            // gps_alt_text
            // 
            this.gps_alt_text.Location = new System.Drawing.Point(134, 164);
            this.gps_alt_text.Name = "gps_alt_text";
            this.gps_alt_text.Size = new System.Drawing.Size(100, 20);
            this.gps_alt_text.TabIndex = 4;
            // 
            // gps_long_text
            // 
            this.gps_long_text.Location = new System.Drawing.Point(16, 235);
            this.gps_long_text.Name = "gps_long_text";
            this.gps_long_text.Size = new System.Drawing.Size(100, 20);
            this.gps_long_text.TabIndex = 5;
            // 
            // gps_lat_text
            // 
            this.gps_lat_text.Location = new System.Drawing.Point(134, 235);
            this.gps_lat_text.Name = "gps_lat_text";
            this.gps_lat_text.Size = new System.Drawing.Size(100, 20);
            this.gps_lat_text.TabIndex = 6;
            // 
            // gps_time_text
            // 
            this.gps_time_text.Location = new System.Drawing.Point(16, 164);
            this.gps_time_text.Name = "gps_time_text";
            this.gps_time_text.Size = new System.Drawing.Size(100, 20);
            this.gps_time_text.TabIndex = 7;
            // 
            // miss_time_text
            // 
            this.miss_time_text.Location = new System.Drawing.Point(134, 99);
            this.miss_time_text.Name = "miss_time_text";
            this.miss_time_text.Size = new System.Drawing.Size(100, 20);
            this.miss_time_text.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(145, 83);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(52, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "miss_time";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(40, 148);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(49, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "gps_time";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(145, 219);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(64, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "gps_latitude";
            // 
            // gps_longitude
            // 
            this.gps_longitude.AutoSize = true;
            this.gps_longitude.Location = new System.Drawing.Point(40, 219);
            this.gps_longitude.Name = "gps_longitude";
            this.gps_longitude.Size = new System.Drawing.Size(73, 13);
            this.gps_longitude.TabIndex = 12;
            this.gps_longitude.Text = "gps_longitude";
            // 
            // gps_altitude
            // 
            this.gps_altitude.AutoSize = true;
            this.gps_altitude.Location = new System.Drawing.Point(145, 148);
            this.gps_altitude.Name = "gps_altitude";
            this.gps_altitude.Size = new System.Drawing.Size(64, 13);
            this.gps_altitude.TabIndex = 13;
            this.gps_altitude.Text = "gps_altitude";
            this.gps_altitude.Click += new System.EventHandler(this.gps_altitude_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(305, 83);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(65, 13);
            this.label7.TabIndex = 14;
            this.label7.Text = "gps_satellite";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(410, 83);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(55, 13);
            this.label5.TabIndex = 15;
            this.label5.Text = "alt_sensor";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(547, 83);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(47, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "temp_txt";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(669, 83);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(63, 13);
            this.label8.TabIndex = 17;
            this.label8.Text = "bat_voltage";
            // 
            // alt_sensor_txt
            // 
            this.alt_sensor_txt.Location = new System.Drawing.Point(401, 99);
            this.alt_sensor_txt.Name = "alt_sensor_txt";
            this.alt_sensor_txt.Size = new System.Drawing.Size(100, 20);
            this.alt_sensor_txt.TabIndex = 18;
            // 
            // gps_sat_txt
            // 
            this.gps_sat_txt.Location = new System.Drawing.Point(287, 99);
            this.gps_sat_txt.Name = "gps_sat_txt";
            this.gps_sat_txt.Size = new System.Drawing.Size(100, 20);
            this.gps_sat_txt.TabIndex = 19;
            // 
            // temp_txt
            // 
            this.temp_txt.Location = new System.Drawing.Point(535, 99);
            this.temp_txt.Name = "temp_txt";
            this.temp_txt.Size = new System.Drawing.Size(100, 20);
            this.temp_txt.TabIndex = 20;
            // 
            // bat_vol_txt
            // 
            this.bat_vol_txt.Location = new System.Drawing.Point(658, 99);
            this.bat_vol_txt.Name = "bat_vol_txt";
            this.bat_vol_txt.Size = new System.Drawing.Size(100, 20);
            this.bat_vol_txt.TabIndex = 21;
            // 
            // gcs
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1065, 373);
            this.Controls.Add(this.bat_vol_txt);
            this.Controls.Add(this.temp_txt);
            this.Controls.Add(this.gps_sat_txt);
            this.Controls.Add(this.alt_sensor_txt);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.gps_altitude);
            this.Controls.Add(this.gps_longitude);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.miss_time_text);
            this.Controls.Add(this.gps_time_text);
            this.Controls.Add(this.gps_lat_text);
            this.Controls.Add(this.gps_long_text);
            this.Controls.Add(this.gps_alt_text);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.state_text);
            this.Controls.Add(this.stop_telemetry);
            this.Controls.Add(this.start_telemetry);
            this.Name = "gcs";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.gcs_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button start_telemetry;
        private System.Windows.Forms.Button stop_telemetry;
        private System.Windows.Forms.TextBox state_text;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox gps_alt_text;
        private System.Windows.Forms.TextBox gps_long_text;
        private System.Windows.Forms.TextBox gps_lat_text;
        private System.Windows.Forms.TextBox gps_time_text;
        private System.Windows.Forms.TextBox miss_time_text;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label gps_longitude;
        private System.Windows.Forms.Label gps_altitude;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox alt_sensor_txt;
        private System.Windows.Forms.TextBox gps_sat_txt;
        private System.Windows.Forms.TextBox temp_txt;
        private System.Windows.Forms.TextBox bat_vol_txt;
    }
}

