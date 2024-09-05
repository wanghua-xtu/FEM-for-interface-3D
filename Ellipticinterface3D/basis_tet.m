function [phi,gradphi,pxyz,JF] = basis_tet(elem,node,lambdap)
%% basis_tet return linear tetrahedral basis    
% node  = [0 0 0; 1 0 0; 1 1 0; 0 1 0; 
%          0 0 1; 1 0 1; 1 1 1; 0 1 1];
% elem = [1 2 3 7; 1 2 7 6; 1 6 7 5;
%         1 3 4 7; 1 7 4 8; 1 7 8 5];
% %   node = [0 0 0; 1 0 0; 0 1 0; 0 0 1];
% %   elem = [1 2 3 4];
%   [lambda,weight] = quadpts3(3); %numerical integration formula on tetrahedral 
%   p =2;
%   lambdap = lambda(p,:);
%%
x = [node(elem(:,1),1),node(elem(:,2),1),node(elem(:,3),1),node(elem(:,4),1)];
y = [node(elem(:,1),2),node(elem(:,2),2),node(elem(:,3),2),node(elem(:,4),2)];
z = [node(elem(:,1),3),node(elem(:,2),3),node(elem(:,3),3),node(elem(:,4),3)];

DF = [x(:,2)-x(:,1),x(:,3)-x(:,1),x(:,4)-x(:,1), ...
      y(:,2)-y(:,1),y(:,3)-y(:,1),y(:,4)-y(:,1), ...
      z(:,2)-z(:,1),z(:,3)-z(:,1),z(:,4)-z(:,1)];


JF = ((x(:,2)-x(:,1)).*((y(:,3)-y(:,1)).*(z(:,4)-z(:,1))-(y(:,4)-y(:,1)).*(z(:,3)-z(:,1))) ...
    -(x(:,3)-x(:,1)).*((y(:,2)-y(:,1)).*(z(:,4)-z(:,1))-(y(:,4)-y(:,1)).*(z(:,2)-z(:,1))) ...
    +(x(:,4)-x(:,1)).*((y(:,2)-y(:,1)).*(z(:,3)-z(:,1))-(y(:,3)-y(:,1)).*(z(:,2)-z(:,1))));

adjtranDF =[DF(:,5).*DF(:,9) - DF(:,6).*DF(:,8), DF(:,6).*DF(:,7) - DF(:,4).*DF(:,9), DF(:,4).*DF(:,8) - DF(:,5).*DF(:,7), ...
            DF(:,3).*DF(:,8) - DF(:,2).*DF(:,9), DF(:,1).*DF(:,9) - DF(:,3).*DF(:,7), DF(:,2).*DF(:,7) - DF(:,1).*DF(:,8), ...
            DF(:,2).*DF(:,6) - DF(:,3).*DF(:,5), DF(:,3).*DF(:,4) - DF(:,1).*DF(:,6), DF(:,1).*DF(:,5) - DF(:,2).*DF(:,4)];

%value of phi and gradphi on reference element 
pxyz = lambdap(1)*node(elem(:,1),:) ...
      + lambdap(2)*node(elem(:,2),:) ... 
      + lambdap(3)*node(elem(:,3),:) ... 
      + lambdap(4)*node(elem(:,4),:);
phi = lambdap';
Tgradphi = [-1 -1 -1; 1  0  0; 0  1  0; 0  0  1]';

gradphi = zeros(size(elem,1),3,4); 
for i = 1:4
    gradphi(:,:,i) = [adjtranDF(:,1:3)*Tgradphi(:,i)./JF, ...
                      adjtranDF(:,4:6)*Tgradphi(:,i)./JF, ...
                      adjtranDF(:,7:9)*Tgradphi(:,i)./JF];
end

