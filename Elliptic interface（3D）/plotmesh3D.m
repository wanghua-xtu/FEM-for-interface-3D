%show mesh 3D
%% plot interface
% 设置球心坐标和半径
center = [0, -1, 0];       % 球心坐标
radius = 0.66;               % 半径

% 设置球面颜色和透明度
color = [0, 0, 1];        % 球面颜色（红色）
alpha = 0.3;              % 透明度

% 创建球体表面数据
[X, Y, Z] = sphere(50);   % 生成球体上均匀分布的点
X = radius * X + center(1);  % 根据球半径和球心坐标调整点的位置
Y = radius * Y + center(2);
Z = radius * Z + center(3);

% 绘制球体
figure;
surf(X, Y, Z, 'FaceColor', color, 'FaceAlpha', alpha, 'EdgeColor', 'none');
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Sphere');
%% plot mesh
box = [-1 1 -1 1 -1 1]; h = 1/2; r = 0.66; example = uint8(9);
T = cubeimesh(box,h,example,r);
hold on
showmesh3(T.node,T.tetelem)

%showmesh3(T.node,T.pyrelem)
pyrface1 = T.pyrelem(:,[1 2 3 4]);
pyrface2 = [T.pyrelem(:,[1 2 5]);T.pyrelem(:,[2 3 5]);T.pyrelem(:,[3 4 5]);T.pyrelem(:,[1 4 5])];
h = patch('Faces', pyrface1, 'Vertices',T.node);
set(h,'facecolor',[0.35 0.75 0.35],'edgecolor','k')
hold on
h = patch('Faces', pyrface2, 'Vertices',T.node);
set(h,'facecolor',[0.35 0.75 0.35],'edgecolor','k')

% %showmesh3(T.node,T.prielem)
% priface1 = [T.prielem(:,[1 2 3]);T.prielem(:,[4 5 6])];
% priface2 = [T.prielem(:,[1 2 5 4]);T.prielem(:,[2 3 6 5]);T.prielem(:,[1 3 6 4])];
% h = patch('Faces', priface1, 'Vertices',T.node);
% set(h,'facecolor',[0.35 0.75 0.35],'edgecolor','k')
% hold on
% h = patch('Faces', priface2, 'Vertices',T.node);
% set(h,'facecolor',[0.35 0.75 0.35],'edgecolor','k')

xlim([-1.1, 1.1]);   % x轴显示范围[-5, 5]
ylim([-1.1, 1.1]);   % y轴显示范围[-1, 1]
zlim([-1.1, 1.1]);   % z轴显示范围[-1, 1]