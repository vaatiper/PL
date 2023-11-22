/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CABECERA_PROGRAMA = 258,
    TIPO_PRIM = 259,
    TIPO_LISTA = 260,
    ID_IF = 261,
    ID_THEN = 262,
    ID_ELSE = 263,
    ID_WHILE = 264,
    ID_REPEAT = 265,
    ID_UNTIL = 266,
    ID_RETURN = 267,
    NOMB_ENTRADA = 268,
    NOMB_SALIDA = 269,
    EXPR_LISTA_IZQ = 270,
    EXPR_LISTA_DER = 271,
    OP_UN_DELANTE = 272,
    OP_BIN_TERN_PRIM = 273,
    OP_BIN_TERN_SEG = 274,
    OP_UN_BIN = 275,
    IDENTIFICADOR = 276,
    CADENA = 277,
    CONSTANTE = 278,
    PAR_IZQ = 279,
    PAR_DER = 280,
    CORCH_IZQ = 281,
    CORCH_DER = 282,
    LLAVE_IZQ = 283,
    LLAVE_DER = 284,
    COMA = 285,
    PYC = 286,
    ASIGN = 287,
    OP_MULTDIV = 288,
    OP_RELACION = 289,
    OP_IGUALDAD = 290,
    OP_LOGICOS = 291,
    OP_BINARIO_LISTAS = 292,
    OP_UNARIO_LISTAS = 293
  };
#endif
/* Tokens.  */
#define CABECERA_PROGRAMA 258
#define TIPO_PRIM 259
#define TIPO_LISTA 260
#define ID_IF 261
#define ID_THEN 262
#define ID_ELSE 263
#define ID_WHILE 264
#define ID_REPEAT 265
#define ID_UNTIL 266
#define ID_RETURN 267
#define NOMB_ENTRADA 268
#define NOMB_SALIDA 269
#define EXPR_LISTA_IZQ 270
#define EXPR_LISTA_DER 271
#define OP_UN_DELANTE 272
#define OP_BIN_TERN_PRIM 273
#define OP_BIN_TERN_SEG 274
#define OP_UN_BIN 275
#define IDENTIFICADOR 276
#define CADENA 277
#define CONSTANTE 278
#define PAR_IZQ 279
#define PAR_DER 280
#define CORCH_IZQ 281
#define CORCH_DER 282
#define LLAVE_IZQ 283
#define LLAVE_DER 284
#define COMA 285
#define PYC 286
#define ASIGN 287
#define OP_MULTDIV 288
#define OP_RELACION 289
#define OP_IGUALDAD 290
#define OP_LOGICOS 291
#define OP_BINARIO_LISTAS 292
#define OP_UNARIO_LISTAS 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
