% ����·��˹����
% �������������ԭ�� A, B, C��λ�÷ֱ�Ϊ A_pos, B_pos, C_pos
% һ����Ҫ�ȸ���һ����ʼ��·��˹������ƽ���λ�ã�Ȼ�󲻶ϵ����Ż�
% ���ﲻ���Ǿ����Ż�������ֻ��ʾ�������·��˹���������

r_A = 0.7; % A ԭ�ӵĹ��۰뾶
r_B = 0.9; % B ԭ�ӵĹ��۰뾶
r_C = 0.8; % C ԭ�ӵĹ��۰뾶
A_pos = [-2, 0, 0]; % A ԭ�ӵ�����
B_pos = [2, 0, 0];  % B ԭ�ӵ�����
C_pos = [0, 2.5, 0]; % C ԭ�ӵ�����

npoint = 100; % �������
ntheta = 50;
x = linspace(-10,10,npoint);
y = linspace(-10,10,npoint);
z = linspace(-10,10,npoint);
[xx,yy,zz] = meshgrid(x,y,z);

% ����·��˹�����ˮƽ������
f = (xx - A_pos(1)).^2 + (yy - A_pos(2)).^2 + (zz - A_pos(3)).^2 - r_A^2;
f = min(f, (xx - B_pos(1)).^2 + (yy - B_pos(2)).^2 + (zz - B_pos(3)).^2 - r_B^2);
f = min(f, (xx - C_pos(1)).^2 + (yy - C_pos(2)).^2 + (zz - C_pos(3)).^2 - r_C^2);

% ����·��˹���������
isosurface(xx,yy,zz,f,0);
axis equal;
view(3);
xlabel('x');
ylabel('y');
zlabel('z');

