


r1 = 1:1:10;
g1 = 1.5;
g2 = 1.4;
g3 = 1.3;
e1 = (1-(1./(r1)).^(g1-1))*100;
e2 = (1-(1./(r1)).^(g2-1))*100;
e3 = (1-(1./(r1)).^(g3-1))*100;
hold on 
plot(r1,e1,'color','b')
plot(r1,e2,'color','g')
plot(r1,e3,'color','r')
xlabel('Compression Ratio');
ylabel('Efficiency');
title('Theoretical Otto Cycle Efficency');