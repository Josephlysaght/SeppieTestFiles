stroke = 0.085;
bore = 0.083;
comr = 9.5;
conl = 0.1328;

v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(comr-1);

a = stroke/2;
theta = linspace(0,180,100);
ka = conl./sind(theta);
B_ang = asind(a./ka);
C_ang = 180-(B_ang+theta);
x = ka.*sind(C_ang);
new_b = x-0.0903;
v_comp = ((pi/4)*bore^2.*new_b)+v_clearance;

plot(v_comp,theta);