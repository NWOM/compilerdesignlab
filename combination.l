%{
#include<stdio.h>
int capital=0;
int small=0;
%}

%option noyywrap

%%

[A-Z][A-Z]+ { capital++;printf("CAPITAL WORD: %s\n", yytext); }
[a-z][a-z]+ { small++;printf("SMALL WORD: %s\n", yytext); }
[ \t\n] ;


%%

int main(){
yylex();
printf("Capital Word Count: %d\n", capital);
printf("Small Word Count: %d\n",small);
return 0;
}
