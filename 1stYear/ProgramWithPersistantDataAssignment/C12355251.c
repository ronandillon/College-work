#include<stdio.h>
#include<stdlib.h>
#include<string.h>

//Declare Function Prototypes
void header(void);
void add(void);
void erase(void);
void list(void);
void compact(void);

//Declare Structures

struct employee //Employee Details
{
    char id[7];
    char surname[30];
    char firstname[10];
    char employed[10];
    char sector[10];
};

struct employee emp;
    
struct header //Header File
{
    int records;
    int deletedrecords;
    char filler[20];
};
struct header HEAD;

main()
{
    header();
    int menu;
    int exit=0;
    char addagain,deleteagain;
    
    while(exit==0)
    {
        system("cls");
        printf("---------------------MENU---------------------"); 
        printf("\n 1) Add Employee");
        printf("\n 2) Delete Employee");
        printf("\n 3) List Employees");
        printf("\n 4) Compact List");
        printf("\n 5) Exit Database\n");
        scanf("%d",&menu);
        
        switch(menu)
        {
            
            case 1://Case 1 is entered when the user has entered 1 at the main menu to add an employee
            {
                do
                {
                    system("cls");
                    printf("-------------------ADD EMPLOYEE-----------------\n");
                    printf("You have chosen to add an employee\n");
                    add();
                    printf("Would you like to add another employee? (y/n)\n");
                    scanf("%1s",&addagain);
                }
                while(addagain=='y');
                break;
            }
            case 2://Case 2 is entered when the user entered 2 at the main menu to delete an employee
            {
                do
                {
                    system("cls");
                    printf("-------------------DELETE EMPLOYEE---------------------\n");
                    printf("You have chosen to delete an employee\n");
                    erase();
                    printf("Would you like to delete another employee? (y/n) \n");
                    scanf("%1s",&deleteagain);
                }
                while(deleteagain=='y');
                break;
            }
            case 3://Case 3 is entered when the user entered 2 at the main menu to list all the employees
            {
                system("cls");
                printf("----------------------LIST EMPLOYEES---------------------\n");
                printf("You have chosen to list the employees\n");
                printf("The employees working in the company at the moment are\n");
                list();
                flushall();
                getchar();
                break;
            }
            case 4://Case 4 is entered when the user entered 4 at the main menu to compact the records
            {
                system("cls");
                printf("------------------Compact Database-------------------\n");
                compact();
                printf("\nThe list has now been compacted\n");
                flushall();
                getchar();
                break;
            }
            case 5://Case 5 is entered when the user entered 5 at the main menu to exit the program
            {
                system("cls");
                printf("--------------------Exit----------------------\n");
                printf("\nYou have chosen to exit the database\n\n\n");
                printf("Goodbye!");
                flushall();
                getchar();
                return 0;
            }
            default://The default case is entered when the user enters an invalid entry 
            {
                system("cls");
                printf("*************ERROR**************");
                printf("You have entered an invalid entry\n");
                printf("You will be sent back to the home screen\n");
                flushall();
                getchar();
                break;
            }
            
        
        }//End switch
    
    }//End While
    
}//End Main


/*
Function
Name:header
Purpose: To take count of how many records are in the database and how many deleted files are in the database
*/
void header(void)
{
    FILE *database;
    database=fopen("employees.dat","ab+");//Opens database in ab+ mode. This means append binary mode.
    
    while(fread(&emp, sizeof(emp), 1, database)==1)//Reads through the database until there are no more records to read
    {
        HEAD.records++;//Increments records
        
        if(emp.id[0] == '*')//If the file is a deleted file
        {
            HEAD.deletedrecords++;//Increments deleted records
        }
    }
    fclose(database);//Close file
}


/*
Function
Name: add
Purpose: To add an employee to the database 
*/
void add()
{
    FILE *database;
    char id_found = 'n';
    char test_id[13];
    database = fopen("employees.dat", "ab+");//Opens file in ab+ mode or append binary mode
    

    do
    {
        printf("\n Enter the employees ID:"); 
        scanf("%s", test_id);
        fflush(stdin);
        id_found = 'n';
        fseek(database, 0, SEEK_SET);//Offsets to the beginning of the databse
        
        while(fread(&emp, sizeof(emp), 1, database) == 1)//Reads through all of the current employees in the database
        {
            if(strcmp(emp.id, test_id) == 0)//Checks to see if the entered id has already been entered
            {
                id_found = 'y';
                fseek(database, 0, SEEK_END);//Offsets to the end of the database
                printf("\n The ID you have entered already belongs to an employee in the database, please try again \n");
            }
        }
    }while(id_found == 'y');
    
    strcpy(emp.id, test_id);
    printf("\n Enter employees surname:");
    scanf("%s", emp.surname);
    fflush(stdin);
    printf("\n Enter employees firstname:");
    scanf("%s", emp.firstname);
    fflush(stdin);
    printf("\n Enter the number of years the employee has working for the company:");
    scanf("%s", &emp.employed);
    fflush(stdin);
    printf("\n Enter the sector the employee works in:");
    scanf("%s", &emp.sector);
    fflush(stdin);
    fwrite(&emp, sizeof(emp), 1, database);
    fflush(stdin);
    HEAD.records = HEAD.records+1;
    
    
    fclose(database);//Close file
}//End add

/*
Function
Name: erase
Purpose: To delete an employee from the database
*/
void erase()
{
    FILE *database;
    database = fopen("employees.dat", "rb+");//Opens file with mode rb+ mode. This is read binary mode
    
    char asterisk = '*';
    char id_matched = 'n';
    char del_id[13];
    char certain;
    long int RECSIZE;
    int end=0;
    RECSIZE = sizeof(emp);
    
    if(database == NULL)
    {
        printf("Error in opening file");
    }

    while(end!=1)
    {
        printf("\n Enter ID that you want to be deleted:");
        scanf("%s",del_id);
        fflush(stdin);
        
        fseek(database,0,SEEK_SET);//Offset is measured to the start if the database
        
        while(fread(&emp, sizeof(emp), 1, database) == 1)//Reads through all of the current employees in the database
        {
            if(strcmp(emp.id, del_id) == 0)//Checks to see if the id you entered is actually an employee in the database
            {
                printf("Are you sure you want to delete %s %s from the database? (y/n)\n",emp.firstname,emp.surname);
                scanf("%1s",&certain);
                
                if(certain=='y')//Checks to see if the employee record that the user wants to delete is the right one
                {
                    fseek(database, -RECSIZE, SEEK_CUR);//Offset is measured to the current position
                    fwrite(&asterisk,1,1, database);//Puts an asterix in the first character of the id
                    fseek(database, 0, SEEK_END);//Offsets to the end of the database
                    printf("\n Record was successfully deleted! \n");
                    id_matched = 'y';
                    HEAD.deletedrecords++;
                    end=1;
                }
                else
                {
                    end=0;
                    id_matched ='y';
                }
            }
        }
        
        if(id_matched == 'n')
        {
            printf("\n Record was not found!");
            end=0;
        }
    }
    fclose(database);//Close file
}//End of erase


/*
Function
Name: list
Purpose: Lists the employees in the database
*/
void list()
{
    FILE *database;
    database = fopen("employees.dat", "rb");//Opens file in rb mode. This is read binary mode
    
    while(fread(&emp, sizeof(emp), 1, database)==1)//Reads through all of the current employees in the database
    {
        if(emp.id[0] != '*')//If the file isnt a deleted file
        {
        
            printf("\nThe employees ID: %s",emp.id);
            printf("\n The Employees name: %s , %s",emp.surname,emp.firstname);
            printf("\n Enter the number of years the employee has working for the company: %s",emp.employed);
            printf("\n Enter the sector the employee works in: %s\n\n", emp.sector);
        }
    }
    printf("Records in the database: %d \t Records that have been deleted: %d\n ",HEAD.records,HEAD.deletedrecords);
    
    fclose(database);//Close the file
    
}//End function list

/*
Function
Name:compact
Purpose:To compact the database getting rid of all of the deleted files
*/
void compact()
{
    
    FILE *database, *tempdatabase;
    
    database = fopen("employees.dat", "rb+");//Opens the database in rb+ mode. This is read binary mode.
    tempdatabase = fopen("tempemployees.dat", "wb+");//Opens the temporary database in wb+ mode. This is write binary mode.
    
    HEAD.records = 0;
    HEAD.deletedrecords = 0;
    
    while(fread(&emp, sizeof(emp), 1, database) == 1)//Reads through the records in the file
    {
        if(emp.id[0] != '*')//If the file isnt a deleted file
        {
            fwrite(&emp, sizeof(emp), 1, tempdatabase);//Writes the record into the temp database
        }//End if
    }
    
    fclose(database);//Close database
    fclose(tempdatabase);//Close temp database
    
    database=fopen("employees.dat","wb+");//Opens database in write binary mode
    tempdatabase=fopen("tempemployees.dat","rb+");//Open temp database in read binary mode
    
    while(fread(&emp, sizeof(emp),1,tempdatabase)==1)//Reads through the records in the file
    {-
        fwrite(&emp,sizeof(emp),1,database);//Writes the file from the temp database and overwrites
        HEAD.records++;
    }
    fclose(database);
    fclose(tempdatabase);

    
}//End of function compact