#region Using directives
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using ZedGraph;
using System.IO.Ports;
#endregion

namespace WindowsFormsApplication2
{
    public partial class Form1 : Form
    {
        int samples = 200;
        int run = 1;
        byte[] mydata;

        public void GetSerialPorts()
        {
            comboBox1.Items.Clear();
            string[] ports = SerialPort.GetPortNames();
            foreach (string port in ports)
            {
                comboBox1.Items.Add(port);
            }
        }
        public Form1()
        {
            InitializeComponent();
        }
        private void zedGraphControl1_Load(object sender, EventArgs e)
        {

        }
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            double[] x = new double[1000];
            double[] y = new double[1000];
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = i;
                y[i] = Math.Sin(2*3.14*0.01 * x[i]);
            }
            GraphPane myplot = zedGraphControl1.GraphPane;
            PointPairList sp1 = new PointPairList(x,y);
            LineItem myCurve1 = myplot.AddCurve("Sine Wave", sp1, Color.Blue, SymbolType.None);

         //   myplot.Title.Text("sine plot");
            zedGraphControl1.AxisChange();
            zedGraphControl1.Invalidate();
            zedGraphControl1.Refresh();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            GetSerialPorts();   
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SerialPort serialPort1 = new SerialPort("COM1");
            serialPort1.BaudRate = 9600;
            serialPort1.ReceivedBytesThreshold = 100;
            serialPort1.ReadTimeout = 50000;
            serialPort1.WriteTimeout = 50000;
            if
        }
    }
}
