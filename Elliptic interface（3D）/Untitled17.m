% ������άˮƽ������
[x, y, z] = meshgrid(-2:0.05:2);  % ����һ������
f =  (x.^2 + 9/4*y.^2 + z.^2 - 1).^3 - x.^2.*z.^3 - 9/80*y.^2.*z.^3;     % ���庯����������һ���򵥵�����Ϊ��

% ��������ͼ
figure;
isosurface(x, y, z, f, 0);       % fΪˮƽ��������0Ϊˮƽ��ֵ

 
% axis equal;
% xlabel('x');
% ylabel('y');
% zlabel('z');
% title('Isosurface of 3D Level Set Function');

