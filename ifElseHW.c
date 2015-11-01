/*
*	This program mirrors the structure of "ifElseHW.s"
*	@author: Vananh Vo
*	Course: COMP B13 (FALL 2015)
*	Professor: Halrold Mendoza
*	Source: ifElseHW.c
*/
#include <stdio.h>
int main (int argc, char **argv){
	int argument1 = atoi(argv[1]);
	if (argument1-4 == 0 || (argument1 <= 6  || argument1 < 10)){
		argument1 = 20;
	} else if(argument1 == 0){
		argument1 = 44;
	} else if (argument1 == -1){
		argument1 = -44;		
	} else {
		argument1 = 99;
	}
	printf("%d",argument1);
	return 0;
}
