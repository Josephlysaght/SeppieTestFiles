%Piston Kinematics
% x = stroke/2;
% x1 = conl/x;
% theta = linspace(0,180,100);
% y1 = 0.5*(comr-1);
% y2 = x1+1-cosd(theta);
% y3 = (x1^2-sind(theta).^2).^0.5;

% a = stroke/2;
% theta = linspace(0,180,100);
% ka = conl./sind(theta);
% B_ang = asind(a./ka);
% C_ang = 180-(B_ang+theta);
% x = ka.*sind(C_ang);
% v_comp1 = ((pi/4)*bore^2.*x)+v_clearance;

%State 1 inputs and calculations
p1 = P_In;
t1 = T_In;
v1 = v_swept+v_clearance;
T_Out - t1;

%State 2 calculations
v2 = v_clearance';
p2 = (p1*v1/v2)^g;
c2 = p1*v1^g;
% v_comp = (1+y1*(y2-y3)).*v_clearance;
p_comp = c2./v_comp1.^g;
t2 = p2*v2*t1/(p1*v1);

%State 3 calculations
v3 = v2;
p3 = p2*t3/t2;
c3 = p3*v3^g;
v_expan = v_comp1;
p_expan = c3./v_expan.^g;

%State 4 calculations
v4 = v1;
p4 = p3*v3^g/v4^g;

%Volume calculations
v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(comr-1);
v_max = v_swept + v_clearance;
v_min = v_clearance;

%State 1 calculations
v1 = v_max;
t1 = T_In;
p1 = P_In;

%State 2 Calculation
v2 = v_min;
p2 = ((p1*v1)/v2)^g;
t2 = p2*v2*t1/(p1*v1);
c2 = p1*v1^g;
 
%piston kinematics
a = stroke/2;
theta = linspace(0,180,100);
ka = conl./sind(theta);
B_ang = asind(a./ka);
C_ang = 180-(B_ang+theta);
x = ka.*sind(C_ang);
new_b = x-0.0903;
v_comp = ((pi/4)*bore^2.*new_b)+v_clearance;
p_comp = (c2./v_comp.^g)+p1;

%State 3 Calculations
v3 = v_min;
t3 = T_max;
p3 = p2*t3/t2;
c3 = p3*v3^g;

%expansion 
v_exp = v_comp;
p_exp = c3./v_exp.^g;

%State 4 Calculations 
v4 = v_max;
p4 = (p3*v3/v4)^g;
t4 = p4*v4*t3/(p3*v3); 

%Output to rest of model
T_Out = t4;
P_Out = p4;


%Plot results
hold on 
plot(v1,p1,'*','color','g')
%plot(v_comp,p_comp,'color','b')
%plot(v2,p2,'*','color','r')
%plot([v2 v3],[p2 p3],'color','b')
plot(v3,p3,'*','color','g')
plot(v_exp,p_exp,'color','b')
plot(v4,p4,'*','color','r')
plot([v4 v1],[p4 p1],'color','b')
xlabel('Volume in m^3')
ylabel('Pressure in Pa')
grid on 