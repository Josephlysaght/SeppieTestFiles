
AFR = 14.7;
V = 0.0045;
VE = 2;


roh1 = 745;
roh2 = 1.2;
Va = AFR/roh2;
Vp = 1/roh1;
Vt = Va + Vp;
PercentageV = Vp/Vt;

v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(comr-1);
Disp = v_swept + v_clearance;
V = Disp*VE;

MassFuel = (V*PercentageV)*roh1;
Q_in = 46400000*MassFuel
