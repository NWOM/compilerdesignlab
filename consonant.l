%{
#include <stdio.h>
int vowelCount=0;
int cCount=0;
%}

%%


[aeiouAEIOU] { printf("Vowel: %s\n", yytext); ++vowelCount; }
[^aeiouAEIOU \t\n] { printf("Consonant: %s\n", yytext); ++cCount; }
[ \t\n] ;


%%

int main(){
yylex();
printf("Vowel Count: %d\n", vowelCount);
printf("Consonat Count : %d\n", cCount);
return 0;
}

