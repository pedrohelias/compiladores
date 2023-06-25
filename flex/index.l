%{
#include <stdio.h>
int dataCount = 0;
int val;
%}

DIA [0-3][0-9]|[0-1][0-9]|19[0-9][0-9]
DIA_TOKEN {DIA}{1,2}
MES [1-12]
MES_TOKEN {MES}{1,2}
ANO [1900-2023]
ANO_TOKEN {ANO}{4}
BARRA [/]


%%

{DIA_TOKEN}{BARRA}{MES_TOKEN}{BARRA}{ANO_TOKEN} {dataCount++; printf("datacount = %d\n", dataCount);}



[ \t\n]  {} 



. {printf("data invalida: %s\n", yytext);}




%%


int main(){

    yylex();
    return 0;
}

