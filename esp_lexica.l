%option yylineno
%option noyywrap

%{
    #include "tabla.h"
%}
%% 
[ \n\t] {}
"principal" {return CABECERA_PROGRAMA; }
"entero" { return TIPO_PRIM; }
"real" { return TIPO_PRIM; } 
"booleano" { return TIPO_PRIM; }
"caracter" { return TIPO_PRIM; }
"lista de" { return TIPO_LISTA; }
"si" { return ID_IF; }
"entonces" { return ID_THEN; }
"sino" { return ID_ELSE; }
"mientras" { return ID_WHILE; }
"repite" { return ID_REPEAT; }
"hasta" { return ID_UNTIL; }
"devuelve" { return ID_RETURN; }
"cin >>>" { return NOMB_ENTRADA; }
"cout <<<" { return NOMB_SALIDA; }
">>" { return LISTA_SENT; }
"<<" { return LISTA_SENT; }
"$" { return LISTA_SENT; }
"++" { return OP_TERN_PRIM; }
"@" { return OP_TERN_SEG; }
"%" { return OP_BINARIO; }
"*" { return OP_BINARIO; }
"/" { return OP_BINARIO; }
"==" { return OP_BINARIO; }
"<" { return OP_BINARIO; }
">" { return OP_BINARIO; }
"<=" { return OP_BINARIO; }
">=" { return OP_BINARIO; }
"!=" { return OP_BINARIO; }
"&&" { return OP_BINARIO; }
"||" { return OP_BINARIO; }
"^" { return OP_BINARIO; }
"**" { return OP_BINARIO; }
"!" { return OP_UNARIO; }
"—" { return OP_UNARIO; }
"#" { return OP_UNARIO; }
"?" { return OP_UNARIO; }
"+" { return OP_UN_BIN; }
"-" { return OP_UN_BIN; }
\"[^\"]*\" { return CADENA; }
([0-9]+) { return CONSTANTE; }
([0-9]*\.[0-9]*) { return CONSTANTE; }
"verdadero" { return CONSTANTE; }
"falso" { return CONSTANTE; }
\'[^\']\'  { return CONSTANTE; }
"(" { return PAR_IZQ; }
")" { return PAR_DER; }
"[" { return CORCH_IZQ; }
"]" { return CORCH_DER; }
"{" { return LLAVE_IZQ; }
"}" { return LLAVE_DER; }
"," { return COMA; }
";" { return PYC; }
"=" { return ASIGN; }
[a-zA-Z]([a-zA-Z0-9])* { return IDENTIFICADOR; }
<*>.|\n { printf("Error en la línea %d. Lexema %s no reconocible.\n", yylineno, yytext); }
%%
int main() {
    int val;

    // Token names for lookup
    const char *token_names[] = {
        "CABECERA_PROGRAMA",
        "TIPO_PRIM",
        "TIPO_LISTA",
        "ID_IF",
        "ID_THEN",
        "ID_ELSE",
        "ID_WHILE",
        "ID_REPEAT",
        "ID_UNTIL",
        "ID_RETURN",
        "NOMB_ENTRADA",
        "NOMB_SALIDA",
        "LISTA_SENT",
        "OP_TERN_PRIM",
        "OP_TERN_SEG",
        "OP_BINARIO",
        "OP_UNARIO",
        "OP_UN_BIN",
        "IDENTIFICADOR",
        "CADENA",
        "CONSTANTE",
        "PAR_IZQ",
        "PAR_DER",
        "CORCH_IZQ",
        "CORCH_DER",
        "LLAVE_IZQ",
        "LLAVE_DER",
        "COMA",
        "PYC",
        "ASIGN",
    };

    val = yylex();
    while (val != 0) {
        if (val >= 0 && val < (sizeof(token_names) / sizeof(token_names[0])) + 257) {
            printf("%s \t(%d)\n", token_names[val-257], val);
        } else {
            printf("Token value: %d (Unknown token)\n", val);
        }
        val = yylex();
    }

    return 0;
}
