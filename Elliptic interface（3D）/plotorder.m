h = [1/20 1/40 1/60 1/80 1/100];
L = 5;
DD =     [  1.9361509e-03   5.2991895e-04   2.2044841e-04   1.2653382e-04   7.9361798e-05
   1.8693478e+00   2.1630970e+00   1.9297486e+00   2.0905491e+00 0
   5.6558285e-02   2.8597976e-02   1.8985123e-02   1.4259134e-02   1.1401751e-02
   9.8382532e-01   1.0103958e+00   9.9504982e-01   1.0021832e+00 0];


L2erro = DD(1,:);
H1erro = DD(3,:);





logL2err = log(L2erro);
logH1err = log(H1erro);
logh =log(h(1:L));
save wanghua910.txt L2erro order1 H1erro order2 -ascii 
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