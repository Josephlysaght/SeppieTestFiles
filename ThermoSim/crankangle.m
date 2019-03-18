clear
clc

stroke = 0.085;
bore = 0.083;
conl = 0.1328;
a = stroke/2;
comr = 9.5;
g = 1.4;

v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(comr-1);

v1 = v_swept + v_clearance;
p1 = 100000;
c2 = p1*v1^g;

theta = linspace(0,180,100);
ka = conl./sind(theta);
B_ang = asind(a./ka);
C_ang = 180-(B_ang+theta);
x = ka.*sind(C_ang);
new_b = x-0.0903;
v_comp = ((pi/4)*bore^2.*new_b)+v_clearance;
p_comp = (c2./v_comp.^g)+p1;

%Plot results
hold on 
plot(v_comp,p_comp,'color','b')
xlabel('Volume in m^3')
ylabel('Pressure in Pa')
grid on 
