BB= [10 5.7752596e-04  0 1.4259550e-02 0
20 1.4484883e-04 1.99 7.1144348e-03 1.00
30 6.4635222e-05 1.99 4.7430870e-03 0.99
40 3.6399710e-05 1.99 3.5556345e-03 1.00
50 2.3321740e-05 1.99 2.8437378e-03 1.00];
L = 5;
L2erro = BB(:,2);
H1erro = BB(:,4);
h = 1./BB(:,1);
order1 = log(L2erro(1:L-1)./L2erro(2:L))./log(h(1:L-1)./h(2:L));
order2 = log(H1erro(1:L-1)./H1erro(2:L))./log(h(1:L-1)./h(2:L));

logL2err = log(L2erro);
logH1err = log(H1erro);
logh =log(h(1:L));
%save wanghua910.txt L2erro order1 H1erro order2 -ascii 
figure(2)
p1=polyfit(logh,logL2err,1);
y1= p1(2)+p1(1)*logh;
% plot(logh,y1,'-','MarkerSize',8,'MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2);
% hold on

plot(logh,logL2err,'o-','MarkerSize',8,'MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2);
hold on

plot(logh,logH1err,'*-','MarkerSize',8,'MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',2);
% hold on
% plot(logh,logLinftyerr,'+-');

tk = 3; a = 0.5; b = 0.5; c = -0.1;
triang_x = [logh(tk), logh(tk)+a, logh(tk)+a,logh(tk)];  % chose location
triang_y = [logL2err(tk)-b,logL2err(tk)-b,logL2err(tk)-b+2*a,logL2err(tk)-b];
plot(triang_x, triang_y, 'k','LineWidth',1.5)
text((triang_x(1)+triang_x(3))/2,(triang_y(1)+triang_y(3))/2+c,'k=2','FontSize',10,'FontWeight','bold');

hold on
tk = 3; a = 0.5; b = 0.5; c = -0.1;
triang_x = [logh(tk), logh(tk)+a, logh(tk)+a,logh(tk)];  % chose location
triang_y = [logH1err(tk)-b,logH1err(tk)-b,logH1err(tk)-b+a,logH1err(tk)-b];
plot(triang_x, triang_y, 'k','LineWidth',1.5)
text((triang_x(1)+triang_x(3))/2,(triang_y(1)+triang_y(3))/2+c,'k=1','FontSize',10,'FontWeight','bold');


%输入“latex代码格式”的图例字符串，并获取该图例的句柄
handle = legend('$\|u-u_h\|_{0,\Omega}$','$|u-u_h|_{1,\Omega}$','location','southeast');  
set(handle,'interpreter','latex');
set(handle,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',17)
xlabel({'log(h)'},'Fontname','Times New Roman','FontSize',17)
ylabel({'log(Error)'},'Fontname','Times New Roman','FontSize',17)

set(gca,'FontSize',20)