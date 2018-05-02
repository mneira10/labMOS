
Set
i   COMPLETAR / n1, n2, n3, n4, n5, n6, n7 /;
alias(j,i);

$include "C:\Users\m.neira10\Documents\Modelado\Lab4\entrega\labMOS\parteMatlab\puntos.dat"

Variables
  x(i,j)      COMPLETAR
  z         Objective function  ;

Binary Variable x;

Equations
objectiveFunction        objective function
restr1                    restr1
restr2                    restr2
restr3                    restr2
restr4                    restr2
restr5                    restr2



;

objectiveFunction       ..     z =e= sum((i,j), c(i,j) * x(i,j));



restr1         ..  sum((j), x('n1',j)) =e= 1;

restr2        ..  sum((i), x(i,'n5')) =e= 1;


restr3    ..  sum((i,j), x(i,'n2')) - sum((i,j), x('n2',j)) =e= 0;

restr4    ..  sum((i,j), x(i,'n3')) - sum((i,j), x('n3',j)) =e= 0;

restr5    ..  sum((i,j), x(i,'n4')) - sum((i,j), x('n4',j)) =e= 0;





Model Transport /all/ ;

option mip=CPLEX

*option iterlim = 50000

*option profiletol = 1.0E-2

Solve transport using mip minimizing z;



Display x.l, x.m

Display z.l, z.m