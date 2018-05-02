
Set
pueblos   COMPLETAR / p1, p2, p3, p4, p5, p6 /;

Table tiempos(pueblos,pueblos) costo del enlace ij
                 p1      p2      p3      p4    p5    p6
p1               0       10      20      30    30    20
p2               10      0       25      35    20    10
p3               20      25      0       15    30    20
p4               30      35      15      0     15    25
p5               30      20      30      15    0     14
p6               20      10      20      25    14    0;

Table tiemposInferioresa15(pueblos,pueblos)
                 p1      p2      p3      p4    p5    p6
p1               1       1       0       0     0     0
p2               1       1       0       0     0     1
p3               0       0       1       1     0     0
p4               0       0       1       1     1     0
p5               0       0       0       1     1     1
p6               0       1       0       0     1     1;

Variables
  x(pueblos)      COMPLETAR
  z         Objective function  ;

Binary Variable x;

Equations
objectiveFunction        objective function
restr1                    restr1
* restr2                    restr2
* restr3                    restr2
* restr4                    restr2
* restr5                    restr2

* restr6


;

objectiveFunction              ..  z =e= sum((pueblos),x(pueblos));

restr1 ..
 sum((pueblos), x(pueblos)*tiemposInferioresa15("p1",pueblos))
+sum((pueblos), x(pueblos)*tiemposInferioresa15("p2",pueblos))
+sum((pueblos), x(pueblos)*tiemposInferioresa15("p3",pueblos))
+sum((pueblos), x(pueblos)*tiemposInferioresa15("p4",pueblos))
+sum((pueblos), x(pueblos)*tiemposInferioresa15("p5",pueblos))
+sum((pueblos), x(pueblos)*tiemposInferioresa15("p6",pueblos)) =g=6;

Model model1 /all/ ;
option mip = CPLEX;
Solve model1 using mip minimizing z;

Display x.l;
Display z.l;
