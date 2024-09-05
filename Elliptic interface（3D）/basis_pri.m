function [phi,gradphi,pxyz,JF] = basis_pri(elem,node,pX)
% %% basis_pri return bilinear prism basis  
% h = 1/4;
%  node  = [0 0 0; h 0 0; h h 0; 0 h 0; 
%           0 0 h; h 0 h; h h h; 0 h h];
%   elem = [1 2 3 5 6 7; 1 3 4 5 7 8];
% % % % node = [0 0 0; 1 0 0; 0 1 0; 0 0 1];
% % % % elem = [1 2 3 4];
% [X,weight] = quadpts_pri(2); %numerical integration formula on prism
%  p =2;
%  pX = X(p,:);
%%
x = [node(elem(:,1),1),node(elem(:,2),1),node(elem(:,3),1),node(elem(:,4),1),node(elem(:,5),1),node(elem(:,6),1)];
y = [node(elem(:,1),2),node(elem(:,2),2),node(elem(:,3),2),node(elem(:,4),2),node(elem(:,5),2),node(elem(:,6),2)];
z = [node(elem(:,1),3),node(elem(:,2),3),node(elem(:,3),3),node(elem(:,4),3),node(elem(:,5),3),node(elem(:,6),3)];

phi = [(1-pX(1)-pX(2))*(1-pX(3)); pX(1)*(1-pX(3)); pX(2)*(1-pX(3));
       (1-pX(1)-pX(2))*pX(3); pX(1)*pX(3); pX(2)*pX(3)];
Tgradphi = [pX(3)-1,pX(3)-1,pX(1)+pX(2)-1;
            1-pX(3), 0, -pX(1);
            0, 1-pX(3), -pX(2);
            -pX(3), -pX(3), 1-pX(1)-pX(2);
            pX(3), 0, pX(1);
            0, pX(3),pX(2)]';
        
pxyz = [x*phi,y*phi,z*phi];
DF = zeros(size(elem,1),9);
for i = 1:6
    DF = DF + [Tgradphi(1,i)*x(:,i),Tgradphi(2,i)*x(:,i),Tgradphi(3,i)*x(:,i), ...
               Tgradphi(1,i)*y(:,i),Tgradphi(2,i)*y(:,i),Tgradphi(3,i)*y(:,i), ...
               Tgradphi(1,i)*z(:,i),Tgradphi(2,i)*z(:,i),Tgradphi(3,i)*z(:,i)];
end

adjDFtran =[DF(:,5).*DF(:,9) - DF(:,6).*DF(:,8), DF(:,6).*DF(:,7) - DF(:,4).*DF(:,9), DF(:,4).*DF(:,8) - DF(:,5).*DF(:,7), ...
            DF(:,3).*DF(:,8) - DF(:,2).*DF(:,9), DF(:,1).*DF(:,9) - DF(:,3).*DF(:,7), DF(:,2).*DF(:,7) - DF(:,1).*DF(:,8), ...
            DF(:,2).*DF(:,6) - DF(:,3).*DF(:,5), DF(:,3).*DF(:,4) - DF(:,1).*DF(:,6), DF(:,1).*DF(:,5) - DF(:,2).*DF(:,4)];

JF = DF(:,1).*(DF(:,5).*DF(:,9)-DF(:,6).*DF(:,8)) ...
    -DF(:,2).*(DF(:,4).*DF(:,9)-DF(:,6).*DF(:,7)) ...
    +DF(:,3).*(DF(:,4).*DF(:,8)-DF(:,5).*DF(:,7));
%value of phi and gradphi on reference element 
gradphi = zeros(size(elem,1),3,6); 
for i = 1:6
    gradphi(:,:,i) = [adjDFtran(:,1:3)*Tgradphi(:,i)./JF, ...
                      adjDFtran(:,4:6)*Tgradphi(:,i)./JF, ...
                      adjDFtran(:,7:9)*Tgradphi(:,i)./JF];
end

