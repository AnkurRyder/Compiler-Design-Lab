%{ 
#include<stdio.h>
#include<string.h>

void check(char *str);
%} 

%% 
"id"|"+"|"("|")"|"*"|"-"					{fprintf(yyout,"%s\n",yytext);}
%% 

int yywrap() {}  

int main(int argc, char*argv[]) 
{ 
    extern FILE *yyin, *yyout;

    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

	yylex(); 
	return 0; 
}