/*** Definition Section has one variable which can be accessed inside yylex()  and main() ***/
%{ 
    int count0 = 0; 
    int count1 = 0;
%} 

/*** Rule Section has three rules, first rule 
matches with capital letters, second rule 
matches with any character except newline and 
third rule does not take input after the enter***/
%% 
[0-9]   { printf("digit\n");} 
[0-9][0-9]+  {printf("digits\n");} 
[0-9]+.[0-9]+ {printf("Number\n");}
(main{1}) {printf("main function\n");} 
(if{1}) {printf("if\n");} 
(for{1}) {printf("for loop\n");} 
(while{1}) {printf("while loop\n");} 
(INT{1}|FLOAT{1}) {printf("data type\n");} 
(READ{1}|PRINT{1}) {printf("I/O\n");} 
[A-Za-z]   { printf("letter\n");}
[A-Za-z][A-Za-z|0-9]*  {printf("id\n");}
(>|>=|<|<=|=|<>) {printf("relop\n");}
\n {return 0;} 
%% 

/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 
    yylex(); 
    return 0; 
} 
