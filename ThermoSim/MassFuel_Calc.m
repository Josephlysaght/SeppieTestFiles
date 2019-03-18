clear
clc
bore = 0.083;
stroke = 0.085;
comr = 9.5;
Roh1 = 745;
Roh2 = 1.2;
AFR = 14.7;
Va = AFR/Roh2;
Vp = 1/Roh1;
Vt = Va + Vp;
PercentageV = Vp/Vt;
VE = 0.8;
v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(comr-1);
Disp = v_swept + v_clearance;
V = Disp*VE;
MassFuel = (V*PercentageV)*Roh1;
T3 = 46400000*MassFuel
