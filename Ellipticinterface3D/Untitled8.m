condA = 1.0e+06 *[  3.2214    3.9915    1.9365    1.9245    3.9967    3.2214    4.1381    3.2750    3.2750    4.1381    3.2214    3.9967    1.9245    1.9365    3.9915    3.2214    4.1521    3.2455    3.2452    4.1521    3.2214];

H1error =[   0.1813    0.1779    0.1719    0.1719    0.1779    0.1816    0.1788    0.1731    0.1731    0.1788    0.1817    0.1779    0.1719    0.1719    0.1779    0.1816    0.1788    0.1731    0.1730    0.1788     0.1817];
    
L2error =[   0.0103    0.0109    0.0108    0.0108    0.0109    0.0103    0.0098    0.0093    0.0093    0.0098    0.0103    0.0109    0.0108    0.0108    0.0109    0.0103    0.0098    0.0093    0.0093    0.0098    0.0103];

theta = 0:(2*pi)/20:(2*pi) 
plot(theta,condA)
xlim([0,2*pi])
%输入“latex代码格式”的图例字符串，并获取该图例的句柄
%handle = legend('cond(A)', 'location','southeast');  
%set(handle,'interpreter','latex');
%set(handle,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',17)
xlabel({'\theta'},'Fontname','Times New Roman','FontSize',17)
ylabel({'cond(A)'},'Fontname','Times New Roman','FontSize',17)
set(gca,'FontSize',20)

figure (2)
plot(theta,H1error); hold on ; plot(theta,L2error);
xlim([0,2*pi])
%输入“latex代码格式”的图例字符串，并获取该图例的句柄
handle = legend('$|u-u_h|_{H^1(\Omega)}$', '$\|u-u_h\|_{L^2(\Omega)}$','location','southeast');  
set(handle,'interpreter','latex');
set(handle,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',17)
xlabel({'\theta'},'Fontname','Times New Roman','FontSize',17)
ylabel({'error'},'Fontname','Times New Roman','FontSize',17)
set(gca,'FontSize',20)