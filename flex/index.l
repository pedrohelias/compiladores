WHITESPACE [ ]
TAB [\t]
QUEBRA [\n]
BARRA [/]

DIA_ESPECIAL ([0-2][1-9]|[1-2][0]|[3][0-1])
MES_ESPECIAL ([0][1-9]|[1][0-2])
ANO_ESPECIAL (19[0-9][0-9]|20[0-1][0-9]|202[0-3])

%{
    #include<stdio.h>
    #include<string.h>
    int data=0;
%}

%%
{DIA_ESPECIAL}{BARRA}{MES_ESPECIAL}{BARRA}{ANO_ESPECIAL} {data++;}
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
    printf("%d\n", data);
    return 0;
}

int yywrap()
{
    return 1;
}