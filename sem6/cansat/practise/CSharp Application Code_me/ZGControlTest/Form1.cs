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
        string name, message;
   //     Thread readThread = new Thread(Read);
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
		
		}
        private void button1_Click(object sender, EventArgs e)
        {
            GetSerialPorts();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            serialPort1.BaudRate = 9600;
            serialPort1.ReceivedBytesThreshold = 500;
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
                        Console.Write("Name: ");
                        name = Console.ReadLine();
                        Console.WriteLine("Type QUIT to exit");
                        bool check = true;
                        while (true)
                        {
                            message = Console.ReadLine();
                            if (string.Equals("quit", message))
                            {
                                check = false;
                            }
                            else
                            {
                                serialPort1.WriteLine(String.Format("<{0}>: {1}", name, message));
                            }
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
                if (serialPort1.IsOpen == true)
                {
                    serialPort1.Close();
                    button2.Text = "Connect";
                    comboBox1.Enabled = true;
                    GetSerialPorts();
                }
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
            //    mydata = new byte[200];
                string str = null;
                //serialPort1.Read(mydata, 0, samples);
                //MessageBox.Show("Reading Done");
                textBox.Text = str;
                serialPort1.DiscardInBuffer();
                byte[] writedata = { 190 };
                serialPort1.Write(writedata, 0, 1); 
            }   
        }

  /*      private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
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
                     //   case 11:
                     //       writedata[0] = 120;
                     //       break;
                     //   case 12:
                     //       writedata[0] = 130;
                     //       break;
                     //   case 13:
                     //       writedata[0] = 140;
                     //       break;
                     //   case 14:
                     //       writedata[0] = 150;
                     //       break;
                     //   default:
                     //       writedata[0] = 0;
                     //   break;
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
        }    */
       
        private void textBox_TextChanged(object sender, EventArgs e)
        {
            textBox.Text = "";
        }

        private void zg1_Load(object sender, EventArgs e)
        {
            GraphPane myPane = zg1.GraphPane;
            myPane.Title.Text = "gpd altitude";
            myPane.XAxis.Title.Text = "Time Scale";
            myPane.YAxis.Title.Text = "altitude(m)";
            PointPairList l = new PointPairList();
            for(int i=1;i<10;i++)
                l.Add((double)i,(double)i*2+3);
            LineItem myCurve = myPane.AddCurve("Channel1", l, Color.Red, SymbolType.None);
            zg1.AxisChange();
            zg1.Invalidate();

        }

	}
}