/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER_HPP_INCLUDED
# define YY_YY_PARSER_HPP_INCLUDED
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
    DOLLAR_SIGN = 258,
    COMMA = 259,
    COLON = 260,
    OPEN_BRACKET = 261,
    CLOSED_BRACKET = 262,
    PLUS = 263,
    EQUAL = 264,
    MINUS = 265,
    GLOBAL = 266,
    EXTERN = 267,
    SECTION = 268,
    WORD = 269,
    SKIP = 270,
    ASCII = 271,
    EQU = 272,
    END = 273,
    HALT = 274,
    INT = 275,
    IRET = 276,
    CALL = 277,
    RET = 278,
    JMP = 279,
    BEQ = 280,
    BNE = 281,
    BGT = 282,
    PUSH = 283,
    POP = 284,
    XCHG = 285,
    ADD = 286,
    SUB = 287,
    MUL = 288,
    DIV = 289,
    NOT = 290,
    AND = 291,
    OR = 292,
    XOR = 293,
    SHL = 294,
    SHR = 295,
    LD = 296,
    ST = 297,
    CSRRD = 298,
    CSRWR = 299,
    GPRX = 300,
    CSRX = 301,
    SYMBOL = 302,
    LITERAL = 303,
    STRING = 304,
    EOL = 305
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_HPP_INCLUDED  */
