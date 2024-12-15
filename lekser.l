%{
//inicijalizacije? includovi za 3. deo leksera? include parsera
#include <stdio.h>
#include "parser.hpp"
%}
%option noyywrap
%option case-insensitive
%%

\n            { return EOL; }
[\t \r]       { }
"#"[^\n]*     { /* ignore comments */ }
"$"           { return DOLLAR_SIGN; }
","           { return COMMA; }
":"           { return COLON; }
"\["          { return OPEN_BRACKET; }
"\]"          { return CLOSED_BRACKET; }
"+"           { return PLUS; }
"="           { return EQUAL; }
"-"           { return MINUS; }
".global"     { return GLOBAL; }
".extern"     { return EXTERN; }
".section"    { return SECTION; }
".word"       { return WORD; }
".skip"       { return SKIP; }
".ascii"      { return ASCII; }
".equ"        { return EQU; }
".end"        { return END; }
"halt"        { return HALT; }
"int"         { return INT; }
"iret"        { return IRET; }
"call"        { return CALL; }
"ret"         { return RET; }
"jmp"         { return JMP; }
"beq"         { return BEQ; }
"bne"         { return BNE; }
"bgt"         { return BGT; }
"push"        { return PUSH; }
"pop"         { return POP; }
"xchg"        { return XCHG; }
"add"         { return ADD; }
"sub"         { return SUB; }
"mul"         { return MUL; }
"div"         { return DIV; }
"not"         { return NOT; }
"and"         { return AND; }
"or"          { return OR; }
"xor"         { return XOR; }
"shl"         { return SHL; }
"shr"         { return SHR; }
"ld"          { return LD; }
"st"          { return ST; }
"csrrd"       { return CSRRD; }
"csrwr"       { return CSRWR; }
%r([0-9]|1[0-5])  { return GPRX; }
"%sp"         { return GPRX; }
"%pc"         { return GPRX; }
"%status"     { return CSRX; }
"%handler"    { return CSRX; }
"%cause"      { return CSRX; }
[a-zA-Z][a-zA-Z0-9_]* { return SYMBOL; }
0x[0-9a-fA-F]+ { return LITERAL; }
-?[1-9][0-9]* { return LITERAL; }
[01]+   { return LITERAL; }
\"[^\"]*\"  { return STRING; }
.             { printf("Greska %s ", yytext); }
