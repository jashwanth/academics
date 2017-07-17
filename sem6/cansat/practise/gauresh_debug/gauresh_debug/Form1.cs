using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.IO.Ports;

namespace gauresh_debug
{
 /*   public partial class worker
    {
        Form form2 = new Form();
        private SerialPort s1 = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);
        private SerialPort s2 = new SerialPort("COM2", 9600, Parity.None, 8, StopBits.One);
        public worker()
        {
            form2.Activate();
            form2.Show();

            s1.ReceivedBytesThreshold = 500;
            s1.WriteTimeout = 50000;
            s1.ReadTimeout = 50000;
            if (!s1.IsOpen)
                s1.Open();

            s2.ReceivedBytesThreshold = 500;
            s2.WriteTimeout = 50000;
            s2.ReadTimeout = 50000;
            if (!s2.IsOpen)
                s2.Open();
        }

    } */

   public partial class gcs : Form
    {
        private SerialPort s1 = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);
        private SerialPort s2 = new SerialPort("COM2", 9600, Parity.None, 8, StopBits.One);
        int can_state = 0;
        int miss_time;
        int gp_time;
        float gp_lat;
        float gp_long;
        int gp_alt;
        int gp_sat;
        int alt_sens;
        int tem;
        float bat_v;
        bool tele_status = false;
        public gcs()
        {
            s1.ReceivedBytesThreshold = 500;
            s1.WriteTimeout = 50000;
            s1.ReadTimeout = 50000;
            if (!s1.IsOpen)
                s1.Open();

            s2.ReceivedBytesThreshold = 500;
            s2.WriteTimeout = 50000;
            s2.ReadTimeout = 50000;
            if (!s2.IsOpen)
                s2.Open();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            tele_status = true;
        }
        private void start_telemetry_Click_1(object sender, EventArgs e)
        {
            // send a byte to indicate start of telemetry put it as 0xFF  for now.
            // while(1)
              {
                // recieve 50 bytes every 2 sec ( for now just recieve bytes  2 sec we will see later)
                // parsing ( while parsing u will have to update the variables below.)

                can_state = 4;
                miss_time = 12324;
                gp_time = 143245;
                gp_lat = 4124.896F;
                gp_long = 4124.896F;
                gp_alt = 300;
                gp_sat = 4;
                alt_sens = 303;
                tem = 21;
                bat_v = 5.6F;
                // put in correct format in csv.
                // plots update the plot ( u will have to put values in respective arrays)

                // after this the code below will fill the form.
                // showing state.

                if (can_state == 1)
                {
                    state_text.Text = "BOOT";
                }
                else if (can_state == 2)
                {
                    state_text.Text = "TEST_MODE";
                }
                else if (can_state == 3)
                {
                    state_text.Text = "LAUNCH_PAD";
                }
                else if (can_state == 4)
                {
                    state_text.Text = "ASCENT";
                }
                else if (can_state == 5)
                {
                    state_text.Text = "PARACHUTE";
                }
                else if (can_state == 6)
                {
                    state_text.Text = "CANSAT";
                }
                else if (can_state == 7)
                {
                    state_text.Text = "IMPACT";
                }
                else
                {
                    state_text.Text = "BUZZER";
                }
                // showing mission time
                miss_time_text.Text = Convert.ToString(miss_time);
                // showing gps_time
                gps_time_text.Text = Convert.ToString(gp_time).Substring(0, 2) + ":" + Convert.ToString(gp_time).Substring(2, 2) + ":" + Convert.ToString(gp_time).Substring(4, 2);

                // showing gps latitude
                gps_lat_text.Text = Convert.ToString(gp_lat).Substring(0, 2) + "d" + Convert.ToString(gp_lat).Substring(2, 2) + "\'" + Convert.ToString(Math.Ceiling((gp_lat % 1) * 60)) + "\'\'" + " N";
                // showing gps longitude
                gps_long_text.Text = Convert.ToString(gp_long).Substring(0, 2) + "d" + Convert.ToString(gp_long).Substring(2, 2) + "\'" + Convert.ToString(Math.Ceiling((gp_long % 1) * 60)) + "\'\'" + " W";
                // showing gps altitude
                gps_alt_text.Text = Convert.ToString(gp_alt) + " m";
                // showing gps satellite
                gps_sat_txt.Text = Convert.ToString(gp_sat);
                // showing height from altitude sensor.
                alt_sensor_txt.Text = Convert.ToString(alt_sens) + " m";
                // showing temp
                temp_txt.Text = Convert.ToString(tem) + " C";
                // showing voltage
                bat_vol_txt.Text = Convert.ToString(bat_v) + " V";
               }

            }
        private void stop_telemetry_Click_1(object sender, EventArgs e)
         {
           // change the global variable to sto taking more data....
              tele_status = false;            
            // send the byte that stops telemetry.

            // make all display values as 0.
              state_text.Text = null;
              miss_time_text.Text = null;
              gps_time_text.Text = null;
              gps_lat_text.Text = null;
              gps_long_text.Text = null;
              gps_alt_text.Text = null;
              gps_sat_txt.Text = null;
              alt_sensor_txt.Text = null;
              temp_txt.Text = null;
              bat_vol_txt.Text = null; 
        }
        private void gcs_Load(object sender, EventArgs e)
        {
        
        }
        private void gps_altitude_Click(object sender, EventArgs e)
        {
        
        }
    }
}