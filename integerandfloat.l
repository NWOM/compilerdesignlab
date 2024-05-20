%{
  #include<stdio.h>
%}

DIGIT [0-9]
EXPONENT [eE][+-]?{DIGIT}+
FLOAT {DIGIT}+"."+{DIGIT}+({EXPONENT})?
INTEGER {DIGIT}+
%option noyywrap
%%

{INTEGER} { printf("Integer Number: %s\n",yytext);}
{FLOAT} {  printf("Float Numbers: %s\n",yytext);}
.      {/*ignore*/}

%%

int main(){
   yylex();
   return 0;
}
