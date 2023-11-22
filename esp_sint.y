%{
/* ********************************************************
**
** Fichero : PRUEBA .Y
** Funcion : Pruebas de YACC para practicas de PL
**
******************************************************* */
# include <stdlib.h>
# include <stdio.h>
# include <string.h>
/** La siguiente declaracion permite que 'yyerror ' se pueda invocar desde el
*** fuente de lex ( prueba .l)
**/
void yyerror ( char * msg ) ;
/** La siguiente variable se usara para conocer el numero de la linea
*** que se esta leyendo en cada momento . Tambien es posible usar la variable
*** 'yylineno ' que tambien nos muestra la linea actual . Para ello es necesario
*** invocar a flex con la opcion '-l' ( compatibilidad con lex ).
**/
int linea_actual = 1 ;
%}
/** Para uso de mensajes de error sintactico con BISON .
*** La siguiente declaracion provoca que 'bison ', ante un error sintactico ,
*** visualice mensajes de error con indicacion de los tokens que se esperaban
*** en el lugar en el que produjo el error ( SOLO FUNCIONA CON BISON >=2.1) .
*** Para Bison <2.1 es mediante
***
*** # define YYERROR_VERBOSE
***
*** En caso de usar mensajes de error mediante 'mes ' y 'mes2 ' ( ver apendice D)
*** nada de lo anterior debe tenerse en cuenta .
**/
%error-verbose
/** A continuacion declaramos los nombres simbolicos de los tokens .
*** byacc se encarga de asociar a cada uno un codigo
**/
%token CABECERA_PROGRAMA
%token TIPO_PRIM
%token TIPO_LISTA
%token ID_IF
/* %token ID_THEN */
%token ID_ELSE
%token ID_WHILE
%token ID_REPEAT
%token ID_UNTIL
%token ID_RETURN
%token NOMB_ENTRADA
%token NOMB_SALIDA
/* %token LISTA_SENT */
%token EXPR_LISTA_IZQ
%token EXPR_LISTA_DER
%token OP_UN_DELANTE
%token OP_BIN_TERN_PRIM
%token OP_BIN_TERN_SEG
%token OP_BINARIO
/*%token OP_UNARIO */
%token OP_UN_BIN
%token IDENTIFICADOR
%token CADENA
%token CONSTANTE
%token PAR_IZQ
%token PAR_DER
%token CORCH_IZQ
%token CORCH_DER
%token LLAVE_IZQ
%token LLAVE_DER
%token COMA
%token PYC
%token ASIGN

%token OP_MULTDIV /* * / */ 
/* %token OP_RELACION //>, <, >=, <=,
%token OP_IGUALDAD //  
%token OP_LOGICOS // && || != == */
%token OP_BINARIO_LISTAS // %
%token OP_TER_LIST

%start programa

%right OP_BIN_TERN_PRIM 
%right OP_BIN_TERN_SEG
%right OP_TER_LIST // parche para solucionar el r/r
%right EXPR_LISTA_DER
%right OP_BINARIO_LISTAS

/* %left OP_LOGICOS
%left OP_IGUALDAD
%left OP_RELACION */
%left OP_BINARIO
%left OP_MULTDIV
%left OP_UN_BIN
 
%right OP_UN_DELANTE // OP_UNARIO_LISTAS 

%%

programa : CABECERA_PROGRAMA bloque;

bloque : LLAVE_IZQ
         Declar_de_variables_locales
         Declar_de_subprogs
         Sentencias
         LLAVE_DER ;

Declar_de_subprogs : Declar_de_subprogs Declar_subprog
                   |
                   ;

Declar_subprog : Cabecera_subprog bloque
                ;

Declar_de_variables_locales : tipo Variables_locales PYC;

//////////////////////////////////////////////////
//////////////////////////////////////////////////


Variables_locales : IDENTIFICADOR 
                  /* | Cuerpo_declar_variables COMA IDENTIFICADOR */
                  | Variables_locales COMA IDENTIFICADOR
                  ;
tipo : TIPO_PRIM | TIPO_LISTA

/* Cuerpo_declar_variables : IDENTIFICADOR 
                        | Cuerpo_declar_variables COMA IDENTIFICADOR
                        ; */


Cabecera_subprog : tipo IDENTIFICADOR PAR_IZQ lista_arg PAR_DER 
                 ;
              
lista_arg  : argumentos 
           |
           ; 

argumentos : tipo IDENTIFICADOR 
           | argumentos COMA tipo IDENTIFICADOR
           ; 

/* nombres_variables : nombres_variables COMA IDENTIFICADOR 
                  | nombres_variables COMA asignacion 
                  | IDENTIFICADOR
                  | asignacion
                  | error IDENTIFICADOR {yyerrok;}
                  ; */

/* Def_argumentos_subprogr : Def_argumentos_subprogr COMA Def_argumento_subprogr
                        | Def_argumento_subprogr 
                        ;

Def_argumento_subprogr : TIPO_DATO IDENTIFICADOR
                       | LIST_OF TIPO_DATO IDENTIFICADOR 
                       | error IDENTIFICADOR {yyerrok;} ; */

Sentencias : Sentencias Sentencia
           | Sentencia;


Sentencia : bloque
                 | sentencia_asignacion
                 | sentencia_if
                 | sentencia_while
                 | sentencia_entrada
                 | sentencia_salida 
                 | sentencia_return
                 | sentencia_repeat
                 /* | llamada_proced
                 | expr_o_assign PYC */
                 ;

sentencia_entrada : NOMB_ENTRADA lista_variables PYC;

sentencia_salida : NOMB_SALIDA lista_expresiones_o_cadena PYC;
/* ternary_expression : expresion OP_BIN_TERN_SEG; */
                   
expresion : PAR_IZQ expresion PAR_DER 
          | expresion OP_UN_DELANTE  
          | OP_UN_BIN expresion  %prec OP_UN_DELANTE
          | expresion OP_UN_BIN expresion
          | expresion OP_MULTDIV expresion 
          | expresion OP_BINARIO expresion 
          /* | expresion OP_RELACION expresion 
          | expresion OP_IGUALDAD expresion 
          | expresion OP_LOGICOS expresion  */
          | EXPR_LISTA_IZQ expresion
          | expresion EXPR_LISTA_DER
          | expresion OP_BINARIO_LISTAS expresion 
          | expresion OP_BIN_TERN_SEG expresion
          | expresion OP_BIN_TERN_PRIM expresion OP_TER_LIST expresion
          | IDENTIFICADOR
          | CONSTANTE  
          | lista
          | error
          ;


sentencia_asignacion : IDENTIFICADOR ASIGN expresion PYC;

sentencia_if : ID_IF PAR_IZQ expresion PAR_DER Sentencia 
             | ID_IF PAR_IZQ expresion PAR_DER Sentencia ID_ELSE Sentencia;

sentencia_while : ID_WHILE PAR_IZQ expresion PAR_DER Sentencia;
sentencia_repeat : ID_REPEAT Sentencia ID_UNTIL PAR_IZQ expresion PAR_DER;
sentencia_return : ID_RETURN expresion PYC;


lista_variables : lista_variables COMA IDENTIFICADOR
                | lista_variables COMA CONSTANTE
                | IDENTIFICADOR 
                | CONSTANTE 
                /* | */
                ;


lista_expresiones_o_cadena : lista_expresiones_o_cadena COMA expresion
                           | lista_expresiones_o_cadena COMA CADENA
                           | expresion
                           | CADENA
                           ;


lista : CORCH_IZQ lista_variables CORCH_DER 
      ;
       /* | CORCH_IZQ CORCH_DER; */

%%
/** aqui incluimos el fichero generado por el 'lex '
*** que implementa la funcion 'yylex '
**/
#include "lex.yy.c"

/** se debe implementar la funcion yyerror . En este caso
*** simplemente escribimos el mensaje de error en pantalla
**/
void yyerror ( char * msg )
{
fprintf ( stderr ,"[ Linea %d]: %s\n", linea_actual , msg ) ;
}