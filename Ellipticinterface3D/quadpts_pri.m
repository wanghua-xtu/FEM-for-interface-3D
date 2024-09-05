function [pXYZ,weight] = quadpts_pri(order)
%% QUADPTS3 quadrature points in prism.

[lambda_Z,weight_Z] = quadpts1(order);
[lambda_XY,weight_XY] = quadpts(order);
Z = lambda_Z(:,2);
X = lambda_XY(:,2); 
Y = lambda_XY(:,3);
k = 1;
pXYZ = zeros(length(lambda_Z)*length(lambda_XY),3);
weight = zeros(length(lambda_Z)*length(lambda_XY),1);
for i = 1:length(lambda_Z)
    for j = 1:length(lambda_XY)   
        weight(k) = weight_Z(i)*weight_XY(j);
        pXYZ(k,:) = [X(j),Y(j),Z(i)];
        k = k + 1;
    end
end



%% Verification
% The order of the quadrature rule is verified by the function
% verifyquadpts. See <matlab:ifem('verifyquadpts') verifyquadpts>.
