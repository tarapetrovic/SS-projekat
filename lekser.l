%{
//inicijalizacije? includovi za 3. deo leksera? include parsera
#include <stdio.h>
#include "parser.hpp"
%}
%option noyywrap
%option case-insensitive
%%

\n            { printf("\n"); return EOL; }
[\t \r]       { printf(" "); }
"#"[^\n]*     { /* ignore comments */ }

"$"           { printf("DOLLAR_SIGN"); return DOLLAR_SIGN; }
","           { printf("COMMA"); return COMMA; }
":"           { printf("COLON"); return COLON; }
"\["          { printf("OPEN_BRACKET"); return OPEN_BRACKET; }
"\]"          { printf("CLOSED_BRACKETS"); return CLOSED_BRACKETS; }
"+"           { printf("PLUS"); return PLUS; }
"="           { printf("EQUAL"); return EQUAL; }
"-"           { printf("MINUS"); return MINUS; }

".global"     { printf("GLOBAL"); return GLOBAL; }
".extern"     { printf("EXTERN"); return EXTERN; }
".section"    { printf("SECTION"); return SECTION; }
".word"       { printf("WORD"); return WORD; }
".skip"       { printf("SKIP"); return SKIP; }
".ascii"      { printf("ASCII"); return ASCII; }
".equ"        { printf("EQU"); return EQU; }
".end"        { printf("END"); return END; }
"halt"        { printf("HALT"); return HALT; }
"int"         { printf("INT"); return INT; }
"iret"        { printf("IRET"); return IRET; }
"call"        { printf("CALL"); return CALL; }
"ret"         { printf("RET"); return RET; }
"jmp"         { printf("JMP"); return JMP; }
"beq"         { printf("BEQ"); return BEQ; }
"bne"         { printf("BNE"); return BNE; }
"bgt"         { printf("BGT"); return BGT; }
"push"        { printf("PUSH"); return PUSH; }
"pop"         { printf("POP"); return POP; }
"xchg"        { printf("XCHG"); return XCHG; }
"add"         { printf("ADD"); return ADD; }
"sub"         { printf("SUB"); return SUB; }
"mul"         { printf("MUL"); return MUL; }
"div"         { printf("DIV"); return DIV; }
"not"         { printf("NOT"); return NOT; }
"and"         { printf("AND"); return AND; }
"or"          { printf("OR"); return OR; }
"xor"         { printf("XOR"); return XOR; }
"shl"         { printf("SHL"); return SHL; }
"shr"         { printf("SHR"); return SHR; }
"ld"          { printf("LD"); return LD; }
"st"          { printf("ST"); return ST; }

"csrrd"       { printf("CSRRD"); return CSRRD; }
"csrwr"       { printf("CSRWR"); return CSRWR; }
"%r([0-9] | 1[0-5])"  { printf("GPRX"); return GPRX; }
"%sp"         { printf("GPRX"); return GPRX; }
"%pc"         { printf("GPRX"); return GPRX; }
"%status"     { printf("CSRX"); return CSRX; }
"%handler"    { printf("CSRX"); return CSRX; }
"%cause"      { printf("CSRX"); return CSRX; }

"[a-zA-Z][a-zA-Z0-9_]*" { printf("SYMBOL"); return SYMBOL; }

"0x[0-9a-fA-F]+" { printf("LITERAL (hex)"); return LITERAL; }
"-?[1-9][0-9]*" { printf("LITERAL (decimal)"); return LITERAL; }
"[01]+"       { printf("LITERAL (binary)"); return LITERAL; }

"\"[^\"]*\""  { printf("STRING"); return STRING; }

.             { printf("Greska"); }
