#region Using directives
using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
//using System.Linq;
#endregion

namespace ConsoleApplication1
{
    namespace mynamespace
    {
        public class helloworld
        {
            public static void func()
            {
                Console.WriteLine("hello all");
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            mynamespace.helloworld.func();
            Console.WriteLine("the first app in begining  C# Programming!");
            int myint = 10;
            string mystring = "\"jashwanth\" ";
            int i = 1;
            Console.WriteLine("{0} {1}.", mystring, myint);
            Console.WriteLine("adds two float numbers");
            decimal a = Convert.ToDecimal(Console.ReadLine());
            decimal b = Convert.ToDecimal(Console.ReadLine());
            string str = "the sum is : ";
            a += b;
            Console.WriteLine("{0} {1}.", str, a);
            Console.ReadKey();
            Console.WriteLine("now arraylist :");
            ArrayList mylist = new ArrayList();
            mylist.Add("cansat team");
            mylist.Add("jashwanth ");
            mylist.Add("gauresh");
            mylist.Add("rakesh");
            for (i = 1; i < mylist.Count; i++)
                Console.WriteLine("{0}th member is {1}. ", i, mylist[i]);
        }
    }
}
