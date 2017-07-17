namespace GCS
{
    partial class gcs
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
            this.state = new System.Windows.Forms.Label();
            this.mission_time = new System.Windows.Forms.Label();
            this.gps_time = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.gps_long = new System.Windows.Forms.Label();
            this.gps_alt = new System.Windows.Forms.Label();
            this.gps_sat = new System.Windows.Forms.Label();
            this.alt_sensor = new System.Windows.Forms.Label();
            this.temp = new System.Windows.Forms.Label();
            this.bat_vol = new System.Windows.Forms.Label();
            this.state_text = new System.Windows.Forms.TextBox();
            this.miss_time_text = new System.Windows.Forms.TextBox();
            this.gps_time_text = new System.Windows.Forms.TextBox();
            this.gps_lat_text = new System.Windows.Forms.TextBox();
            this.gps_long_text = new System.Windows.Forms.TextBox();
            this.gps_alt_text = new System.Windows.Forms.TextBox();
            this.gps_sat_txt = new System.Windows.Forms.TextBox();
            this.alt_sensor_txt = new System.Windows.Forms.TextBox();
            this.temp_txt = new System.Windows.Forms.TextBox();
            this.bat_vol_txt = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // start_telemetry
            // 
            this.start_telemetry.Location = new System.Drawing.Point(25, 25);
            this.start_telemetry.Name = "start_telemetry";
            this.start_telemetry.Size = new System.Drawing.Size(200, 25);
            this.start_telemetry.TabIndex = 0;
            this.start_telemetry.Text = "Start Telemetry";
            this.start_telemetry.UseVisualStyleBackColor = true;
            this.start_telemetry.Click += new System.EventHandler(this.start_telemetry_Click);
            // 
            // stop_telemetry
            // 
            this.stop_telemetry.Location = new System.Drawing.Point(25, 55);
            this.stop_telemetry.Name = "stop_telemetry";
            this.stop_telemetry.Size = new System.Drawing.Size(200, 25);
            this.stop_telemetry.TabIndex = 1;
            this.stop_telemetry.Text = "Stop Telemetry";
            this.stop_telemetry.UseVisualStyleBackColor = true;
            this.stop_telemetry.Click += new System.EventHandler(this.stop_telemetry_Click);
            // 
            // state
            // 
            this.state.AutoSize = true;
            this.state.Location = new System.Drawing.Point(25, 100);
            this.state.Name = "state";
            this.state.Size = new System.Drawing.Size(42, 13);
            this.state.TabIndex = 2;
            this.state.Text = "STATE";
            this.state.Click += new System.EventHandler(this.state_Click);
            // 
            // mission_time
            // 
            this.mission_time.AutoSize = true;
            this.mission_time.Location = new System.Drawing.Point(25, 200);
            this.mission_time.Name = "mission_time";
            this.mission_time.Size = new System.Drawing.Size(81, 13);
            this.mission_time.TabIndex = 3;
            this.mission_time.Text = "MISSION TIME";
            this.mission_time.Click += new System.EventHandler(this.mission_time_Click);
            // 
            // gps_time
            // 
            this.gps_time.AutoSize = true;
            this.gps_time.Location = new System.Drawing.Point(25, 300);
            this.gps_time.Name = "gps_time";
            this.gps_time.Size = new System.Drawing.Size(58, 13);
            this.gps_time.TabIndex = 4;
            this.gps_time.Text = "GPS TIME";
            this.gps_time.Click += new System.EventHandler(this.gps_time_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(25, 400);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(85, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "GPS LATITUDE";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // gps_long
            // 
            this.gps_long.AutoSize = true;
            this.gps_long.Location = new System.Drawing.Point(25, 500);
            this.gps_long.Name = "gps_long";
            this.gps_long.Size = new System.Drawing.Size(95, 13);
            this.gps_long.TabIndex = 6;
            this.gps_long.Text = "GPS LONGITUDE";
            this.gps_long.Click += new System.EventHandler(this.gps_long_Click);
            // 
            // gps_alt
            // 
            this.gps_alt.AutoSize = true;
            this.gps_alt.Location = new System.Drawing.Point(300, 100);
            this.gps_alt.Name = "gps_alt";
            this.gps_alt.Size = new System.Drawing.Size(85, 13);
            this.gps_alt.TabIndex = 7;
            this.gps_alt.Text = "GPS ALTITUDE";
            this.gps_alt.Click += new System.EventHandler(this.gps_alt_Click);
            // 
            // gps_sat
            // 
            this.gps_sat.AutoSize = true;
            this.gps_sat.Location = new System.Drawing.Point(300, 200);
            this.gps_sat.Name = "gps_sat";
            this.gps_sat.Size = new System.Drawing.Size(89, 13);
            this.gps_sat.TabIndex = 8;
            this.gps_sat.Text = "GPS SATELLITE";
            this.gps_sat.Click += new System.EventHandler(this.gps_sat_Click);
            // 
            // alt_sensor
            // 
            this.alt_sensor.AutoSize = true;
            this.alt_sensor.Location = new System.Drawing.Point(300, 300);
            this.alt_sensor.Name = "alt_sensor";
            this.alt_sensor.Size = new System.Drawing.Size(114, 13);
            this.alt_sensor.TabIndex = 9;
            this.alt_sensor.Text = "ALTITUDE (SENSOR)";
            this.alt_sensor.Click += new System.EventHandler(this.alt_sensor_Click);
            // 
            // temp
            // 
            this.temp.AutoSize = true;
            this.temp.Location = new System.Drawing.Point(300, 400);
            this.temp.Name = "temp";
            this.temp.Size = new System.Drawing.Size(89, 13);
            this.temp.TabIndex = 10;
            this.temp.Text = "TEMPERATURE";
            this.temp.Click += new System.EventHandler(this.temp_Click);
            // 
            // bat_vol
            // 
            this.bat_vol.AutoSize = true;
            this.bat_vol.Location = new System.Drawing.Point(300, 500);
            this.bat_vol.Name = "bat_vol";
            this.bat_vol.Size = new System.Drawing.Size(110, 13);
            this.bat_vol.TabIndex = 11;
            this.bat_vol.Text = "BATTERY VOLTAGE";
            this.bat_vol.Click += new System.EventHandler(this.bat_vol_Click);
            // 
            // state_text
            // 
            this.state_text.Location = new System.Drawing.Point(25, 150);
            this.state_text.Name = "state_text";
            this.state_text.Size = new System.Drawing.Size(180, 20);
            this.state_text.TabIndex = 12;
            this.state_text.TextChanged += new System.EventHandler(this.state_text_TextChanged);
            // 
            // miss_time_text
            // 
            this.miss_time_text.Location = new System.Drawing.Point(25, 250);
            this.miss_time_text.Name = "miss_time_text";
            this.miss_time_text.Size = new System.Drawing.Size(180, 20);
            this.miss_time_text.TabIndex = 13;
            this.miss_time_text.TextChanged += new System.EventHandler(this.miss_time_text_TextChanged);
            // 
            // gps_time_text
            // 
            this.gps_time_text.Location = new System.Drawing.Point(25, 350);
            this.gps_time_text.Name = "gps_time_text";
            this.gps_time_text.Size = new System.Drawing.Size(180, 20);
            this.gps_time_text.TabIndex = 14;
            this.gps_time_text.TextChanged += new System.EventHandler(this.gps_time_text_TextChanged);
            // 
            // gps_lat_text
            // 
            this.gps_lat_text.Location = new System.Drawing.Point(25, 450);
            this.gps_lat_text.Name = "gps_lat_text";
            this.gps_lat_text.Size = new System.Drawing.Size(180, 20);
            this.gps_lat_text.TabIndex = 15;
            this.gps_lat_text.TextChanged += new System.EventHandler(this.gps_lat_text_TextChanged);
            // 
            // gps_long_text
            // 
            this.gps_long_text.Location = new System.Drawing.Point(25, 550);
            this.gps_long_text.Name = "gps_long_text";
            this.gps_long_text.Size = new System.Drawing.Size(180, 20);
            this.gps_long_text.TabIndex = 16;
            this.gps_long_text.TextChanged += new System.EventHandler(this.gps_long_text_TextChanged);
            // 
            // gps_alt_text
            // 
            this.gps_alt_text.Location = new System.Drawing.Point(300, 150);
            this.gps_alt_text.Name = "gps_alt_text";
            this.gps_alt_text.Size = new System.Drawing.Size(180, 20);
            this.gps_alt_text.TabIndex = 17;
            this.gps_alt_text.TextChanged += new System.EventHandler(this.gps_alt_text_TextChanged);
            // 
            // gps_sat_txt
            // 
            this.gps_sat_txt.Location = new System.Drawing.Point(300, 250);
            this.gps_sat_txt.Name = "gps_sat_txt";
            this.gps_sat_txt.Size = new System.Drawing.Size(180, 20);
            this.gps_sat_txt.TabIndex = 18;
            this.gps_sat_txt.TextChanged += new System.EventHandler(this.gps_sat_txt_TextChanged);
            // 
            // alt_sensor_txt
            // 
            this.alt_sensor_txt.Location = new System.Drawing.Point(300, 350);
            this.alt_sensor_txt.Name = "alt_sensor_txt";
            this.alt_sensor_txt.Size = new System.Drawing.Size(180, 20);
            this.alt_sensor_txt.TabIndex = 19;
            this.alt_sensor_txt.TextChanged += new System.EventHandler(this.alt_sensor_txt_TextChanged);
            // 
            // temp_txt
            // 
            this.temp_txt.Location = new System.Drawing.Point(300, 450);
            this.temp_txt.Name = "temp_txt";
            this.temp_txt.Size = new System.Drawing.Size(180, 20);
            this.temp_txt.TabIndex = 20;
            this.temp_txt.TextChanged += new System.EventHandler(this.temp_txt_TextChanged);
            // 
            // bat_vol_txt
            // 
            this.bat_vol_txt.Location = new System.Drawing.Point(300, 550);
            this.bat_vol_txt.Name = "bat_vol_txt";
            this.bat_vol_txt.Size = new System.Drawing.Size(180, 20);
            this.bat_vol_txt.TabIndex = 21;
            this.bat_vol_txt.TextChanged += new System.EventHandler(this.bat_vol_txt_TextChanged);
            // 
            // gcs
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1234, 612);
            this.Controls.Add(this.bat_vol_txt);
            this.Controls.Add(this.temp_txt);
            this.Controls.Add(this.alt_sensor_txt);
            this.Controls.Add(this.gps_sat_txt);
            this.Controls.Add(this.gps_alt_text);
            this.Controls.Add(this.gps_long_text);
            this.Controls.Add(this.gps_lat_text);
            this.Controls.Add(this.gps_time_text);
            this.Controls.Add(this.miss_time_text);
            this.Controls.Add(this.state_text);
            this.Controls.Add(this.bat_vol);
            this.Controls.Add(this.temp);
            this.Controls.Add(this.alt_sensor);
            this.Controls.Add(this.gps_sat);
            this.Controls.Add(this.gps_alt);
            this.Controls.Add(this.gps_long);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.gps_time);
            this.Controls.Add(this.mission_time);
            this.Controls.Add(this.state);
            this.Controls.Add(this.stop_telemetry);
            this.Controls.Add(this.start_telemetry);
            this.Name = "gcs";
            this.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.Text = "GCS  ( TEAM NO. 1300 TEAM NAME  :  FREQUENCY )";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button start_telemetry;
        private System.Windows.Forms.Button stop_telemetry;
        private System.Windows.Forms.Label state;
        private System.Windows.Forms.Label mission_time;
        private System.Windows.Forms.Label gps_time;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label gps_long;
        private System.Windows.Forms.Label gps_alt;
        private System.Windows.Forms.Label gps_sat;
        private System.Windows.Forms.Label alt_sensor;
        private System.Windows.Forms.Label temp;
        private System.Windows.Forms.Label bat_vol;
        private System.Windows.Forms.TextBox state_text;
        private System.Windows.Forms.TextBox miss_time_text;
        private System.Windows.Forms.TextBox gps_time_text;
        private System.Windows.Forms.TextBox gps_lat_text;
        private System.Windows.Forms.TextBox gps_long_text;
        private System.Windows.Forms.TextBox gps_alt_text;
        private System.Windows.Forms.TextBox gps_sat_txt;
        private System.Windows.Forms.TextBox alt_sensor_txt;
        private System.Windows.Forms.TextBox temp_txt;
        private System.Windows.Forms.TextBox bat_vol_txt;
    }
}

