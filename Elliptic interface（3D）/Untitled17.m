% 定义三维水平集函数
[x, y, z] = meshgrid(-2:0.05:2);  % 定义一个网格
f =  (x.^2 + 9/4*y.^2 + z.^2 - 1).^3 - x.^2.*z.^3 - 9/80*y.^2.*z.^3;     % 定义函数，这里以一个简单的球体为例

% 画出曲面图
figure;
isosurface(x, y, z, f, 0);       % f为水平集函数，0为水平集值

 
% axis equal;
% xlabel('x');
% ylabel('y');
% zlabel('z');
% title('Isosurface of 3D Level Set Function');

