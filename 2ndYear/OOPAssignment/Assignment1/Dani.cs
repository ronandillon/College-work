using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment1
{
    public class Dani
    {
        private string word;
        public string Word
        {
            get { return word; }
            set { word = value; }
        }
        private int num;
        public int Num
        {
            get { return num; }
            set { num = value; }
        }
        private List<int> next_word = new List<int>();
        public List<int> Next_word
        {
            get { return next_word; }
            set { next_word = value; }
        }
        public Dani(string word, int num)
        {
            this.word=word;
            next_word.Add(num);
        }
        public override string ToString()
        {
            return " " + word;
        }  
    }
}
