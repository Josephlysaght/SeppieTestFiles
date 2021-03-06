bore = 0.083;
stroke = 0.085;
comr = 9.5;
g = 1.4;
R=287;

v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(comr-1);

%State 1
p1 = 100000;
v1 = v_swept + v_clearance;
t1 = 320;

%State 2 
v2 = v_clearance;
p2 = (p1*v1)/v2;
t2=t1*comr^(g-1);

%State 3 
v3 = v_clearance;
t3 = 2300;
p3 = (p2*t3)/t2;

%state 4 
v4 = v1;
p4 = p3/((comr)^g);
t4 = t3/(comr)^(g-1);

hold on
plot(v1,p1,'*','color','r')
plot(v2,p2,'*','color','g')
plot(v3,p3,'*','color','b')
plot(v4,p4,'*','color','y')
xlabel('Volume in m^3')
ylabel('Pressure in Pa')
grid on 
