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
[0] { count0++;} 
[1]	 {count1++;} 
\n {return 0;} 
%% 

/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 
    yylex(); 
    printf("\nIs number of ones equal to number of zeroes- %d\n", count0 == count1 ? 1 : 0); 
    return 0; 
} 
