using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using ZedGraph;
using System.IO.Ports;

namespace ZGControlTest
{
	public partial class Form1 : Form
	{
        int samples = 200;
        int run = 1;
        byte[] mydata;
        
		public Form1()
		{
			InitializeComponent();
		}

        public void GetSerialPorts()
        {
            comboBox1.Items.Clear();
            string[] ports = SerialPort.GetPortNames();
            foreach (string port in ports)
            {
                comboBox1.Items.Add(port);
            }
        }

		private void Form1_Load( object sender, EventArgs e )
		{
			GraphPane myPane = zg1.GraphPane;
			myPane.Title.Text = "Digital Oscilloscope";
			myPane.XAxis.Title.Text = "Time Scale";
			myPane.YAxis.Title.Text = "Voltage";

			PointPairList list = new PointPairList();
            mydata = new byte[200];
			for ( int i = 0; i < 200; i++ )
			{
				double x = ((double)i/10.0) -5.0;
				double y = Math.Sin( (double)i * Math.PI / 15.0 ) * (5.0/(double)(0.1*i+1));
				list.Add( x, y );
                y = y * 50;
                mydata[i] = (byte)y;
			}

			LineItem myCurve = myPane.AddCurve( "Channel1", list, Color.Red, SymbolType.None );
			myPane.XAxis.MajorGrid.IsVisible = true;
            myPane.XAxis.MajorGrid.PenWidth = 1;
            myPane.XAxis.MajorGrid.DashOn = 5;
            myPane.XAxis.MajorGrid.DashOff = 2;
            myPane.YAxis.MajorGrid.IsVisible = true;
            myPane.YAxis.MajorGrid.PenWidth = 1;
            myPane.YAxis.MajorGrid.DashOn = 5;
            myPane.YAxis.MajorGrid.DashOff = 2;
			myPane.YAxis.Scale.FontSpec.FontColor = Color.Black;
			myPane.YAxis.Title.FontSpec.FontColor = Color.Black;
			myPane.YAxis.MajorGrid.IsZeroLine = true;
            myPane.XAxis.MajorGrid.IsZeroLine = true;
            myPane.XAxis.MinorGrid.IsVisible = true;
            myPane.YAxis.MinorGrid.IsVisible = true;
            myPane.XAxis.MinorGrid.PenWidth = 1;
            myPane.XAxis.MinorGrid.DashOn = 2;
            myPane.XAxis.MinorGrid.DashOff = 1;
            myPane.YAxis.MinorGrid.IsVisible = true;
            myPane.YAxis.MinorGrid.PenWidth = 1;
            myPane.YAxis.MinorGrid.DashOn = 2;
            myPane.YAxis.MinorGrid.DashOff = 1;

			myPane.YAxis.Scale.Align = AlignP.Inside;
			myPane.YAxis.Scale.Min = -5.1;
			myPane.YAxis.Scale.Max = 5.1;
            myPane.XAxis.Scale.Min = -5.1;
            myPane.XAxis.Scale.Max = 5.1;

			myPane.Chart.Fill = new Fill( Color.White, Color.White, 45.0f );

			zg1.IsShowPointValues = true;
			zg1.PointValueEvent += new ZedGraphControl.PointValueHandler( MyPointValueHandler );
            zg1.IsShowContextMenu = false;
            zg1.IsEnableWheelZoom = false;
            zg1.ZoomButtons = MouseButtons.None;
            zg1.ZoomButtons2 = MouseButtons.None;

			SetSize();
           
			zg1.AxisChange();
			zg1.Invalidate();
		}

		private void Form1_Resize( object sender, EventArgs e )
		{
			SetSize();
		}

		private void SetSize()
		{
			zg1.Location = new Point( 10, 10 );
			zg1.Size = new Size( this.ClientRectangle.Width - 150,
					this.ClientRectangle.Height - 20 );
		}

		private string MyPointValueHandler( ZedGraphControl control, GraphPane pane,
						CurveItem curve, int iPt )
		{
			PointPair pt = curve[iPt];

			return " ( " + pt.Y.ToString( "f2" ) + " , " + pt.X.ToString( "f1" ) + " )";
		}

        private void button1_Click(object sender, EventArgs e)
        {
            GetSerialPorts();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            serialPort1.BaudRate = 9600;
            serialPort1.ReceivedBytesThreshold = 204;
            serialPort1.ReadTimeout = 50000;
            serialPort1.WriteTimeout = 50000;
            if (serialPort1.IsOpen == false)
            {
                string[] ports = SerialPort.GetPortNames();
                foreach (string port in ports)
                {
                    if (String.Equals(serialPort1.PortName, port) == true)
                    {
                        serialPort1.Open();
                        byte[] writedata = { 190 };
                        serialPort1.Write(writedata, 0, 1);
                    }
                }
                if (serialPort1.IsOpen == false)
                {
                    MessageBox.Show("Could not open Port");
                }
                else
                {
                    button2.Text = "Disconnect";
                    serialPort1.DiscardInBuffer();
                    comboBox1.Enabled = false;
                }
            }
            else if(serialPort1.IsOpen==true)
            {
                serialPort1.Close();
                button2.Text = "Connect";
                comboBox1.Enabled = true;
                GetSerialPorts();
            }
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //comboBox1.SelectedIndex
            
            if (string.IsNullOrEmpty(comboBox1.Text)) {   
            }
            else
            {
                if (serialPort1.IsOpen == false)
                {
                    serialPort1.PortName = comboBox1.Text;
                }
            }

        }

        private void serialPort1_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {

            if (serialPort1.IsOpen == true && run==1)
            {
                
                mydata = new byte[200];
                for (int i = 0; i < 4; i++)
                {
                    mydata[i] = (byte)serialPort1.ReadByte();
                }
                while (!(mydata[0]==0 && mydata[1]==255 && mydata[2]==0 && mydata[3]==255))
                {
                    mydata[0] = mydata[1];
                    mydata[1] = mydata[2];
                    mydata[2] = mydata[3];
                    mydata[3] = (byte)serialPort1.ReadByte();
                }
                for (int i = 0; i < samples; i++)
                {
                    mydata[i] = (byte)serialPort1.ReadByte(); 
                }
                //serialPort1.Read(mydata, 0, samples);
                //MessageBox.Show("Reading Done");

                IPointListEdit ip = zg1.GraphPane.CurveList["Channel1"].Points as IPointListEdit;
                if (ip != null)
                {
                    //MessageBox.Show("Reading Done");
                    ip.Clear();
                    double x;
                    double y;
                    for (int i = 0; i < samples; i++)
                    {
                        x = (((10.0 * (double)i) / (double)samples) - 5.0); ;
                        y = (((10.0*(double)mydata[i])/255.0)-5.0);
                        ip.Add(x, y);
                    }
                    zg1.AxisChange();
                    zg1.Invalidate();
                }
                serialPort1.DiscardInBuffer();
                byte[] writedata = { 190 };
                serialPort1.Write(writedata, 0, 1);
              
            }
            
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(comboBox2.Text)==false)
            {
                if (serialPort1.IsOpen == true)
                {
                    byte[] writedata={72};
                    serialPort1.DiscardOutBuffer();
                    switch (comboBox2.SelectedIndex)
                    {
                        case 0:
                            writedata[0] = 10;
                            break;
                        case 1:
                            writedata[0] = 20;
                            break;
                        case 2:
                            writedata[0] = 30;
                            break;
                        case 3:
                            writedata[0] = 40;
                            break;
                        case 4:
                            writedata[0] = 50;
                            break;
                        case 5:
                            writedata[0] = 60;
                            break;
                        case 6:
                            writedata[0] = 70;
                            break;
                        case 7:
                            writedata[0] = 80;
                            break;
                        case 8:
                            writedata[0] = 90;
                            break;
                        case 9:
                            writedata[0] = 100;
                            break;
                        case 10:
                            writedata[0] = 110;
                            break;
                        case 11:
                            writedata[0] = 120;
                            break;
                        /*case 12:
                            writedata[0] = 130;
                            break;
                        case 13:
                            writedata[0] = 140;
                            break;
                        case 14:
                            writedata[0] = 150;
                            break;*/
                        default:
                            writedata[0] = 0;
                        break;
                    }
                    if (comboBox2.SelectedIndex==9)
                    {
                        serialPort1.ReceivedBytesThreshold = 104;
                        samples = 100;
                    }
                    else if (comboBox2.SelectedIndex==10)
                    {
                        serialPort1.ReceivedBytesThreshold = 54;
                        samples = 50;
                    }
                    else if (comboBox2.SelectedIndex==11)
                    {
                        
                        serialPort1.ReceivedBytesThreshold = 24;
                        samples = 20;
                    }
                    else
                    {
                        samples = 200;
                    }
                    serialPort1.ReceivedBytesThreshold = samples;
                    serialPort1.Write(writedata, 0, 1);
                    //MessageBox.Show("Yes");
                }
                else
                {
                    MessageBox.Show("Please connect to device first");
                }
            }
            else
            {
                MessageBox.Show("Please Select valid Time Scale");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (run==1)
            {
                run = 0;
                button3.Text = "Resume";
            }
            else
            {
                run = 1;
                button3.Text = "Pause";
                if (serialPort1.IsOpen==true)
                {
                    serialPort1.DiscardInBuffer();                    
                }
                
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            IPointListEdit ip = zg1.GraphPane.CurveList["Channel1"].Points as IPointListEdit;
            if (ip != null)
            {
                ip.Clear();
                double x;
                double y;
                if (hScrollBar1.Value > 0)
                {
                    for (int i = (hScrollBar1.Value * samples) / 100; i < samples; i++)
                    {
                        if (i - (hScrollBar1.Value * samples) / 100 >= 0)
                        {
                            x = (((10.0 * (double)i) / (double)samples) - 5.0); ;
                            y = (((10.0 * (double)mydata[i - (hScrollBar1.Value * samples) / 100]) / 255.0) - 5.0);
                            ip.Add(x, y);
                        }
                    }
                }
                else if (hScrollBar1.Value < 0)
                {
                    for (int i = 0; i < samples + (hScrollBar1.Value * samples) / 100; i++)
                    {
                        if (i - (hScrollBar1.Value * samples) / 100 >= 0)
                        {
                            x = (((10.0 * (double)i) / (double)samples) - 5.0); ;
                            y = (((10.0 * (double)mydata[i - (hScrollBar1.Value * samples) / 100]) / 255.0) - 5.0);
                            ip.Add(x, y);
                        }
                    }
                }
                zg1.AxisChange();
                zg1.Invalidate();
            }

        }

	}
}