
Set
jugadores   COMPLETAR / j1, j2, j3, j4, j5, j6, j7 /;

Set
atributos / a1, a2 , a3, a4 /;

Parameter ataque(jugadores)
/  j1 1, j2 0, j3 1, j4 0, j5 1, j6 0, j7 1 /;

Parameter centro(jugadores)
/  j1 0, j2 1, j3 0, j4 1, j5 0, j6 1, j7 0 /;


Parameter defensa(jugadores)
/  j1 0, j2 0, j3 1, j4 1, j5 1, j6 1, j7 1 /;




Table puntos(jugadores,atributos) costo del enlace ij
                 a1      a2      a3      a4
j1               3       3       1       3
j2               2       1       3       2
j3               2       3       2       2
j4               1       3       3       1
j5               3       3       3       3
j6               3       1       2       3
j7               3       2       2       1  ;


Variables
  x(jugadores)      COMPLETAR
  z         Objective function  ;

Binary Variable x;

Equations
objectiveFunction        objective function
restr1                    restr1
restr2                    restr2
restr3                    restr2
restr4                    restr2
restr5                    restr2

restr6
restr7
restr8

;

objectiveFunction              ..  z =e= sum((jugadores),x(jugadores)*puntos(jugadores,"a4"));

restr1                          ..  sum((jugadores), x(jugadores) ) =e= 5;
restr2                          ..  sum((jugadores), x(jugadores)*defensa(jugadores))  =g= 4;
restr3                          ..  sum((jugadores), x(jugadores)*ataque(jugadores))  =g= 2;
restr4                          ..  sum((jugadores), x(jugadores)*centro(jugadores))  =g= 1;


restr6                          ..  sum((jugadores), puntos(jugadores,"a2")*x(jugadores))/5  =g= 2;
restr5                          ..  sum((jugadores), puntos(jugadores,"a1")*x(jugadores))/5  =g= 2;
restr7                          ..  sum((jugadores), puntos(jugadores,"a3")*x(jugadores))/5  =g= 2;
restr8 .. 1-x("j2") =g= x("j3");

Model model1 /all/ ;
option mip = CPLEX;
Solve model1 using mip maximizing z;

Display x.l;
Display z.l;
