%s A B C D E
%%
<INITIAL>[0-9] BEGIN A;
<INITIAL>"." BEGIN E;
<INITIAL>[a-zA-Z] BEGIN D;
<A>[0-9]* BEGIN A;
<A>\n BEGIN INITIAL; printf("INT\n");
<A>"." BEGIN B;
<A>[a-zA-Z] BEGIN E;
<B>[0-9] BEGIN C;
<B>\n BEGIN INITIAL; printf("\nREJECTED\n");
<B>"." BEGIN E;
<E>[0-9. ]* BEGIN E;
<E>\n BEGIN INITIAL; printf("\nREJECTED\n");
<C>[0-9]* BEGIN C;
<C>\n BEGIN INITIAL; printf("\nFLOAT\n");
<C>"." BEGIN E;
<D>[a-zA_Z0-9]* BEGIN D;
<D>\n BEGIN INITIAL;printf("IDF\n");
. ;
%%
int main(){
printf("\nEnter the string , [0-9.]:\n");
yylex();
return 0;
}
int yywrap(} { return 1; }

