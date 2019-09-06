%{ 
/* Definition section */
	#include <stdio.h> 
	#include <stdlib.h> 
	int yyerror(char *msg);
	int yylex();
%} 

%token AND ASSIGN ELSE IF RIGHT_SQ_BQ LEFT_SQ_BQ LEFT_PAREN RIGHT_PAREN COMMA SEMICOLON SKIP STEP TO WHILE PLUS MINUS MULT DIV END GLOBAL PRODUCT OR NUL PRINT READ NE GE GT LE LT RETURNS RETURN INT FUN FROM FLOAT EXITLOOP EQ DOT DEF NOT MOD STRING FORMAT COLON ID 

%type <name> STRING

%left '+' '-'
%left '*' '/' 'MOD' 
%left '.'

%union{
	char name[20];
}

/* Rule Section */

%% 

prog : GLOBAL declList stmtList0 END { printf("Valid String\n"); }
;

declList : | decl declList 
;  

decl : DEF typeList END | FUN funDef END 
;

typeList : typeList SEMICOLON varList COLON type | varList COLON type | typeDef
;

varList : var COMMA varList | var 
;

var : ID sizeList0 
;

sizeList0 : | sizeList
;

sizeList : sizeList LEFT_SQ_BQ INT RIGHT_SQ_BQ | LEFT_SQ_BQ INT RIGHT_SQ_BQ
;

type : INT | FLOAT | STRING | NUL | typeDef | ID
;

typeDef : ID ASSIGN PRODUCT typeList END
;

funDef : funID fparamList0 RETURNS type funBody
;

funID : ID
;

fparamList0 : |fparamList
;

fparamList : fparamList SEMICOLON pList COLON type | pList COLON type
;

pList : pList COMMA idP | idP
;

idP : ID sizeList0
;

funBody : declList stmtList0

stmtList0 : | stmtList 
;

stmtList : stmtList SEMICOLON stmt | stmt
;

stmt : assignmentStmt | readStmt | printStmt | ifStmt | whileStmt | loopStmt | callStmt | returnStmt | exitLoop | skip
;

assignmentStmt : dotId ASSIGN exp 
;

dotId : id | id DOT dotId
;

readStmt : READ FORMAT exp
;

printStmt : PRINT STRING | PRINT FORMAT exp
;

ifStmt : IF bExp COLON stmtList elsePart END 

elsePart : | ELSE stmtList 
;

whileStmt : WHILE bExp COLON stmtList END 
;

loopStmt : FROM id ASSIGN exp TO exp stepPart COLON stmtList0 END 
;

stepPart : | STEP exp
;

callStmt : LEFT_PAREN ID COLON actParamList RIGHT_PAREN
;

returnStmt : RETURN exp0
;

exp0 : | exp
;

exitLoop : EXITLOOP 
;

skip : SKIP
;

id : ID indexList0
;

indexList0 : | indexList
;

indexList : indexList LEFT_SQ_BQ exp RIGHT_SQ_BQ | LEFT_SQ_BQ exp RIGHT_SQ_BQ
;

bExp : bExp OR bExp | bExp AND bExp | NOT bExp | LEFT_PAREN bExp RIGHT_PAREN | exp relOP exp
;

relOP : EQ | GE | LT | LE | GT | NE
;

exp : exp PLUS exp | exp MINUS exp | exp MULT exp | exp DIV exp | exp MOD exp | MINUS exp | PLUS exp | exp DOT exp | LEFT_PAREN exp RIGHT_PAREN | id | LEFT_PAREN exp RIGHT_PAREN | INT | FLOAT 
;

actParamList0 : | actParamList
; 

actParamList : actParamList COMMA exp | exp
;

%% 

int yyerror(char *msg) 
{ 
	printf("Invalid String\n"); 
	exit(0); 
} 

//driver code 
int main() 
{ 
	printf("String is taken form input file\n"); 
	extern FILE *yyin, *yyout; 
  
    yyin = fopen("in.txt", "r"); 
    yyout = fopen("Outputex.txt", "w"); 
	yyparse(); 
	return 0;
} 