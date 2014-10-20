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
colleges TUD[9],DIT[10],ITB[5],ITT[5];

main()
{
    TUD[0].id ='D';
    TUD[0].num= 12355251;
    TUD[0].firstname="Ronan";
    TUD[0].surname="Dillon";
    TUD[0].course="Computers";
    
    TUD[1].id= 'D';
    TUD[1].num= 12355253;
    TUD[1].firstname="Paul";
    TUD[1].surname="Potts";
    TUD[1].course="Drama";
    
    TUD[2].id= 'D';
    TUD[2].num= 12355256;
    TUD[2].firstname="Sean";
    TUD[2].surname="Finn";
    TUD[2].course="Science";
    
    TUD[3].id= 'D';
    TUD[3].num= 12355257;
    TUD[3].firstname="Gerry";
    TUD[3].surname="Maguire";
    TUD[3].course="English";
    
    TUD[4].id= 'D';
    TUD[4].num= 12355260;
    TUD[4].firstname="Gemma";
    TUD[4].surname="Dillon";
    TUD[4].course="Biology";
    
    TUD[5].id= 'D';
    TUD[5].num= 12355264;
    TUD[5].firstname="Harry";
    TUD[5].surname="Lynn";
    TUD[5].course="French";
    
    TUD[6].id= 'D';
    TUD[6].num= 12355268;
    TUD[6].firstname="John";
    TUD[6].surname="Joe";
    TUD[6].course="Computers";
    
    TUD[7].id= 'D';
    TUD[7].num= 12355269;
    TUD[7].firstname="Billy";
    TUD[7].surname="Bob";
    TUD[7].course="Arts";
    
    TUD[8].id= 'D';
    TUD[8].num= 12355271;
    TUD[8].firstname="Shauna";
    TUD[8].surname="Carr";
    TUD[8].course="Drama";
    
    TUD[9].id= 'D';
    TUD[9].num= 12355273;
    TUD[9].firstname="Paraic";
    TUD[9].surname="McKeever";
    TUD[9].course="Science";
    
    int search;
    int max=9;
    int min=0;
    int mid;
    int end=0;
    
    printf("Enter the number of the student you want to search for.");
    scanf("%d",&search);
    while(end==0)
    {
        mid=(max+min)/2;
        
        if(TUD[mid].num == search)
        {
            printf("We found the student\n");
            printf("%c%d\n%s,%s\n%s",TUD[mid].id,TUD[mid].num,TUD[mid].firstname,TUD[mid].surname,TUD[mid].course);
            end=1;
        }
        if(search>= TUD[mid].num)
        {        
            min = mid;
        }
        else 
        {
            max=mid;
        }
    }
    flushall();
    getchar();
}