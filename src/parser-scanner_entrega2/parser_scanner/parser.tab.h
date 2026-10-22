/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TK_SET = 258,                  /* TK_SET  */
    TK_LIST = 259,                 /* TK_LIST  */
    TK_ELEMENTO = 260,             /* TK_ELEMENTO  */
    TK_WHILE = 261,                /* TK_WHILE  */
    TK_FOR = 262,                  /* TK_FOR  */
    TK_IN = 263,                   /* TK_IN  */
    TK_IF = 264,                   /* TK_IF  */
    TK_RETORNAR = 265,             /* TK_RETORNAR  */
    TK_UNION = 266,                /* TK_UNION  */
    TK_INTER = 267,                /* TK_INTER  */
    TK_DIF = 268,                  /* TK_DIF  */
    TK_CARD = 269,                 /* TK_CARD  */
    TK_PERT = 270,                 /* TK_PERT  */
    TK_NOPERT = 271,               /* TK_NOPERT  */
    TK_INCLU = 272,                /* TK_INCLU  */
    TK_NOINCLU = 273,              /* TK_NOINCLU  */
    TK_IGUAL = 274,                /* TK_IGUAL  */
    TK_DISTINTO = 275,             /* TK_DISTINTO  */
    TK_MENOR = 276,                /* TK_MENOR  */
    TK_MAYOR = 277,                /* TK_MAYOR  */
    TK_AND = 278,                  /* TK_AND  */
    TK_OR = 279,                   /* TK_OR  */
    TK_NOT = 280,                  /* TK_NOT  */
    TK_ASIGNAR = 281,              /* TK_ASIGNAR  */
    TK_LLAVE_IZQ = 282,            /* TK_LLAVE_IZQ  */
    TK_LLAVE_DER = 283,            /* TK_LLAVE_DER  */
    TK_CORCHETE_IZQ = 284,         /* TK_CORCHETE_IZQ  */
    TK_CORCHETE_DER = 285,         /* TK_CORCHETE_DER  */
    TK_PAREN_IZQ = 286,            /* TK_PAREN_IZQ  */
    TK_PAREN_DER = 287,            /* TK_PAREN_DER  */
    TK_PUNTO_COMA = 288,           /* TK_PUNTO_COMA  */
    TK_COMA = 289,                 /* TK_COMA  */
    TK_LITERAL = 290,              /* TK_LITERAL  */
    TK_ID = 291                    /* TK_ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
