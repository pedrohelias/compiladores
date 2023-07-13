/*  Pedro Helias Carlos 140158278
    Pedro Lucas Cassiano Martins 190036567
    Victor de Souza Cabral 190038900
*/
WHITESPACE [ ]
TAB [\t]
QUEBRA [\n]
BARRA [/]

DIA_30 ([0-2][1-9]|[1-3][0])
DIA_31 ([0-2][1-9]|[1-2][0]|[3][0-1])
DIA_28 ([0-1][1-9]|[1-2][0]|[2][1-8])

MES_30 (0[4]|0[6]|0[9]|1[1])   
MES_31 (0[1]|0[3]|0[5]|0[7]|0[8]|1[0]|1[2])

ANO (19[0-9][0-9]|20[0-1][0-9]|202[0-3])
BISSEXTO (19[13579][26]|19[2468][048]|19[0][48]|201[26]|200[048]|2020)

%{
    #include<stdio.h>
    #include<string.h>
    int data = 0;
%}

%%
{DIA_30}{BARRA}{MES_30}{BARRA}{ANO} {data++;}
{DIA_31}{BARRA}{MES_31}{BARRA}{ANO} {data++;}
{DIA_28}{BARRA}"02"{BARRA}{ANO} {data++;}
"29"{BARRA}"02"{BARRA}{BISSEXTO} {data++;}
. 
{WHITESPACE}+
{TAB}+
{QUEBRA}+
%%

int yywrap();
int main(void)
{
    int token = yylex();

    printf("%d\n", data);
    return 0;
}
int yywrap()
{
    return 1;
}
