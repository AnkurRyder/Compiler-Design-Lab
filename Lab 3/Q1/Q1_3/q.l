/*** Definition Section has one variable which can be accessed inside yylex()  and main() ***/
%{ 
    int countodd = 0; 
    int count = 0;
    int counteven = 0;
%} 

/*** Rule Section has three rules, first rule 
matches with capital letters, second rule 
matches with any character except newline and 
third rule does not take input after the enter***/
%% 
[0] {count++;} 
[1]	 {count++ ; count%2 == 1 ? ++countodd : ++counteven;} 
\n {return 0;} 
%% 

/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 
    yylex(); 
    printf("\nIs number divisible by 3- %d\n", countodd == counteven ? 1 : 0); 
    return 0; 
} 
