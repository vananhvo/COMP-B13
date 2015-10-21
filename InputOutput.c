/**
* @author Vananh Vo
* Course: COMP B13
* Created:Sept 1, 2015
* Source File: InputOutput.c
*/
 
#define BUFFER_SIZE 81
#include <stdio.h>
/*
* Reads a maximum of bufferSize-1 characters into string
*@param string pointer to string buffer
*@param bufferSize the capacity of string in bytes
*/
 
void readChars(char string[], int bufferSize){
    char formatString [80];
        sprintf(formatString, "%%%ds", bufferSize - 1);
         
        scanf(formatString, string);
    
}
/*
* Reads a maximum of bufferSize-1 characters into string
* @param string pointer to string buffer
*/
 
void writeChars(char string[]){
    int numChars = 0;
    while(string[numChars])
        putchar(string[numChars++]);
}
