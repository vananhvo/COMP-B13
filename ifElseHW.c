int main (int argc, char **argv){
	int argument1 = atoi(argv[0]);
	if (argument1 == 4){
		argument1 = argument1 + 20;
	} else if (argument1 <= 6 || argument1 > 9){
		if (argument1 != 0){
			if (argument1 != -1){
				argument1 = 99;
			}else{
				argument1 = 44;
			}
		}
	}
	printf("%d",argument1);
	return 0;
}
