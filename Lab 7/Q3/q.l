%{
    #include <stdlib.h>
    #include <stdio.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

%%

    /* variables */
[a-z]       {
                yylval = *yytext - 'a';
                return VARIABLE;
            }

    /* integers */
[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }

    /* operators */
[-+()=/*\n] { return *yytext; }

    /* skip whitespace */
[ \t]        ;

    /* anything else is an error */
.               yyerror("invalid character");

%%

int yywrap(void) {
    return 1;
}