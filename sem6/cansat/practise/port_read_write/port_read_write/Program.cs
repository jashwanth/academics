using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO.Ports;
using System.Threading;
namespace port_read_write
{
    class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
     //   [STAThread]
        public static void Main()
        { 
      /*      new Program();
        }
        private Program()
        {
            s1.ReceivedBytesThreshold = 500;
            s1.WriteTimeout = 50000;
            s1.ReadTimeout = 50000;
    //        s1.DataReceived += new SerialDataReceivedEventHandler(s1_DataReceived);
            if(!s1.IsOpen)
            s1.Open();

            s2.ReceivedBytesThreshold = 500;
            s2.WriteTimeout = 50000;
            s2.ReadTimeout = 50000;
    //        s2.DataReceived += new SerialDataReceivedEventHandler(s2_DataReceived);
            if(!s2.IsOpen)
            s2.Open();          

      //      s2.WriteLine("hello world from s1 to s2");
            s1.WriteLine("hello world from s2 to s1");
           //        s1.Close();

      //      Console.WriteLine("press any to continue");
      //      Console.ReadKey();
            
            string str = s2.ReadExisting();
            Console.Write("what is existing in s2 is {0}",str);

            Thread.Sleep(5000);
            Console.Write("s1 and s2 data values\n  ");
            Console.Write("bytes of data in receive buffer of s1 is {0} .", s1.BytesToRead.ToString());
            Console.Write("bytes of data in send buffer of s1 is {0} .", s1.BytesToWrite.ToString());
            Console.Write("bytes of data in receive buffer of s2 is {0} .", s2.BytesToRead.ToString());
            Console.Write("bytes of data in send buffer of s2 is {0} .", s2.BytesToWrite.ToString());
            */
            Application.Run(new Form1());
         }
    /*     private  void s1_DataReceived(object sender,SerialDataReceivedEventArgs e)
         {

             Console.Write("finally entered in data handler ");
                   Thread.Sleep(500);
                   // Show all the incoming data in the port's buffer
                   Console.Write("why no");      
             Console.WriteLine(s1.ReadExisting());
                   
             //      Console.ReadKey();
          }  */
     /*    private void s2_DataReceived(object sender, SerialDataReceivedEventArgs e)
         {

             Console.Write("finally entered in data handler ");
             Thread.Sleep(500);
             // Show all the incoming data in the port's buffer
             Console.Write("why no");
             Console.WriteLine(s2.ReadExisting());

             //      Console.ReadKey();
         }  */
    }
}
