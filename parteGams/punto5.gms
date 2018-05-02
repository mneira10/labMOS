
Set
vars COMPLETAR / V, P, T, A, B, C /;




Variables
  x(vars)      COMPLETAR
  z         Objective function  ;

Positive Variable x;

Equations
objectiveFunction        objective function
restr1                    restr1
restr2                    restr2
restr3                    restr2
restr4                    restr2
restr5                    restr2

restr6
restr7


;

objectiveFunction              ..  z =e= 300+0.8*x("V") + 0.01*x("P") +0.06*x("T") + 0.001*x("T")*x("P")-0.01*x("T")*x("T")
-0.001*x("P")*x("P") + 11.7*x("A")+9.4*x("B")+16.4*x("C") + 19*x("A")*x("B")
+11.4*x("A")*x("C") - 9.6*x("B")*x("C");

restr1                          ..  x("V") =l= 5;
restr2                          ..  x("V")  =g= 1;
restr3                          ..  x("P") =g= 200;
restr4                          ..  x("P") =l= 400;
restr6                          ..  x("T") =g= 100;
restr5                          ..  x("T")  =l= 200;
restr7                          ..  x("A")+x("B") + x("C") =e= 1;


Model model1 /all/ ;
option nlp = CONOPT;
Solve model1 using nlp maximizing z;

Display x.l;
Display z.l;
