
Set
vars COMPLETAR / A, B, C /;


Scalar s /30/;


Variables
  x(vars)      COMPLETAR
  z         Objective function  ;

Positive Variable x;

Equations
objectiveFunction        objective function
restr1
restr2
restr3
restr4

;

objectiveFunction              ..  z =e= sqrt(s*(s-x("A"))*(s-x("B"))*(s-x("C")))  ;
restr1 .. x("A")=g=1;
restr2 .. x("B")=g=1;
restr3 .. x("C")=g=1;
restr4 .. x("A") + x("B") + x("C") =e= s*2;


Model model1 /all/ ;
option nlp = CONOPT;
Solve model1 using nlp maximizing z;

Display x.l;
Display z.l;
