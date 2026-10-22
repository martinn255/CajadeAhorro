/* scanner_imprime.l - Scanner de Aleph que imprime tokens por pantalla */

%{
#include <stdio.h>
%}

%option noyywrap
%x COMENTARIO

DIGITO      [0-9]
LETRA       [a-zA-Z_]
ID          {LETRA}({LETRA}|{DIGITO})*
NUM         {DIGITO}+
CADENA      \"([^\"\\]|\\.)*\"

%%

    /* COMENTARIOS */
"//".*                  { }
"/*"                    { BEGIN(COMENTARIO); }
<COMENTARIO>"*/"        { BEGIN(INITIAL); }
<COMENTARIO>.|\n        { }

    /* PALABRAS RESERVADAS */
"set"           { printf("TK_SET: %s\n", yytext); }
"list"          { printf("TK_LIST: %s\n", yytext); }
"element"       { printf("TK_ELEMENT: %s\n", yytext); }
"while"         { printf("TK_WHILE: %s\n", yytext); }
"for"           { printf("TK_FOR: %s\n", yytext); }
"in"            { printf("TK_IN: %s\n", yytext); }
"if"            { printf("TK_IF: %s\n", yytext); }
"else"          { printf("TK_ELSE: %s\n", yytext); }
"return"        { printf("TK_RETURN: %s\n", yytext); }

    /* OPERADORES SOBRE CONJUNTOS */
"++"            { printf("TK_INTERSECTION: %s\n", yytext); }
"+"             { printf("TK_UNION: %s\n", yytext); }
"-"             { printf("TK_DIFFERENCE: %s\n", yytext); }
"#"             { printf("TK_CARDINALITY: %s\n", yytext); }
"::"            { printf("TK_BELONGS: %s\n", yytext); }
":"             { printf("TK_INCLUDED: %s\n", yytext); }

    /* OPERADORES RELACIONALES Y LÓGICOS */
"=="            { printf("TK_EQUAL: %s\n", yytext); }
"!="            { printf("TK_NOT_EQUAL: %s\n", yytext); }
"<"             { printf("TK_LESS: %s\n", yytext); }
">"             { printf("TK_GREATER: %s\n", yytext); }
"&&"            { printf("TK_AND: %s\n", yytext); }
"||"            { printf("TK_OR: %s\n", yytext); }
"!"             { printf("TK_NOT: %s\n", yytext); }

    /* ASIGNACIÓN */
"="             { printf("TK_ASSIGN: %s\n", yytext); }

    /* DELIMITADORES */
"{"             { printf("TK_LBRACE: %s\n", yytext); }
"}"             { printf("TK_RBRACE: %s\n", yytext); }
"["             { printf("TK_LBRACKET: %s\n", yytext); }
"]"             { printf("TK_RBRACKET: %s\n", yytext); }
"("             { printf("TK_LPAREN: %s\n", yytext); }
")"             { printf("TK_RPAREN: %s\n", yytext); }
";"             { printf("TK_SEMICOLON: %s\n", yytext); }
","             { printf("TK_COMMA: %s\n", yytext); }

    /* LITERALES E IDENTIFICADORES */
{CADENA}        { printf("TK_STRING: %s\n", yytext); }
{NUM}           { printf("TK_NUMBER: %s\n", yytext); }
{ID}            { printf("TK_ID: %s\n", yytext); }

    /* IGNORADOS */
[ \t\n]+        { }

    /* ERRORES */
.               { printf("Error léxico: carácter no reconocido '%s'\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) { perror("Error al abrir archivo"); return 1; }
    }
    else {
        printf("Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }
    yylex();
    fclose(yyin);
    return 0;
} 