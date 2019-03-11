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