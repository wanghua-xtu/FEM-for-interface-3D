%show mesh 3D
%% plot interface
% ������������Ͱ뾶
center = [0, -1, 0];       % ��������
radius = 0.66;               % �뾶

% ����������ɫ��͸����
color = [0, 0, 1];        % ������ɫ����ɫ��
alpha = 0.3;              % ͸����

% ���������������
[X, Y, Z] = sphere(50);   % ���������Ͼ��ȷֲ��ĵ�
X = radius * X + center(1);  % ������뾶����������������λ��
Y = radius * Y + center(2);
Z = radius * Z + center(3);

% ��������
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

xlim([-1.1, 1.1]);   % x����ʾ��Χ[-5, 5]
ylim([-1.1, 1.1]);   % y����ʾ��Χ[-1, 1]
zlim([-1.1, 1.1]);   % z����ʾ��Χ[-1, 1]