using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication3
{
    public partial class PropertyPage : Form
    {
        private string baudR = "";
        private string stopB = "";
        
        public string bRate
        {
            get
            {
                return baudR;
            }
            set
            {
                baudR = value;
            }
        }
        public string sBits
        {
            get
            {
                return stopB;
            }
            set
            {
                stopB = value;
            }
        }
        public PropertyPage()
        {
            InitializeComponent();
        }
        
        
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void okButton_Click_1(object sender, EventArgs e)
        {
            this.bRate = "";
            this.sBits = "";
            //close form
            this.Close();
        }

        private void cancelButton_Click(object sender, EventArgs e)
        {
            this.bRate = "";
            this.sBits = "";
            //close form
            this.Close();
        }

    }
}
