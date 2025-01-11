%{
//inicijalizacije? includovi za 3. deo leksera? include parsera
#include <stdio.h>
#include "parser.hpp"
#include "assembler.hpp"

extern Assembler assembler;

extern YYSTYPE yylval;
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
%r([0-9]|1[0-5])  { yylval.intval = atoi(yytext + 2); return GPRX; }
"%sp"         { yylval.strval = strdup("sp"); return GPRX; } // da li je ok da koristim ovaj strdup il treba da napravim neki svoji copystring? dal mzd svuda strdup(yytext) umesto pojedinacnog kucanja?
"%pc"         { yylval.strval = strdup("pc"); return GPRX; } // prosledjujem li ime kao pc, ili da ga odavde odmah prosledim kao 15? to ce mi biti greska
"%status"     { yylval.strval = strdup("status"); return CSRX; }
"%handler"    { yylval.strval = strdup("handler"); return CSRX; }
"%cause"      { yylval.strval = strdup("cause"); return CSRX; }
[a-zA-Z][a-zA-Z0-9_]* { yylval.strval = strdup(yytext); return SYMBOL; }
0x[0-9a-fA-F]+ { yylval.intval = strtoul(yytext, NULL, 16); return LITERAL; }
-?[1-9][0-9]* { yylval.intval = atoi(yytext); return LITERAL; }
[01]+   { yylval.intval = strtoul(yytext, NULL, 2); return LITERAL; }
\"[^\"]*\"  { yylval.strval = strdup(yytext); return STRING; }
.             { printf("Greska %s ", yytext); }
