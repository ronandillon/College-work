#include<stdio.h>
#include<string.h>
#include<stdlib.h>

struct colleges
{
    char id;
    int num;
    char firstname[20];
    char surname[20];
    char course[20];
};
struct colleges DIT,ITB,ITT,TUD;

main()
{
   
    FILE *colleges;
    colleges=fopen("colleges.dat","wb+");
    for(int i=0; i<10; i++)
    {
        DIT.id='D';
        printf("\nDIT student: \n ID number:");
        scanf("%d",&DIT.num);
        
        printf("\nFirstname:");
        scanf("%s",DIT.firstname);
        printf("\nSurname: ");
        scanf("%s",DIT.surname);
        printf("\nCourse: ");
        scanf("%s",DIT.course);
    }
     for(int i=0; i<5; i++)
    {
        ITB.id='B';
        printf("\nITB student: \n ID number:");
        scanf("%d",&ITB.num);
        printf("\nFirstname:");
        scanf("%s",ITB.firstname);
        printf("\nSurname: ");
        scanf("%s",ITB.surname);
        printf("\nCourse: ");
        scanf("%s",ITB.course);
    }
     for(int i=0; i<5; i++)
    {
        ITT.id='T';
        printf("\nITT student: \n ID number:");
        scanf("%d",ITT.num);
        printf("\nFirstname:");
        scanf("%s",ITT.firstname);
        printf("\nSurname: ");
        scanf("%s",ITT.surname);
        printf("\nCourse: ");
        scanf("%s",ITT.course);
    }
    fclose(colleges);
}