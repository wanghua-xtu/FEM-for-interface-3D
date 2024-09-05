%T = IFmesh3d(box,example)
syms x y z r1 r2 r3
phi = (x-r1)^2+(y-r2)^2+(z-r3)^2-4;
u = phi;
uxx = diff(diff(u,x),x);
uyy = diff(diff(u,y),y);
uzz = diff(diff(u,z),z);
f = -(uxx+uyy+uzz);
du = [diff(u,x),diff(u,y),diff(u,z)];
vectorize(f)
vectorize(du)

% box = [-1 1 -1 1 -1 1]; h = 1/2; r = 100; example = uint8(1);
% T = cubeimesh(box,h,example,r);
% figure(1)
% showmesh3(T.node,T.tetelem)
% 
% [node,elem] = cubemesh([-1,1,-1,1,-1,1],h); 
% figure(2)
% showmesh3(node,elem)

% v=[0 0 0;0 50 0;50 0 0;0 0 50;50 0 50;0 50 50;];     
% f= [1 2 3 1;1 2 6 4;2 3 5 6;1 3 5 4;4 5 6 4];
% patch('Faces',f,'Vertices',v,'FaceColor','r');
% view(135,30)
% alpha(0.5)