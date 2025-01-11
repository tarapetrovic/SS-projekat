#include <iostream>
#include "assembler.hpp"
#include "parser.hpp"

Assembler assembler;

extern int yyparse();
extern FILE* yyin;

using namespace std;


int main() {

    yyin = fopen("kod.s", "r");    
    yyparse();
    fclose(yyin);

}
