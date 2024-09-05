% %test transformation
%  M = [0 0 0;
%       1 0 0;
%       0 1 0;
%       0 0 1;
%       1 1 1;
%       0 1 1];
%   i=1;
% for x = 0
%     for y = 0:0.05:1-x
%         for z= 0:0.05:1
%             p(1) = (1-x-y)..*(1-z);
%             p(2) = x..*(1-z); 
%             p(3) = y..*(1-z); 
%             p(4) = (1-x -y)..*z;
%             p(5) = x..*z; 
%             p(6) = y..*z;
%             X(i) = p.*M(:,1);
%             Y(i) = p.*M(:,2);
%             Z(i) = p.*M(:,3);
%             i = i+1;
%         end
%     end
% end
% for y = 0
%     for x = 0:0.05:1-y
%         for z= 0:0.05:1
%             p(1) = (1-x-y)..*(1-z);
%             p(2) = x..*(1-z); 
%             p(3) = y..*(1-z); 
%             p(4) = (1-x -y)..*z;
%             p(5) = x..*z; 
%             p(6) = y..*z;
%             X(i) = p.*M(:,1);
%             Y(i) = p.*M(:,2);
%             Z(i) = p.*M(:,3);
%             i = i+1;
%         end
%     end
% end
% for x = 0:0.05:1
%     for y = 0:0.05:1-x
%         for z= 0:0.1:1
%             p(1) = (1-x-y)..*(1-z);
%             p(2) = x..*(1-z); 
%             p(3) = y..*(1-z); 
%             p(4) = (1-x -y)..*z;
%             p(5) = x..*z; 
%             p(6) = y..*z;
%             X(i) = p.*M(:,1);
%             Y(i) = p.*M(:,2);
%             Z(i) = p.*M(:,3);
%             i = i+1;
%         end
%     end
% end
% 
% plot3(X,Y,Z,'.*')

% syms beta a b c
% A = [0 0 1 0 0 0;
%      0 0 0 1 0 1;
%      0 0 0 0 1 1;
%      0 1./2 1 0 -1./2 -1;
%      1./2 0 1 -1./2 0 -1;
%      1 1 0 -beta -beta 0];
%  det(A)

% h = patch('Faces', [1 2 3 4;3 6 5 4], 'Vertices', [0 0 0;0 1 0; 0.5 1 1; 0 0 1; 1 0 1; 1 1 1]);
% set(h,'facecolor',[0.5 0.9 0.45],'edgecolor','k')

% syms a1 b1 c1  a2 b2 c2  a3 b3 c3  a4 b4 c4  a5 b5 c5  a6 a7 a8 a9 real
% syms X1 X2 Y1 Y2 Z1 Z2 real
% 
% M  = [a1 b1 c1;  a2 b2 c2;  a3 b3 c3;  a4 b4 c4;  a5 b5 c5];
% tet1_phi = [(1-X1).*(1-Y1)+(Y1-1).*Z1;
%             X1.*(1-Y1)-Y1.*Z1;
%             X1.*Y1+Y1.*Z1;
%             (1-X1).*Y1-Y1.*Z1;
%             Z1];
% tet2_phi = [(1-X2).*(1-Y2)+(X2-1).*Z2;
%              X2.*(1-Y2)-X2.*Z2;
%              X2.*Y2+X2.*Z2;
%              (1-X2).*Y2-X2.*Z2;
%              Z2];
% reftet1_gradphi = [Y1-1, X1+Z1-1, Y1-1; 1-Y1, -X1-Z1, -Y1; 
%                 Y1, X1+Z1, Y1; -Y1, 1-X1-Z1, -Y1; 0  0  1];
%             
% reftet2_gradphi = [Y2+Z2-1, X2-1, X2-1; 1-Y2-Z2, -X2, -X2; 
%                 Y2+Z2, X2, X2; -Y2-Z2, 1-X2, -X2; 0  0  1];   
% F1 = M'.*tet1_phi;
% DF1 = [diff(F1(1),X1),diff(F1(1),Y1),diff(F1(1),Z1);
%        diff(F1(2),X1),diff(F1(2),Y1),diff(F1(2),Z1);
%        diff(F1(3),X1),diff(F1(3),Y1),diff(F1(3),Z1)];
% 
%    F2 = M'.*tet2_phi;
% DF2 = [diff(F2(1),X2),diff(F2(1),Y2),diff(F2(1),Z2);
%        diff(F2(2),X2),diff(F2(2),Y2),diff(F2(2),Z2);
%        diff(F2(3),X2),diff(F2(3),Y2),diff(F2(3),Z2)];
%    
%    tet1_gradphi1 = (DF1.^(-1))'.*(reftet1_gradphi(1,:))'



% A = [a1 a2 a3;a4 a5 a6; a7 a8 a9]
% C = (A.^-1.*det(A))'
% C1 = (A').^-1.*det(A)

syms x y z
phi = (0.66 - sqrt(x..^2 + y..^2))..^2 + z..^2 - 0.22.^2;
v = sin(pi.*x)..*sin(pi.*y)..*sin(pi.*z)..*phi;
dv = simplify([diff(v,x),diff(v,y),diff(v,z)])
f = -simplify(diff(dv(1),x)+diff(dv(2),y)+diff(dv(3),z))


