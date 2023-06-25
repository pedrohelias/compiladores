%{
#include <stdio.h>
%}

DIA [1-31]
DIA_TOKEN {DIA}+
MES [1-12]
MES_TOKEN {MES}+
ANO [1900-2023]
ANO_TOKEN {ANO}+
BARRA [/]


%%

{DIA_TOKEN}{BARRA}{MES_TOKEN}{BARRA}{ANO_TOKEN} {printf("Data valida!\n");}

[ \t\n]  {} 
. {printf("data invalida: %s\n", yytext);}

%%


int main(){

    yylex();
    return 0;
}

