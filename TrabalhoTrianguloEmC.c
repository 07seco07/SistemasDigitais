#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct Ponto{
	int x;
	int y;
}ponto;


int area (ponto a, ponto b, ponto c){
	ponto m, n;
	int x;
	m.x = b.x - a.x;
	m.y = b.y - a.y;
	n.x = c.x - a.x;
	n.y = c.y - a.y;
	x = (m.x * n.y) - (m.y*n.x);
	return x;
}

int main(){
	ponto A, B, C, P;
	int areaT,areaP;

	printf("Informe Valores (X,Y) dos tres pontos do triangulo: \n");
	scanf("%d %d %d %d %d %d",&A.x, &A.y, &B.x, &B.y, &C.x, &C.y);

	printf("Informe Valores (X,Y) do ponto Desejado: \n");
	scanf("%d %d",&P.x, &P.y);

	areaT = abs(area(A,B,C));
	areaP = abs(area(P,B,C))+abs(area(A,P,C))+abs(area(A,B,P)) ;

	printf("Area do Triangulo: %d \n",areaT);
	printf("Area feito com Ponto: %d \n",areaP);

	if(areaT == areaP){
		printf(" \n O PONTO ESTA DENTRO DO TRIANGULO!! \n");
	}else{
		printf(" \n O PONTO NAO ESTA DENTRO DO TRIANGULO!!  \n");
	}

	return 0;
}

