%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node
{
struct node *left;
struct node *right;
char *token;
} node;

#define YYSTYPE struct node *
node *mknode(node *left, node *right, char *token);
#include "y.tab.h"
#include "lex.yy.c"

 void printtree(node *tree);

 int yyerror(char *);
%} 

%start lines
%token NUMBER
%token PLUS MINUS TIMES DIVIDE POWER
%token LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token END
%left PLUS MINUS
%left TIMES DIVIDE
%right POWER
%%

lines: 
 | lines line 
 ;
line: exp END { printtree($1); printf("\n");}
 ;
exp: term {$$ = $1;}
 | exp PLUS term {$$ = mknode($1, $3, "+");}
 | exp MINUS term {$$ = mknode($1, $3, "-");} 
 ;

term: factor {$$ = $1;}
 | term TIMES factor {$$ = mknode($1, $3, "*");}
 | term DIVIDE factor {$$ = mknode($1, $3, "/");}
 ;

factor: NUMBER {$$ = yylval; }
 | LEFT_PARENTHESIS exp RIGHT_PARENTHESIS {$$ = $2;}
 ;
%%

int main (void) {return yyparse ( );}

node *mknode(node *left, node *right, char *token)
{ /* malloc the node */
 node *newnode = (node *)malloc(sizeof(node));
 char *newstr = (char *)malloc(strlen(token)+1);
 strcpy(newstr, token);
 newnode->left = left;
 newnode->right = right;
 newnode->token = newstr;
 return(newnode);
}

void printtree(node *tree)
{
 if(tree == NULL) return;
 if (tree->left || tree->right)
 printf("(");
 if (tree->left)
 printtree(tree->left);
 printf(" %s ", tree->token);
 if (tree->right)
 printtree(tree->right);
 if (tree->left || tree->right)
 printf(")");
 return ;
}

int yyerror (char *s) {fprintf (stderr, "%s\n", s);} 