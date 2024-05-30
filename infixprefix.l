%{
#include "parse.tab.h"
#include <string.h>
%}

%%
[a-z]+ {strcpy(yylval.s,yytext); return ID;}
"*"|"/"|"+"|"-"|"^"|"("|")" {return yytext[0];}
"\n" {return 0;}
. {}
%%
int yywrap(){
    return 1;
}

//HOW TO RUN
# Infix-to-prefix
A Yacc program to create a parser which prints prefix of an arithmetic expression.

# How to run
- $ bison -d parse.y
- $ flex infixprefix.l
- $ gcc infixprefix.tab.c -o infixprefix
- $ ./infixprefix
