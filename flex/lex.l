/* 
    Nome: Victor de Souza Cabral	Matrícula: 190038900
    Nome: Pedro Lucas Cassiano Martins	Matrícula: XXX
    Nome: Helias 	Matrícula: XXX
*/

%option noyywrap

/* NAO USADA, ACHO QUE DÁ PRA EXCLUIR e usar: %option noyywrap
int yywrap()
{
    return 1;
}
*/

WHITESPACE [ ]
TAB [\t]
QUEBRA [\n]
BARRA [/]

MES ([0][1-9]|[1][0-2]) {  } /* NAO USADO AINDA */

DIA_30 ([0-2][1-9]|[1-3][0])
DIA_31 ([0-2][1-9]|[1-2][0]|[3][0-1])
MES_30 (0[4]|0[6]|0[9]|1[1])   
MES_31 (0[1]|0[3]|0[5]|0[7]|0[8]|1[0]|1[2])
ANO (19[0-9][0-9]|20[0-1][0-9]|202[0-3])
BISSEXTO (19[13579][26]|19[02468][48]|19[2468]0|201[26]|200[048]|2020)

%{
    #include<stdio.h>
    #include<string.h>
    int data = 0;
    int dataErr = 0;
%}

%%
{DIA_30}{BARRA}{MES_30}{BARRA}{ANO} {data++;}
{DIA_31}{BARRA}{MES_31}{BARRA}{ANO} {data++;}
"29"{BARRA}"02"{BARRA}{BISSEXTO} {data++;}

.   {dataErr++;} /* Resolver */

{WHITESPACE}+
{TAB}+
{QUEBRA}+
"FIM" { yyterminate(); }
%%

int main(void)
{
    yylex();
    printf("%d e %d\n", data, dataErr);
    return 0;
}
