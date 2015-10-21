/**
* This program reads up to 32 zeroes and ones and outputs the
* decimal equivalent.
*
* @author Vananh Vo
* Course: COMP B13
* Created: Sept 4 2015
* Source File:binaryToDecimalMain.c
*/
#include <stdio.h>
int binaryToDecimal(char *binaryString);
int main(){
    char binaryString[33];
    int decimalNum;
    printf("Please enter a binary string: ");
    scanf("%32s", binaryString);
    decimalNum = binaryToDecimal(binaryString);
    printf("%d\n", decimalNum);
    return 0;
}
