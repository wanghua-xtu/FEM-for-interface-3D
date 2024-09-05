clear
box = [-1 1 -1 1 -1 1];
%box = [-2 2 -2 2 -2 2];
h = 1/10;
r = -0.2:h/20:0.2; 

example = uint8(14);
%box = [-3 3 -3 3 -3 3]; r = 0.67777; example = uint8(3);
L = length(r);

%%
L2erro = zeros(1,L);
H1erro = zeros(1,L);
condA = zeros(1,L);
Linftyerror = zeros(1,L);
position = zeros(1,L);
CA = zeros(1,L);
for i=1:L
    [H1erro(i),L2erro(i),condA(i)] = poissoninterface3D0(box,h,example,r(i));
end

plot(r,condA)
%输入“latex代码格式”的图例字符串，并获取该图例的句柄
%handle = legend('cond(A)', 'location','southeast');  
%set(handle,'interpreter','latex');
%set(handle,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',17)
xlabel({'\xi'},'Fontname','Times New Roman','FontSize',17)
ylabel({'cond(A)'},'Fontname','Times New Roman','FontSize',17)
set(gca,'FontSize',20)

figure (2)
plot(r,H1erro); hold on ; plot(r,L2erro);
%输入“latex代码格式”的图例字符串，并获取该图例的句柄
handle = legend('$|u-u_h|_{H^1(\Omega)}$', '$\|u-u_h\|_{L^2(\Omega)}$','location','southeast');  
set(handle,'interpreter','latex');
set(handle,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',17)
xlabel({'\xi'},'Fontname','Times New Roman','FontSize',17)
ylabel({'error'},'Fontname','Times New Roman','FontSize',17)
set(gca,'FontSize',20)