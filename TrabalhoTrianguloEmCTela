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
	int matriz[25][25];
	int i,t;

	printf("Informe Valores (X,Y) dos tres pontos do triangulo: \n");
	scanf("%d %d %d %d %d %d",&A.x, &A.y, &B.x, &B.y, &C.x, &C.y);
	areaT = abs(area(A,B,C));

	for(i=60;i>=0;i--){
		P.x = i;
		P.y = 1;
		areaP = abs(area(P,B,C))+abs(area(A,P,C))+abs(area(A,B,P));
		if(areaT == areaP){
			printf("+");
		}else{
			printf("-");
		}

		for(t=1;t<=60;t++){
			P.x = i;
			P.y = t;
			areaP = abs(area(P,B,C))+abs(area(A,P,C))+abs(area(A,B,P));
			if(areaT == areaP){
				printf("+");
			}else{
				printf("-");
			}
		}

		printf("\n");
	}


	return 0;
}
