
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     AND = 258,
     ASSIGN = 259,
     ELSE = 260,
     IF = 261,
     RIGHT_SQ_BQ = 262,
     LEFT_SQ_BQ = 263,
     LEFT_PAREN = 264,
     RIGHT_PAREN = 265,
     COMMA = 266,
     SEMICOLON = 267,
     SKIP = 268,
     STEP = 269,
     TO = 270,
     WHILE = 271,
     PLUS = 272,
     MINUS = 273,
     MULT = 274,
     DIV = 275,
     END = 276,
     GLOBAL = 277,
     PRODUCT = 278,
     OR = 279,
     NUL = 280,
     PRINT = 281,
     READ = 282,
     NE = 283,
     GE = 284,
     GT = 285,
     LE = 286,
     LT = 287,
     RETURNS = 288,
     RETURN = 289,
     INT = 290,
     FUN = 291,
     FROM = 292,
     FLOAT = 293,
     EXITLOOP = 294,
     EQ = 295,
     DOT = 296,
     DEF = 297,
     NOT = 298,
     MOD = 299,
     STRING = 300,
     FORMAT = 301,
     COLON = 302,
     ID = 303
   };
#endif
/* Tokens.  */
#define AND 258
#define ASSIGN 259
#define ELSE 260
#define IF 261
#define RIGHT_SQ_BQ 262
#define LEFT_SQ_BQ 263
#define LEFT_PAREN 264
#define RIGHT_PAREN 265
#define COMMA 266
#define SEMICOLON 267
#define SKIP 268
#define STEP 269
#define TO 270
#define WHILE 271
#define PLUS 272
#define MINUS 273
#define MULT 274
#define DIV 275
#define END 276
#define GLOBAL 277
#define PRODUCT 278
#define OR 279
#define NUL 280
#define PRINT 281
#define READ 282
#define NE 283
#define GE 284
#define GT 285
#define LE 286
#define LT 287
#define RETURNS 288
#define RETURN 289
#define INT 290
#define FUN 291
#define FROM 292
#define FLOAT 293
#define EXITLOOP 294
#define EQ 295
#define DOT 296
#define DEF 297
#define NOT 298
#define MOD 299
#define STRING 300
#define FORMAT 301
#define COLON 302
#define ID 303




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 17 "q.y"

	char name[20];



/* Line 1676 of yacc.c  */
#line 154 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


