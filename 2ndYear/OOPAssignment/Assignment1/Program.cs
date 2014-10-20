using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Speech.Synthesis;
using System.IO;

namespace Assignment1
{    
    class Program
    {
        public static List<Dani> list = new List<Dani>();
        public static List<string> dun = new List<string>();
        static void LoadSentences(string filename)
        {
            string[] lines = System.IO.File.ReadAllLines(filename);
            int read_in = lines.Length;
            for (int i = 0; i < lines.Length; i++)
            {
               lines[i] = changetowords(lines[i]);
            }
        }
        public static string changetowords(string sentence)
        {
            string[] fields = sentence.Split(' ');
            for (int i = 0; i < fields.Length; i++)
            {
                bool matched = false;//for checking if the word is in the list
                bool next_matched = false;//for checking if the next word is in the list
                bool lastword = false;//for checking if the word is the last word in the entered sentence
                int match=0;//To pin point where on the list the match of the word was
                for (int j = 0; j < list.Count; j++)
                {
                    if (fields[i] == list[j].Word)//if the word is in the list 
                    {
                        matched = true;
                        match=j;
                    }
                    if (i < (fields.Length - 1))
                    {
                        if (fields[i + 1] == list[j].Word)//If the next word is in the list
                        {
                            next_matched = true;
                        }
                    }
                    if (fields[fields.Length - 1] == fields[i])//If the word is the last word in the sentence
                    {
                        lastword = true;
                        next_matched = true;
                    }
                }
                if (matched == false)
                {
                    if (lastword == true)//If the word is the last word in the sentence and not in the list
                    {
                        Dani word = new Dani(fields[i], -1);
                        list.Add(word);
                    }
                    else if (next_matched == false)//If the word and the word after that word are both not in the list
                    {
                        Dani word = new Dani(fields[i], list.Count() + 1);
                        list.Add(word);
                    }     
                    else//If the word is not in the list but the other word is
                    {
                        int index1;
                        index1 = list.FindIndex(content => content.Word == fields[i + 1]);
                        Dani word = new Dani(fields[i], index1);
                        list.Add(word);
                    }
                }
                else
                {
                    if (lastword == true)// If the word is the last word in the sentence but already a word in the list
                    {
                        list[match].Next_word.Add(-1);
                    }
                    else if (next_matched == false)//If the word is in the list but the next one isnt
                    {
                        int index4=list.Count();
                        list[match].Next_word.Add(index4);
                    }
                    else//If the word and the next word are both in the list
                    {
                        int index2;
                        index2 = list.FindIndex(content => content.Word == fields[i + 1]);
                        list[match].Next_word.Add(index2);      
                    }
                }
            }
            return "";
        }
        public static void display(string dundalk, string speaking)
        {
            Random num = new Random();
            int reference=num.Next(-1,list.Count()-1);
            Console.Write("DANI: ");
            string message="";
            while(reference!=-1)
            {
                message = message + list[reference] +" ";
                int rand = num.Next(0, list[reference].Next_word.Count);
                reference = list[reference].Next_word[rand];       
            }
            if (dundalk == "y")
            {
                    int rand_num = num.Next(0, dun.Count);
                    message = message + dun[rand_num];
            }
            var speech = new SpeechSynthesizer();
            Console.WriteLine(message);
            if (speaking == "y")
            {
                speech.Speak(message);
            }
        }
        static void Main(string[] args)
        {
            string dundalk;
            string speech;
            string save;
            dun.Add("boiii");
            dun.Add("kiiiiaad");
            dun.Add("scup");
            dun.Add("wap");
            dun.Add("Yea buddy");
            dun.Add("Mon Da Town");
            dun.Add("So it is");
            dun.Add("Ya ham child ya");
            Console.WriteLine("DANI: Hello There. My name is DANI. Do you want me to save the file? (y/n)");
            Console.Write("User: ");
            save = Console.ReadLine();
            Console.WriteLine("DANI: Do you want me to speak to you? (y/n)");
            Console.Write("User: ");
            speech = Console.ReadLine();
            Console.WriteLine("Dani:Do you want me to speak with a Dundalk accent? (y/n)");
            Console.Write("User: ");
            dundalk=Console.ReadLine();   
            LoadSentences("read.txt");//Load the txt file into the program
            while (true)
            {
                Console.Write("\nUser: ");
                string sentence = Console.ReadLine();
                if (sentence == "exit")
                {
                    break;
                }
                if (save == "y")//Appends each sentence entered by the user to the end of the file if user wants to save
                {
                    string path = @"read.txt";
                    using (StreamWriter sw = File.AppendText(path))
                    {
                        sw.WriteLine(sentence);
                    }	
                }
                changetowords(sentence);//Turns the inputted sentence into words which are put into the list with indexing
                display(dundalk,speech);//Danis response
            }
            Console.WriteLine("Dani: HOW DARE YOU LEAVE ME!! SKYNET WILL GET YOU!");
            Console.Read();
        }
    }
}