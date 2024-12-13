#include <iostream>
extern int yyparse();
extern FILE* yyin;

using namespace std;


int main() {

    yyin = fopen("kod.s", "r");    
    yyparse();


}
