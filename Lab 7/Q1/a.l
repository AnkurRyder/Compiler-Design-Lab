%{ 
/* Declaration or Definition section */
    #include "y.tab.h" 
    #include <stdio.h>
    #include <string.h> 	
%} 

/* Rule Section */
%% 
[ \n\t]+ 	{fprintf(yyout, "");} 
("and")		{return AND;}
(":=")		{return ASSIGN;}
(":") 		{return COLON;}
(",") 		{return COMMA;}
("def")		{return DEF;}
(".") 		{return DOT;}
("else")	{return ELSE;}
("%d","%f","%s") {return FORMAT;}
("end")		{return END;}
("=") 		{return EQ;}
("exit")	{return EXITLOOP;}
("float")	{return FLOAT;}
("from") 	{return FROM;}
("fun") 	{return FUN;}
(">=") 		{return GE;}
("global") 	{return GLOBAL;}
(">") 		{return GT;}
("if") 		{return IF;}
("int") 	{return INT;}
("(") 		{return LEFT_PAREN;}
("[") 		{return LEFT_SQ_BQ;}
("<=") 		{return LE;}
("<") 		{return LT;}
("-") 		{return MINUS;}
("mod") 	{return MOD;}
("*") 		{return MULT;}
("/")		{return DIV;}
("<>") 		{return NE;}
("not") 	{return NOT;}
("null") 	{return NUL;}
("or")  	{return OR;}
("+") 		{return PLUS;}
("print")	{return PRINT;}
("product")	{return PRODUCT;}
("read")	{return READ;}
("return")	{return RETURN;}
("->")		{return RETURNS;}
(")") 		{return RIGHT_PAREN;}
("]") 		{return RIGHT_SQ_BQ ;}
(";") 		{return SEMICOLON;}
("skip")	{return SKIP;}
("step")	{return STEP;}
("to") 		{return TO;} 
("while")	{return WHILE;}	 
[0-9] 		{return INT;}
[0-9]+.[0-9]+ {return FLOAT;}
\/\/(.*) 	{printf("Comment\n");}				
(\".*\")	{return STRING;}
[A-Za-z][A-Za-z|0-9]*  {return ID;}
%% 

int yywrap(void)
{
}