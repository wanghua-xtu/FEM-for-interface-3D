n = 100; % ������
u = linspace(0, 2*pi, n);
v = linspace(0, 2*pi, n);
[U,V] = meshgrid(u,v);
r = 1 - cos(U);
x = r .* cos(U) .* cos(V);
y = r .* sin(U) .* cos(V);
z = sin(V);

% ��������
surf(x, y, z);
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
title('Heart-shaped Cosine Surface');