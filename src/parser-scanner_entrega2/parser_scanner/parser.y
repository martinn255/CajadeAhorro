/* parser.y - Primera gramática de Aleph en Bison */
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token TK_SET TK_LIST TK_ELEMENT
%token TK_WHILE TK_FOR TK_IN TK_IF TK_ELSE TK_RETURN
%token TK_UNION TK_INTERSECTION TK_DIFFERENCE TK_CARDINALITY
%token TK_BELONGS TK_INCLUDED
%token TK_EQUAL TK_NOT_EQUAL TK_LESS TK_GREATER
%token TK_AND TK_OR TK_NOT
%token TK_ASSIGN
%token TK_LBRACE TK_RBRACE
%token TK_LBRACKET TK_RBRACKET
%token TK_LPAREN TK_RPAREN
%token TK_SEMICOLON TK_COMMA
%token TK_STRING TK_NUMBER TK_ID

%start program

%%

program : definition program
        | /* vacío */
        ;

definition : type TK_ID TK_LPAREN parameters TK_RPAREN
             TK_LBRACE body TK_RBRACE
           ;

parameters : TK_ID
           | TK_ID TK_COMMA parameters
           | /* vacío */
           ;

body : statement body
     | /* vacío */
     ;

statement : declaration
          | assignment
          | control
          ;

declaration : type TK_ID TK_ASSIGN expr TK_SEMICOLON
            | type TK_ID TK_SEMICOLON
            ;

type : TK_SET | TK_LIST | TK_ELEMENT ;

assignment : TK_ID TK_ASSIGN expr TK_SEMICOLON ;

control : while_stmt
        | for_each
        | if_stmt
        ;

while_stmt : TK_WHILE TK_LPAREN cond TK_RPAREN
             TK_LBRACE body TK_RBRACE
           ;

for_each : TK_FOR TK_ID TK_IN expr
           TK_LBRACE body TK_RBRACE
         ;

if_stmt : TK_IF TK_LPAREN cond TK_RPAREN
          TK_LBRACE body TK_RBRACE
          else_opt
        ;

else_opt : TK_ELSE TK_LBRACE body TK_RBRACE
         | /* vacío */
         ;

cond : expr TK_EQUAL expr
     | expr TK_NOT_EQUAL expr
     | expr TK_LESS expr
     | expr TK_GREATER expr
     | expr TK_BELONGS expr
     | expr TK_INCLUDED expr
     | cond TK_AND cond
     | cond TK_OR cond
     | TK_NOT cond
     | TK_LPAREN cond TK_RPAREN
     | expr
     ;

expr : TK_ID
     | TK_STRING
     | TK_NUMBER
     | TK_LBRACE elements TK_RBRACE
     | TK_LBRACKET elements TK_RBRACKET
     | TK_ID TK_LPAREN arguments TK_RPAREN
     | TK_ID TK_LBRACKET TK_NUMBER TK_RBRACKET
     ;

arguments : expr
          | expr TK_COMMA arguments
          | /* vacío */
          ;

elements : expr
         | expr TK_COMMA elements
         | /* vacío */
         ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error sintáctico: %s\n", s);
}