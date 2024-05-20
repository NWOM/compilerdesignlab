%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
%}
%%
[ \n\t]+ { fprintf(yyout," "); }
.        { fprintf(yyout,"%s",yytext);}
%%
int yywrap(){
return 1;
}
int main()
{
extern FILE *yyin,*yyout;
yyin=fopen("input1.txt","r");
yyout=fopen("output.txt","w");
yylex();
return 0;
}
