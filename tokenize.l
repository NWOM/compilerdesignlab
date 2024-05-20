%{
#include <stdio.h>

int total_tokens = 0;
%}

%%

int|float|char|void    { printf("Type: %s\n", yytext); total_tokens++; }
if|else|while|for      { printf("Keyword: %s\n", yytext); total_tokens++; }
[0-9]+                  { printf("Number: %s\n", yytext); total_tokens++; }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier: %s\n", yytext); total_tokens++; }
[+\-*/=<>]              { printf("Operator: %s\n", yytext); total_tokens++; }
[{}();,]                { printf("Punctuation: %s\n", yytext); total_tokens++; }
[\t\n]                  ; // Ignore whitespace and newline characters
.                       { printf("Unknown: %s\n", yytext); total_tokens++; }

%%

int main() {
    yylex();
    printf("\nTotal Tokens: %d\n", total_tokens);
    return 0;
}

