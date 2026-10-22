/* scanner_enum.l - Scanner de Aleph con enumerados y main de prueba */

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum Token {
    TK_SET = 256, TK_LIST, TK_ELEMENT,
    TK_WHILE, TK_FOR, TK_IN, TK_IF, TK_ELSE, TK_RETURN,
    TK_UNION, TK_INTERSECTION, TK_DIFFERENCE, TK_CARDINALITY,
    TK_BELONGS, TK_INCLUDED,
    TK_EQUAL, TK_NOT_EQUAL, TK_LESS, TK_GREATER,
    TK_AND, TK_OR, TK_NOT,
    TK_ASSIGN,
    TK_LBRACE, TK_RBRACE,
    TK_LBRACKET, TK_RBRACKET,
    TK_LPAREN, TK_RPAREN,
    TK_SEMICOLON, TK_COMMA,
    TK_STRING, TK_NUMBER, TK_ID
};

const char* token_name(int tok) {
    switch (tok) {
        case TK_SET:            return "TK_SET";
        case TK_LIST:           return "TK_LIST";
        case TK_ELEMENT:        return "TK_ELEMENT";
        case TK_WHILE:          return "TK_WHILE";
        case TK_FOR:            return "TK_FOR";
        case TK_IN:             return "TK_IN";
        case TK_IF:             return "TK_IF";
        case TK_ELSE:           return "TK_ELSE";
        case TK_RETURN:         return "TK_RETURN";
        case TK_UNION:          return "TK_UNION";
        case TK_INTERSECTION:   return "TK_INTERSECTION";
        case TK_DIFFERENCE:     return "TK_DIFFERENCE";
        case TK_CARDINALITY:    return "TK_CARDINALITY";
        case TK_BELONGS:        return "TK_BELONGS";
        case TK_INCLUDED:       return "TK_INCLUDED";
        case TK_EQUAL:          return "TK_EQUAL";
        case TK_NOT_EQUAL:      return "TK_NOT_EQUAL";
        case TK_LESS:           return "TK_LESS";
        case TK_GREATER:        return "TK_GREATER";
        case TK_AND:            return "TK_AND";
        case TK_OR:             return "TK_OR";
        case TK_NOT:            return "TK_NOT";
        case TK_ASSIGN:         return "TK_ASSIGN";
        case TK_LBRACE:         return "TK_LBRACE";
        case TK_RBRACE:         return "TK_RBRACE";
        case TK_LBRACKET:       return "TK_LBRACKET";
        case TK_RBRACKET:       return "TK_RBRACKET";
        case TK_LPAREN:         return "TK_LPAREN";
        case TK_RPAREN:         return "TK_RPAREN";
        case TK_SEMICOLON:      return "TK_SEMICOLON";
        case TK_COMMA:          return "TK_COMMA";
        case TK_STRING:         return "TK_STRING";
        case TK_NUMBER:         return "TK_NUMBER";
        case TK_ID:             return "TK_ID";
        case 0:                 return "EOF";
        default:                return "DESCONOCIDO";
    }
}

extern int yylex(void);
extern FILE *yyin;
extern char *yytext;
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
"set"           { return TK_SET; }
"list"          { return TK_LIST; }
"element"       { return TK_ELEMENT; }
"while"         { return TK_WHILE; }
"for"           { return TK_FOR; }
"in"            { return TK_IN; }
"if"            { return TK_IF; }
"else"          { return TK_ELSE; }
"return"        { return TK_RETURN; }

    /* OPERADORES SOBRE CONJUNTOS */
"++"            { return TK_INTERSECTION; }
"+"             { return TK_UNION; }
"-"             { return TK_DIFFERENCE; }
"#"             { return TK_CARDINALITY; }
"::"            { return TK_BELONGS; }
":"             { return TK_INCLUDED; }

    /* OPERADORES RELACIONALES Y LÓGICOS */
"=="            { return TK_EQUAL; }
"!="            { return TK_NOT_EQUAL; }
"<"             { return TK_LESS; }
">"             { return TK_GREATER; }
"&&"            { return TK_AND; }
"||"            { return TK_OR; }
"!"             { return TK_NOT; }

    /* ASIGNACIÓN */
"="             { return TK_ASSIGN; }

    /* DELIMITADORES */
"{"             { return TK_LBRACE; }
"}"             { return TK_RBRACE; }
"["             { return TK_LBRACKET; }
"]"             { return TK_RBRACKET; }
"("             { return TK_LPAREN; }
")"             { return TK_RPAREN; }
";"             { return TK_SEMICOLON; }
","             { return TK_COMMA; }

    /* LITERALES E IDENTIFICADORES */
{CADENA}        { return TK_STRING; }
{NUM}           { return TK_NUMBER; }
{ID}            { return TK_ID; }

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
    int tok;
    while ((tok = yylex()) != 0) {
        printf("%-20s %s\n", token_name(tok), yytext);
    }
    fclose(yyin);
    return 0;
}