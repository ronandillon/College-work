#include<stdio.h>
#include<stdlib.h>
#include<string.h>


typedef struct 
{
    char id;
    int num;
    char *firstname;
    char *surname;
    char *course;
}colleges;
colleges TUD[20],DIT[10],ITB[5],ITT[5];

main()
{
    
    DIT[0].id ='D';
    DIT[0].num= 12355251;
    DIT[0].firstname="Ronan";
    DIT[0].surname="Dillon";
    DIT[0].course="Computers";
    
    DIT[1].id= 'D';
    DIT[1].num= 12355253;
    DIT[1].firstname="Paul";
    DIT[1].surname="Potts";
    DIT[1].course="Drama";
    
    DIT[2].id= 'D';
    DIT[2].num= 12355256;
    DIT[2].firstname="Sean";
    DIT[2].surname="Finn";
    DIT[2].course="Science";
    
    DIT[3].id= 'D';
    DIT[3].num= 12355257;
    DIT[3].firstname="Gerry";
    DIT[3].surname="Maguire";
    DIT[3].course="English";
    
    DIT[4].id= 'D';
    DIT[4].num= 12355260;
    DIT[4].firstname="Gemma";
    DIT[4].surname="Dillon";
    DIT[4].course="Biology";
    
    DIT[5].id= 'D';
    DIT[5].num= 12355264;
    DIT[5].firstname="Harry";
    DIT[5].surname="Lynn";
    DIT[5].course="French";
    
    DIT[6].id= 'D';
    DIT[6].num= 12355268;
    DIT[6].firstname="John";
    DIT[6].surname="Joe";
    DIT[6].course="Computers";
    
    DIT[7].id= 'D';
    DIT[7].num= 12355269;
    DIT[7].firstname="Billy";
    DIT[7].surname="Bob";
    DIT[7].course="Arts";
    
    DIT[8].id= 'D';
    DIT[8].num= 12355271;
    DIT[8].firstname="Shauna";
    DIT[8].surname="Carr";
    DIT[8].course="Drama";
    
    DIT[9].id= 'D';
    DIT[9].num= 12355273;
    DIT[9].firstname="Paraic";
    DIT[9].surname="McKeever";
    DIT[9].course="Science";
    
    ITT[0].id= 'T';
    ITT[0].num= 12355255;
    ITT[0].firstname="Francis";
    ITT[0].surname="Reilly";
    ITT[0].course="Irish";

    ITT[1].id= 'T';
    ITT[1].num= 12355261;
    ITT[1].firstname="Jimmy";
    ITT[1].surname="Stevens";
    ITT[1].course="Religion";
    
    ITT[2].id= 'T';
    ITT[2].num= 12355270;
    ITT[2].firstname="Paulo";
    ITT[2].surname="Frate";
    ITT[2].course="Business";
    
    ITT[3].id= 'T';
    ITT[3].num= 12355274;
    ITT[3].firstname="Alexia";
    ITT[3].surname="Granger";
    ITT[3].course="Marketing";
    
    ITT[4].id= 'T';
    ITT[4].num= 12355275;
    ITT[4].firstname="Louis";
    ITT[4].surname="Oosteheisen";
    ITT[4].course="Science";
    
    ITB[0].id= 'B';
    ITB[0].num= 12355252;
    ITB[0].firstname="William";
    ITB[0].surname="Wonker";
    ITB[0].course="Science";
    
    ITB[1].id= 'B';
    ITB[1].num= 12355259;
    ITB[1].firstname="Andrew";
    ITB[1].surname="Kilkenny";
    ITB[1].course="Chemistry";
    
    ITB[2].id= 'B';
    ITB[2].num= 12355265;
    ITB[2].firstname="Daniel";
    ITB[2].surname="Keating";
    ITB[2].course="Arts";
    
    ITB[3].id= 'B';
    ITB[3].num= 12355267;
    ITB[3].firstname="Adam";
    ITB[3].surname="Hill";
    ITB[3].course="Maths";
    
    ITB[4].id= 'B';
    ITB[4].num= 12355272;
    ITB[4].firstname="Sean";
    ITB[4].surname="Maloney";
    ITB[4].course="Science";
    
    int a=0;
    int b=0;
    int c=0;
    int d=0;
    int max=20;
    while(d != max)
    {
        if( (a != 9) && (b != 5) && (c != 5) ) 
        {
            if( ( (DIT[a].num) < (ITB[b].num) ) &&( (DIT[a].num) < (ITT[c].num) ) )
            {   
                TUD[d] = DIT[a];
                d++;
                a++;
            }
            else if ( (ITB[b].num < DIT[a].num) && (ITB[b].num < ITT[c].num) )
            {
                TUD[d] = ITB[b];
                d++;
                b++;
            }
            else
            {
                TUD[d] = ITT[c];
                d++;
                c++;
            }
        }
         if(a >= 9 && b <= 9 && c <= 9 )
        {
            if(ITB[b].num < ITT[c].num)
            {
                TUD[d] = ITB[b];
                d++;
                b++;
            }
            else
            {
                TUD[d] = ITT[c];
                d++;
                c++;
            }  
        }
        if(a <= 9 && b >= 9 && c <= 9)
        {
            if(DIT[a].num < ITT[c].num)
            {
                TUD[d] = DIT[a];
                d++;
                a++;
            }
            else
            {
                TUD[d] = ITT[c];
                d++;
                c++;
            }  
        }
        if(a <= 9 && b <= 9 && c >= 9)
        {
            if(DIT[a].num < ITB[b].num)
            {
                TUD[d] = DIT[a];
                d++;
                a++;
            }
            else 
            {
                TUD[d] = ITB[b];
                d++;
                b++;
            }  
        }
        if(a <=9 && b == 10 && c == 10)
        {
            TUD[d] = DIT[a];
            d++;
            a++;
        }
        if(a == 10 && b == 10 && c <= 9)
        {
            TUD[d] = ITT[c];
            d++;
            c++;
        }
        if(a == 10 && b<=9 && c == 10)
        {
            TUD[d] = ITB[b];
            d++;
            b++;
        }
        
        
    }
    for(int e=0; e<20; e++)
    {
        printf("%c %d \n",TUD[e].id,TUD[e].num);
    }
    flushall();
    getchar();
}
    