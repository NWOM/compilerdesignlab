%option noyywrap
%{
#include<stdio.h>
int flag=0; //USED TO INDICATE IF "ab" IS FOUND
%}
%s FOUND_A
%%
<INITIAL>a {BEGIN(FOUND_A);}
<FOUND_A>b {flag=1; printf("'ab' found as a substring.\n"); BEGIN(0); }
<FOUND_A>. {BEGIN(0); }
.
%%
int main(){
    yylex();
    return 0;
}

