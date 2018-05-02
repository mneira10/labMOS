
Set
puntos COMPLETAR / 1, 2, 3, 4 /;
Set
sol la solucion / 1, 2 /;


Parameter xs(puntos)
/  1 2, 2 6, 3 2, 4 6 /;
Parameter ys(puntos)
/  1 1, 2 1, 3 5, 4 5 /;
Parameter demanda(puntos)
/  1 100, 2 200, 3 300, 4 400 /;
Variables
  x(sol)      COMPLETAR
  z         Objective function  ;

Positive Variable x;

Equations
objectiveFunction        objective function

;

objectiveFunction              ..  z =e= sum((puntos), demanda(puntos) * sqrt((xs(puntos) - x("1"))*(xs(puntos) - x("1")) +
 (ys(puntos) - x("2")) * (ys(puntos) - x("2"))))  ;


Model model1 /all/ ;
option nlp = CONOPT;
Solve model1 using nlp minimizing z;

Display x.l;
Display z.l;
