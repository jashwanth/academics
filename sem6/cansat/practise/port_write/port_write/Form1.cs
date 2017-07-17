using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;
using System.Threading;
namespace port_write
{
    public partial class Form1 : Form
    {
        public SerialPort s1 = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);
        public Form1()
        {
            s1.ReceivedBytesThreshold = 500;
            s1.ReadTimeout = 50000;
            s1.WriteTimeout = 50000;
       //     s1.DataReceived += new SerialDataReceivedEventHandler(s1_DataReceived);
            s1.Open();
            InitializeComponent();
        }
        private void s1_DataReceived(object sender,SerialDataReceivedEventArgs e)
        {
            // Show all the incoming data in the port's buffer
            byte[] array = Encoding.ASCII.GetBytes(textBox.Text);
            s1.Read(array, 0, textBox.Text.Length);
            Console.WriteLine(s1.ReadExisting());
            textBox.Text = "";
        }  
        private void receive_Click(object sender, EventArgs e)
        {
          //  textBox.Text = "";
            Console.WriteLine("Incoming Data:");
            byte[] array = Encoding.ASCII.GetBytes(textBox.Text);
            s1.Read(array, 0, textBox.Text.Length);
            Thread.Sleep(100);
            Console.WriteLine(s1.ReadExisting());
            textBox.Text = "";
        }
        private void send_Click(object sender, EventArgs e)
        {
            if(!s1.IsOpen)
              s1.Open();
            string[] txtlines = textBox.Lines;
            foreach (string line in txtlines)
            {
          //      MessageBox.Show(line);
                s1.WriteLine(line);
                Console.WriteLine(line);
            } 
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
             
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}