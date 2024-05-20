%{
#include <stdio.h>

int capital=0;
int small=0;
%}

%%


[A-Z]+ { printf("Capital Word: %s\n", yytext); ++capital; }
[a-z]+ { printf("Small Word : %s\n", yytext); ++small; }
[ \t\n]  ;


%%

int main(){
yylex();
printf("Capital Word Count: %d\n", capital);
printf("Small Word Count: %d\n", small);
return 0;
}

