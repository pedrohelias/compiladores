WHITESPACE [ ]
TAB [\t]
QUEBRA [\n]
BARRA [/]

DIA_ESPECIAL ([0-2][1-9]|[1-2][0]|[3][0-1])
MES_ESPECIAL ([0][1-9]|[1][0-2])
ANO_ESPECIAL (19[0-9][0-9]|20[0-1][0-9]|202[0-3])
MES_30 (0[4]|0[6]|0[9]|1[1])   
DIA_30 ([0-2][1-9]|[1-3][0])
MES_31 (0[1]|0[3]|0[5]|0[7]|0[8]|1[0]|1[2])



%{
    #include<stdio.h>
    #include<string.h>
    int data=0;
    int dataErr=0;
%}

%%

{DIA_30}{BARRA}{MES_30}{BARRA}{ANO_ESPECIAL} {data++;}
{DIA_ESPECIAL}{BARRA}{MES_31}{BARRA}{ANO_ESPECIAL} {data++;}


{WHITESPACE}+
{TAB}+
{QUEBRA}+
"FIM" { yyterminate(); }
.   { /* Ignore outros caracteres */ }
%%
int yywrap();

int main(void)
{
    yylex();
    printf("%d e %d\n", data, dataErr);
    return 0;
}

int yywrap()
{
    return 1;
}