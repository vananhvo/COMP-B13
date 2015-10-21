/**
* This program compare two strings if they have matching character,
* and then it stores the character(s) into the new string.
* @author: Vananh Vo
* Course: COMP B13
* Date: Oct 5th, 2015
* Source: MatchingChars.c
*/
int findMatchingChars (char *string1, char *string2, char *outString){
    int matchCharacters = 0;
    while (*string1 && *string2){
        if (*string1 == *string2){
            outString[matchCharacters++] = *string1;
        }
        ++string1;
        ++string2;
    }   
    outString[matchCharacters] = 0;
    return matchCharacters;
}
