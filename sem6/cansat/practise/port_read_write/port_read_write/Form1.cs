using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;

namespace port_read_write
{
    public partial class Form1 : Form
    {
        private SerialPort s1 = new SerialPort("COM4", 9600, Parity.None, 8, StopBits.One);
        private SerialPort s2 = new SerialPort("COM5", 9600, Parity.None, 8, StopBits.One);
        public Form1()
        {
            InitializeComponent();
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
        private void sendButton_Click(object sender, EventArgs e)
        {
            s1.WriteLine(textBox1.Text);
            textBox1.Text = "";
            s1.DiscardOutBuffer();
        }
        private void receiveButton_Click(object sender, EventArgs e)
        {
            textBox1.Text = s2.ReadExisting();
            string str = textBox1.Text;
            s2.DiscardInBuffer();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
