/*
*	This program mirrors the structure of "loopHW.s"
*	@author: Vananh Vo
*	Course: COMP B13 (FALL 2015)
*	Professor: Harold Mendoza
*	Source: loopHW.s
*/
#include <stdio.h>
int main (int argc, char **argv){
	int inNum1 = atoi(argv[1]);
	int inNum2 = atoi(argv[2]);
	int outNum = inNum1;
	while(outNum <= inNum2){
		printf("%d",outNum);
		outNum = outNum + outNum;
	}
	return 0;
}
