/*Programming assignment to create a program for a hangman game

Author:Ronan Dillon
Student Number: C12355251
06/11/2012
*/

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#define WORDLENG 5
#define AMOUNTLIVES 6
#define ALPHABET 10


main()
{
    
    char hello [WORDLENG]={'H','E','L','L','O'};
    char world [WORDLENG]={'W','O','R','L','D'};
    char sheep [WORDLENG]={'S','H','E','E','P'};
    char birds [WORDLENG]={'B','I','R','D','S'};
    char never [WORDLENG]={'S','H','O','E','S'};
    
    
    int menu;
    int randomword;
    int rightletters;
    char guess;
    int lives;
    int counter;
    int entered;
    int hulk;
    int exit;
    int TinkyWinky;
    int Dipsy;
    int LaLa;
    int Po;
    int TubbyCusterd;
    int noo_noo;
    
    do//This do loop is used at the end of the program if the user wants to replay the game
    {
        lives=AMOUNTLIVES;
        counter=0;
        char guessedalready[ALPHABET]={0};
        char word[WORDLENG]={0};
        char blank [WORDLENG]={'_','_','_','_','_'};
        rightletters=0;
        counter;
        printf("Choose an option\n [1] Play Game, [2] How to play Hangman Game , [3] Credits [Any Key] Quit Game \n\n");
        scanf("%d",&menu);
        
        switch(menu)//This switch is used when the user choose if they want to play, learn to play, see the credits or quit the game
        {
            case 1: //This case is used when the user presses 1 to play the game
            {
                printf("You have chosen to play game\n\n");
                srand((unsigned)time(NULL));
                randomword=rand()%5+1;          //This randomly chooses a number between 1 and 5 
                exit=1;
                break;
            }//End Of Case 1
            
            case 2:// This is used when the user presses 2 to learn how to play
            {
                printf("How To Play\n\n");
                printf("You will be asked to enter a guess \n");
                printf("When you enter a character it will be checked to see if it is in a secret word\n");
                printf("If the character you entered is in the word it is displayed on the screen\n");
                printf("If the character you entered is not in the word you lose a life\n");
                printf("If you guess all the letters in the word you win the game\n");
                printf("If you lose all your lives you lose the game\n");
                printf("Best of Luck! :)\n\n\n");
                exit=0;
                break;
            }//End of Case 2
            
            case 3: //This is used when the user enters 3 to see the credits
            {
                printf("--------------------------------------------\n");
                printf("| #  #   #   #   #  ###  #   #   #   #   # |\n");
                printf("| #  #  # #  ##  # #     ## ##  # #  ##  # |\n");
                printf("| #### ##### # # # #  ## # # # ##### # # # |\n");
                printf("| #  # #   # #  ## #   # #   # #   # #  ## |\n");
                printf("| #  # #   # #   #  ###  #   # #   # #   # |\n");
                printf("--------------------------------------------\n\n");
                
                printf("This hangman game was created by RonanDillon Enterprises\n\n");
                printf("Content Copyright of Users everything else Copyright © RonanIsALegend™ 1994-2012\n\n");
                exit=0;
                break;
            }//End of Case 3
                
            
            default://This is if the user presses any other key to exit the program
            {
                printf("Goodbye\n");
                flushall();
                getchar();
                return 0;
            }//End Of Default
            
        }//End Of Switch Statement
        if(exit!=0)
        {
        switch(randomword)//This is a switch statement choosing which character array will be used as the secret word 
        {
            case 1://Hello is the random word in this case
            {
                for(TinkyWinky=0;TinkyWinky<WORDLENG;TinkyWinky++)
                    {
                        word[TinkyWinky]=hello[TinkyWinky];
                    }//End of For
                
                while(lives!=0 && rightletters < WORDLENG )//This while loop will repeat until the user runs out of lives or guesses all the letters in the word
                {
                    
                    for(Dipsy=0;Dipsy<WORDLENG;Dipsy++)//This For Loop Prints out the underscores of the secret word with any characters that were guessd correctly
                    {
                        printf("%c,",blank[Dipsy]);
                    }//End of For
                    printf("\n\n");
                    
                    printf("Please enter a character that you think is in the word\n\n");
                    scanf("%1s",&guess);

                        guess = toupper (guess);//toupper changes the guess to upper case
                        printf("\n Your guess was %c\n\n",guess);
                        entered=0;
                    
                    
                    for(LaLa=0;LaLa<ALPHABET;LaLa++)//This For Loop is used to check if the guess entered is in the secret word
                    {
                        
                        if(guess==guessedalready[LaLa])
                        {
                            entered=1;
                        }//End If
                       
                    }//End of For Loop        
                        
                        if(entered==1)
                        {
                            printf("This has been guessed already!\n You have not been deducted any lives.\n\n");
                        }//End if
                        else
                        {
                            printf("This letter has not been entered before\n\n");
                            guessedalready[counter]=guess;
                            counter=counter+1;
                            entered=0;
                        }//End Else
                    
                    
                    if(entered==0)
                    {
                        hulk=0;
                        for(Po=0;Po<WORDLENG;Po++)//This For Loop is used to put the guessed character into the underscore array if it is correct
                        {
                            if(guess==hello[Po])
                            {
                                blank[Po]=guess;
                                hulk=hulk+1;
                                rightletters++;
                            }//End of if
                            
                        }//End of For Loop
                        
                        if(hulk>0)
                        {
                            printf("You have found a letter in the word\n You have %d lives left",lives);
                        }//End If
                        else
                        {
                            lives=lives-1;
                            printf("The letter you have entered is not in the word. \nYou lose a life. \nYou now have %d lives remaining\n\n",lives);
                        }//End Elso
                    }//End of If
                    
                    
                   
                        
                     
                    
                }//End of While Loop
                break;
            }//End of Case 1
            
            case 2://World is the random word in this case
            {
                 for(TinkyWinky=0;TinkyWinky<WORDLENG;TinkyWinky++)
                    {
                        word[TinkyWinky]=world[TinkyWinky];
                    }//End of For
                
                while(lives!=0 && rightletters < WORDLENG )
                {
                    
                    for(Dipsy=0;Dipsy<WORDLENG;Dipsy++)
                    {
                        printf("%c,",blank[Dipsy]);
                    }//End For
                    printf("\n\n");
                    
                    printf("Please enter a guess\n\n");
                    scanf("%1s",&guess);
                    guess = toupper (guess);
                    printf("%c\n\n",guess);
                    entered=0;
                    
                    
                    for(LaLa=0;LaLa<ALPHABET;LaLa++)//This For Loop is used to check if the guess entered is in the secret word
                    {
                        if(guess==guessedalready[LaLa])
                        {
                            entered=1;
                        }//End if
                            
                    }//End of For Loop
                    
                        if(entered==1)
                        {
                            printf("This has been guessed already! \nYou have not been deducted any lives.\n\n");
                        }//End If
                        else
                        {
                            printf("This letter has not been entered before\n\n");
                            guessedalready[counter]=guess;
                            counter=counter+1;
                            entered=0;
                        }//End Else
                    
                    
                    if(entered==0)
                    {
                        hulk=0;
                        for(Po=0;Po<WORDLENG;Po++)//This For Loop is used to put the guessed character into the underscore array if it is correct
                        {
                            if(guess==world[Po])
                            {
                                blank[Po]=guess;
                                hulk=hulk+1;
                                rightletters++;
                            }//End of if
                            
                        }//End of For Loop
                        
                        if(hulk>0)
                        {
                            printf("You have found a letter in the word\n");
                        }//End else
                        else
                        {
                            lives=lives-1;
                            printf("The letter you have entered is not in the word. \nYou lose a life. \nYou now have %d lives remaining\n\n",lives);
                        }//End Else
                    }//End of If
                    
                    
                    
                        
                        
                     
                    
                }//End of While Loop
                break;
            }//End of Case 2
            
            case 3://Sheep is the word in this case
            {
                 for(TinkyWinky=0;TinkyWinky<WORDLENG;TinkyWinky++)
                    {
                        word[TinkyWinky]=sheep[TinkyWinky];
                    }//End of For
                
                while(lives!=0 && rightletters < WORDLENG )
                {
                    
                    for(Dipsy=0;Dipsy<WORDLENG;Dipsy++)
                    {
                        printf("%c,",blank[Dipsy]);
                    }
                    printf("\n\n");
                    
                    printf("Please enter a guess\n\n");
                    scanf("%1s",&guess);
                    guess = toupper (guess);
                    printf("%c\n\n",guess);
                    entered=0;
                    
                    for(LaLa=0;LaLa<ALPHABET;LaLa++)//This For Loop is used to check if the guess entered is in the secret word
                    {
                        if(guess==guessedalready[LaLa])
                        {
                            entered=1;
                        }
                        
                    }//End of For Loop    
                           
                    
                        if(entered==1)
                        {
                            printf("This has been guessed already! \nYou have not been deducted any lives.\n\n");
                        }
                        else
                        {
                            printf("This letter has not been entered before\n\n");
                             guessedalready[counter]=guess;
                            counter++;
                            entered=0;
                        }
                    
                    if(entered==0)
                    {
                        hulk=0;
                        for(Po=0;Po<WORDLENG;Po++)
                        {
                            if(guess==sheep[Po])
                            {
                                blank[Po]=guess;
                                hulk=hulk+1;
                                rightletters++;
                            }//End of if
                            
                        }//End of For Loop
                        
                        if(hulk>0)
                        {
                            printf("You have found a letter in the word\n");
                        }
                        else
                        {
                            lives=lives-1;
                            printf("The letter you have entered is not in the word. \nYou lose a life. \nYou now have %d lives remaining\n\n",lives);
                        }
                    }//End of If
                    
                    
                    
                        
                        
                     
                    
                }//End of While Loop
                break;
            }//End of Case 3
            
            case 4://Birds is the secret word in this case
            {
                
                for(TinkyWinky=0;TinkyWinky<WORDLENG;TinkyWinky++)
                    {
                        word[TinkyWinky]=birds[TinkyWinky];
                    }//End of For Loop
                
                while(lives!=0 && rightletters < WORDLENG )
                {
                    
                    for(Dipsy=0;Dipsy<WORDLENG;Dipsy++)
                    {
                        printf("%c,",blank[Dipsy]);
                    }//End of For Loop
                    printf("\n\n");
                    
                    printf("Please enter a guess\n\n");
                    scanf("%1s",&guess);
                    guess = toupper (guess);
                    printf("%c\n\n",guess);
                    entered=0;
                    
                    
                    for(LaLa=0;LaLa<ALPHABET;LaLa++)//This For Loop is used to check if the guess entered is in the secret word
                    {
                        if(guess==guessedalready[LaLa])
                        {
                            entered=1;
                        }
                        
                    }//End of For Loop    
                            
                    
                        if(entered==1)
                        {
                            printf("This has been guessed already! \nYou have not been deducted any lives.\n\n");
                        }
                        else
                        {
                            printf("This letter has not been entered before\n\n");
                            guessedalready[counter]=guess;
                            counter=counter+1;
                            entered=0;
                        }
                    
                    if(entered==0)
                    {
                        hulk=0;
                        for(Po=0;Po<WORDLENG;Po++)
                        {
                            if(guess==birds[Po])
                            {
                                blank[Po]=guess;
                                hulk=hulk+1;
                                rightletters++;
                            }//End of if
                            
                        }//End of For Loop
                        
                        if(hulk>0)
                        {
                            printf("You have found a letter in the word\n");
                        }
                        else
                        {
                            lives=lives-1;
                            printf("The letter you have entered is not in the word. \nYou lose a life. \nYou now have %d lives remaining\n\n",lives);
                        }
                    }//End of If
                    
                    
                    
                        
                        
                     
                    
                }//End of While Loop
                break;
            }//End of case 4
            
            case 5://Never is the secret word in this case
            {
                for(TinkyWinky=0;TinkyWinky<WORDLENG;TinkyWinky++)
                    {
                        word[TinkyWinky]=never[TinkyWinky];
                    }//End of For
                
                while(lives!=0 && rightletters < WORDLENG )
                {
                    
                    for(Dipsy=0;Dipsy<WORDLENG;Dipsy++)
                    {
                        printf("%c,",blank[Dipsy]);
                    }
                    printf("\n\n");
                    
                    printf("Please enter a guess\n\n");
                    scanf("%1s",&guess);
                    guess = toupper (guess);
                    printf("%c\n\n",guess);
                    entered=0;
                     
                    
                    for(LaLa=0;LaLa<ALPHABET;LaLa++)//This For Loop is used to check if the guess entered is in the secret word
                    {
                        if(guess==guessedalready[LaLa])
                        {
                            entered=1;
                        }
                            
                    }//End of For Loop
                    
                    if(entered==1)
                        {
                            printf("This has been guessed already! \nYou have not been deducted any lives.\n\n");
                            
                        }
                    else
                        {
                            printf("This letter has not been entered before\n\n");
                            guessedalready[counter]=guess;
                            counter=counter+1;
                            entered=0;
                            
                        }
                    
                    if(entered==0)
                    {
                        hulk=0;
                        for(Po=0;Po<WORDLENG;Po++)
                        {
                            if(guess==never[Po])
                            {
                                blank[Po]=guess;
                                hulk=hulk+1;
                                rightletters++;
                            }//End of if
                            
                        }//End of For Loop
                    }//End outer if
                        
                        if(hulk>0)
                        {
                            printf("You have found a letter in the word\n");
                        }
                        else
                        {
                            lives=lives-1;
                            printf("The letter you have entered is not in the word. \nYou lose a life. \nYou now have %d lives remaining\n\n",lives);
                        }//End of If
                    
                    
                    
                        
                        
                     
                    
                }//End of While Loop
                break;
            }//End of case 5
        
            
        }//End of Switch
        
        if(lives==0)
        {
            printf("Sorry you have run out of lives and you have lost the game :(\n");
            printf("The word was\n");
            for(TubbyCusterd=0;TubbyCusterd<WORDLENG;TubbyCusterd++)
            {
                printf("%c",word[TubbyCusterd]);
            }
            printf("\n\n");
        }
        else if(rightletters==WORDLENG)
        {
            printf("Congratulations you have beaten the hangman game :)\n");
            printf("The word was\n");
            for(TubbyCusterd=0;TubbyCusterd<WORDLENG;TubbyCusterd++)
            {
                printf("%c",word[TubbyCusterd]);
            }
            printf("\n\n");
        }
        
        
        if(lives==0 || rightletters==WORDLENG)
        {
            printf("If you want to go back to the main menu hit 0 \n hit any key to quit\n");
            scanf("%d",&exit);
        }
        
        }//End of If Statement
    }//End Of Do-While
    while(exit==0);
}//End of Main...............A-65-122z