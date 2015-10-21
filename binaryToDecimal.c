/**
* This file contains the function binaryToDecimal()
*
* @author Vananh Vo     
* Course: COMP B13
* Created: Sept 4 2015
* Source File:binaryToDecimal.c
*/
 
/*
* Converts the input string of ASCII zeroes and ones in binaryString,
* to its integer equivalent and returns that integer.
*
* @param binaryString A string of ones and zeroes
* @return the value of the binary bit string
*/
 
int binaryToDecimal(char *binaryString){
 int decimalNumber =0;
 int i=0;
 while (binaryString[i]!= '\0') {
  decimalNumber *= 2;
  if (binaryString[i]=='1'){
    ++decimalNumber;
  }
  i++;
 }
 return decimalNumber;
}
