%{ 
/* Definition section */
    #include "q.tab.h" 
%} 

/* Rule Section */
%% 
and {return AND;}
:= {return ASSIGN;}
: {return COLON;}
, {return COMMA;}
def {return DEF;}
{.} {return DOT;}
else {return ELSE;}
end {return END;}
= {return EQ;}
exit {return EXITLOOP;}
float {return FLOAT;}
from {return FROM;}
fun {return FUN;}
>= {return GE;}
global {return GLOBAL;}
> {return GT;}
> {return ID;} // id
if {return IF;}
int {return INT;}
( {return LEFT_PAREN;}
[ {return LEFT_SQ_BQ;}
<= {return LE;}
< {return LT;}
- {return MINUS;}
mod {return MOD;}
* {return MULT;}
<> {return NE;}
not {return NOT;}
null {return NUL;}
or  {return OR;}
+ {return PLUS;}
print {return PRINT;}
product {return PRODUCT;}
read {return READ;}
return {return RETURN;}
-> {return RETURNS;}
) {return RIGHT_PAREN;}
] {return RIGHT_SQ_BQ ;}
; {return SEMICOLON;}
skip {return SKIP;}
step {return STEP;}
to {return TO;} 
while {return WHILE;}

\n {return NL;} 
. {return yytext[0];} 
%% 

int yywrap() 
{ 
    return 1; 
} 
