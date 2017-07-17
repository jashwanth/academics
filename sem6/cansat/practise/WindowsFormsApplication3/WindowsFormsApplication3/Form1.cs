using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;

namespace WindowsFormsApplication3
{
    public partial class Form1 : Form
    {
        PropertyPage pp = new PropertyPage();
        SerialPort sp = new SerialPort();
        public Form1()
        {
            InitializeComponent();
        }
        private void propertyButton_Click(object sender, EventArgs e)
        {
            //show property dialog
            pp.ShowDialog();

            propertyButton.Hide();
        }
        
        private void sendButton_Click(object sender, EventArgs e)
        {
            try
            {
                //write line to serial port
                sp.WriteLine(textBox.Text);
                //clear the text box
                textBox.Text = "";
            }
            catch (System.Exception ex)
            {
                baudRatelLabel.Text = ex.Message;
            }
        }

        private void ReadButton_Click(object sender, EventArgs e)
        {
            try
            {
                //clear the text box
                textBox.Text = "";
                //read serial port and displayed the data in text box
                textBox.Text = sp.ReadLine();
            }
            catch (System.Exception ex)
            {
                baudRatelLabel.Text = ex.Message;
            }
        }

        private void textBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void StartCommButton_Click(object sender, EventArgs e)
        {
            StartCommButton.Hide();
            sendButton.Show();
            ReadButton.Show();
            textBox.Show();
        }

        
        private void propertyButton_Click_1(object sender, EventArgs e)
        {
            pp.ShowDialog();
            propertyButton.Hide();
        }

        private void saveStatusButton_Click(object sender, EventArgs e)
        {
            if (pp.bRate == "" && pp.sBits == "")
            {
                dataBitLabel.Text = "BaudRate = " + sp.BaudRate.ToString();
                readTimeOutLabel.Text = "StopBits = " + sp.StopBits.ToString();
            }
            else
            {
                dataBitLabel.Text = "BaudRate = " + pp.bRate;
                readTimeOutLabel.Text = "StopBits = " + pp.sBits;
            }

            parityLabel.Text = "DataBits = " + sp.DataBits.ToString();
            stopBitLabel.Text = "Parity = " + sp.Parity.ToString();
            readTimeOutLabel.Text = "ReadTimeout = " +
                      sp.ReadTimeout.ToString();

            if (propertyButton.Visible == true)
                propertyButton.Hide();
            saveStatusButton.Hide();
            startCommButton.Show();

            try
            {
                //open serial port
                sp.Open();
                //set read time out to 500 ms
                sp.ReadTimeout = 500;
            }
            catch (System.Exception ex)
            {
                baudRatelLabel.Text = ex.Message;
            }
        }

        
    }
}
