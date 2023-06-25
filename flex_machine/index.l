%{
#include <stdio.h>
#define CAMPO   1
#define BARRA   2
#define FIM     -1
BARRA [/]

%}



%%

[vazios]  {} 
{campo} {return CAMPO;}



%%


int main(){

    int val;
    int estado = 0;
    int contEmails = 0;
    return 0;


    while(val = yylex()){
        if(val == FIM){
            if(estado == 5){
                contEmails++;
            }
            if(contEmails>0){
                printf("%d email(s) valido(S) encontrado(s)!\n", contEmails);
            }else{
                printf("Email invalido\n");
            }
            contEmails = 0;
            estado = 0;
        }else{
            switch(estado){
                case 0:
                    if(val==PARTE) //aceita a primeira parte
                        estado=1;
                    else
                        estado=0;
                    break;
                    
                case 1://já tenho "ivan"
                    if(val==BARRA) //aceita @
                        estado=2;//ivan@
                    else
                        if(val==PARTE) //aceita a primeira parte
                            estado=1;
                        else
                            estado=0;
                    break;		

                case 2:
                    if(val==PARTE) //aceita segunda parte
                        estado=3;//ivan@gmail
                    else
                        estado=0;
                    break;	

                case 3:
                    if(val==BARRA) //aceita ponto
                        estado=4;//ivan@gmail.
                    else
                        if(val==PARTE) //aceita a primeira parte
                            estado=1;
                        else
                            estado=0;
                    break;	

                case 4:
                    if(val==PARTE) //aceita outra parte após o ponto
                        estado=5;//ivan@gmail.com
                    else
                        if(val==PARTE) //aceita a primeira parte
                            estado=1;
                        else
                            estado=0;

                    break;				
                    
                case 5:
                    if(val==PARTE){	//já é um novo e-mail		
                        contEmails++;	
                        estado = 1;
                    }					
                    else
                        if(val==PONTO) //mais um ponto
                            estado=4;//ivan@gmai.com.br
                        else
                            estado=0;
                    break;				
		    }
        }
    }
}

