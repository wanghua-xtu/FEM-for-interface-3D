clear,clc
% 定义空间范围
xx = linspace(-10, 10, 100);
yy = linspace(-10, 10, 100);
zz = linspace(-10, 10, 100);
[x, y, z] = meshgrid(xx, yy, zz);

% 计算水平集函数
%f = sin(x) + cos(y) + exp(z);
a = 6; b = 4; 
%f = x.^2.*y.^2 + y.^2.*z.^2 + z.^2.*x.^2 - a*(x.^2+y.^2+z.^2) + b;
%f = (x.^2+y.^2+z.^2).^2 - 2*a*z.*(x.^2+y.^2+z.^2) + a^2.*z.^2 - b.^2.*(x.^2+y.^2);

%心形
%f = (x.^2 + 9/4*y.^2 + z.^2 - 1).^3 - x.^2.*z.^3-9/80*y.^2.*z.^3;

%扭曲的圆环(Twisted Torus) 轮胎？
f = (1 - sqrt(x.^2 + y.^2)).^2 + z.^2 - 0.5^2;


%钻石体(Diamond)
%钻石体是一种晶体结构，其水平集函数可以用四个正弦函数表示：
% f = sin(x).*sin(y).*sin(z) - sin(x).*cos(y).*cos(z) ...
%     - cos(x).*sin(y).*cos(z) - cos(x).*cos(y).*sin(z);
% 
% 
% %蒙面人(M?bius Strip)
% f  = (y.^2 + z.^2 - a^2) .* sin(x/2) - x .* sin(y/2);
% 
% %小花朵(Klein Bottle)
% a = 3; b= 5; c=5;
% f  = (x.^2 + y.^2 + z.^2 + 2*c*y - a).^2 - 4*b^2.* (x.^2 + z.^2);




% 求解等值面
iso = 0;
p = patch(isosurface(x, y, z, f, iso));
set(p,'facecolor',[0.5 0.9 0.45],'edgecolor','k')
%set(p, 'FaceColor', 'b', 'EdgeColor', 'none');

% 调整图形属性
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
view(3);
title('Iso-surface Plot of f(x,y,z) = 0');