%{
#include <stdio.h>
#include "y.tab.h"
#include "lex.yy.c"

%}
%token NAME NUMBER
%%
statement: NAME '=' first_expression { printf("pretending to assign %s the value %d\n", $1, $3); }
| first_expression { printf("= %d\n", $1); }
;

first_expression: first_expression '+' second_expression { $$ = $1 + $3; printf ("Recognized '+' expression.\n");}
| first_expression '-' second_expression { $$ = $1 - $3; printf ("Recognized '-' expression.\n");}
| second_expression { $$ = $1; printf ("Recognized a number.\n");}
;

second_expression: second_expression '*' NUMBER { $$ = $1 * $3; printf ("Recognized '+' expression.\n");}
| second_expression '/' NUMBER { $$ = $1 / $3; printf ("Recognized '-' expression.\n");}
| NUMBER { $$ = $1; printf ("Recognized a number.\n");}
;

%%
int main (void) { return yyparse();}
int yyerror (char *msg) { return fprintf (stderr, "YACC: %s\n", msg); }
int yywrap(){ return 1; }