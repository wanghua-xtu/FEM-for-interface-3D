function  [H1erro,L2erro] = poissoninterface3D(box,h,example,r)
%box = [-1 1 -1 1 -1 1]; h = 1/2; r = 1.5; example = uint8(1);
%% 合成刚度矩阵以及右端项
T = cubeimesh(box,h,example,r);
pde = ellitpicinterface3Ddata;
Ndof = size(T.node,1);
A = sparse(Ndof,Ndof);
%Aw = sparse(Ndof,Ndof);
F = zeros(Ndof,1);
[lambda_tet,weight_tet] = quadpts3(5);%四面体数值积分
[X_pri,weight_pri] = quadpts_pri(5);

 %%% 处理非齐次跳跃,定义跳跃w,g的插值


nump_tet = length(weight_tet); %积分点数目
nump_pri = length(weight_pri);
n_tet = size(T.tetelem,1);
n_pyr = size(T.pyrelem,1);
n_pri = size(T.prielem,1);
% tet elem
 for p = 1:nump_tet
     tic
     [phi,gradphi,pxyz,JF] = basis_tet(T.tetelem,T.node,lambda_tet(p,:));  
     f = pde.f(example,pxyz,T.tetsign,r);
     b = pde.beta(example,pxyz,T.tetsign,r);
     z = pde.Eg1(example,pxyz,T.tetsign,r);
     Fi = zeros(n_tet,4);
     for i = 1:4
        Fi(:,i) = weight_tet(p)*phi(i)*f.*JF/6 - weight_tet(p)*b.*dot(gradphi(:,:,i),z,2).*JF/6;
        for j = i:4   
            Aij = weight_tet(p)*b.*dot(gradphi(:,:,i),gradphi(:,:,j),2).*JF/6;
             if (j==i)
                 A = A + sparse(T.tetelem(:,i),T.tetelem(:,j),Aij,Ndof,Ndof);
             else
                 A = A + sparse([T.tetelem(:,i);T.tetelem(:,j)],[T.tetelem(:,j);T.tetelem(:,i)],...
                     [Aij; Aij],Ndof,Ndof);  
             end  
        end  
     end
      F = F + accumarray(T.tetelem(:),Fi(:),[Ndof 1]);
 end
 % pri elem
 for p = 1:nump_pri
     [phi,gradphi,pxyz,JF] = basis_pri(T.prielem,T.node,X_pri(p,:));
     f = pde.f(example,pxyz,T.prisign,r);
     b = pde.beta(example,pxyz,T.prisign,r);
     z = pde.Eg1(example,pxyz,T.prisign,r);
     Fi = zeros(n_pri,6);
     for i = 1:6
        Fi(:,i) = weight_pri(p)*phi(i)*f.*JF/2- weight_pri(p)*b.*dot(gradphi(:,:,i),z,2).*JF/2;
        for j = i:6   
            Aij = weight_pri(p)*b.*dot(gradphi(:,:,i),gradphi(:,:,j),2).*JF/2;
            if (j==i)
                 A = A + sparse(T.prielem(:,i),T.prielem(:,j),Aij,Ndof,Ndof);
             else
                 A = A + sparse([T.prielem(:,i);T.prielem(:,j)],[T.prielem(:,j);T.prielem(:,i)],...
                     [Aij; Aij],Ndof,Ndof);  
            end
        end
     end
     F = F + accumarray(T.prielem(:),Fi(:),[Ndof 1]);
 end

  % pyr elem
 for p = 1:nump_tet %金字塔积分点个数为四面体的两倍
     [Tet1_phi,Tet2_phi,t1_gradphi,t2_gradphi,pxyz1,pxyz2,JF1,JF2] = basis_pyr(T.pyrelem,T.node,lambda_tet(p,:));
     f1 = pde.f(example,pxyz1,r);
     f2 = pde.f(example,pxyz2,r); 
     b1 = pde.beta(example,pxyz1,T.pyrsign,r);
     b2 = pde.beta(example,pxyz2,T.pyrsign,r);
     z1 = pde.Eg1(example,pxyz1,T.pyrsign,r);
     z2 = pde.Eg1(example,pxyz2,T.pyrsign,r);
     Fi = zeros(n_pyr,5);
     for i = 1:5
        Fi(:,i) = weight_tet(p)*(Tet1_phi(i)*f1.*JF1/6+Tet2_phi(i)*f2.*JF2/6)...
                 - weight_tet(p)*(b1.*dot(t1_gradphi(:,:,i),z1,2).*JF1/6+b2.*dot(t2_gradphi(:,:,i),z2,2).*JF2/6);
        for j = i:5   
            Aij = weight_tet(p)*(b1.*dot(t1_gradphi(:,:,i),t1_gradphi(:,:,j),2).*JF1/6 ...
                  + b2.*dot(t2_gradphi(:,:,i),t2_gradphi(:,:,j),2).*JF2/6);
             if (j==i)
                 A = A + sparse(T.pyrelem(:,i),T.pyrelem(:,j),Aij,Ndof,Ndof);
             else
                 A = A + sparse([T.pyrelem(:,i);T.pyrelem(:,j)],[T.pyrelem(:,j);T.pyrelem(:,i)],...
                     [Aij; Aij],Ndof,Ndof);  
             end
        end
     end
     F = F + accumarray(T.pyrelem(:),Fi(:),[Ndof 1]);
 end
 %% boundary condition
 fixedNode = T.bdnodeidx;
 freeNode = ~T.bdnodeidx;
U = zeros(Ndof,1);
U(fixedNode) = pde.exactu(example,T.node(fixedNode,:),T.vsign(fixedNode),r);
F = F - A*U;
%U(freeNode) = A(freeNode,freeNode)\F(freeNode);
[x,info] = amg(A(freeNode,freeNode),F(freeNode));
U(freeNode)=x;
% n0 = (2/h+1)^3;
% err0 = sqrt(sum((U - pde.exactu(example,T.node,r)).^2))*h^(3/2);
% errinfty = max(abs((U - pde.exactu(example,T.node,r))));
% [err0,errinfty]

%% get error
L2erro = 0; H1erro =0;
%tetelem
 for p = 1:nump_tet
     [phi,gradphi,pxyz,JF] = basis_tet(T.tetelem,T.node,lambda_tet(p,:));  
     u = pde.exactu(example,pxyz,T.tetsign,r);
     uh = U(T.tetelem)*phi;
     du = pde.gradu(example,pxyz,T.tetsign,r);
     z = pde.g1(example,pxyz,T.tetsign,r);
     gz =  pde.Eg1(example,pxyz,T.tetsign,r);
     duh = zeros(n_tet,3);
     for i = 1:4
         duh =  [gradphi(:,1,i).*U(T.tetelem(:,i)),gradphi(:,2,i).*U(T.tetelem(:,i)), ...
                gradphi(:,3,i).*U(T.tetelem(:,i))] + duh;
     end
     L2erro = L2erro + weight_tet(p)*sum((u-uh-z).^2.*JF/6);
     H1erro = H1erro + weight_tet(p)*sum(sum((du-duh-gz).^2.*repmat(JF,1,3)/6));
 end 
 
 %pri elem
  for p = 1:nump_pri
     [phi,gradphi,pxyz,JF] = basis_pri(T.prielem,T.node,X_pri(p,:));
     u = pde.exactu(example,pxyz,T.prisign,r);
     uh = U(T.prielem)*phi;
     du = pde.gradu(example,pxyz,T.prisign,r);
     z = pde.g1(example,pxyz,T.prisign,r);
     gz =  pde.Eg1(example,pxyz,T.prisign,r);
     duh = zeros(n_pri,3);
     for i = 1:6
         duh =  [gradphi(:,1,i).*U(T.prielem(:,i)),gradphi(:,2,i).*U(T.prielem(:,i)), ...
                gradphi(:,3,i).*U(T.prielem(:,i))] + duh;
     end
     L2erro = L2erro + weight_pri(p)*sum((u-uh-z).^2.*JF/2);
     H1erro = H1erro + weight_pri(p)*sum(sum((du-duh-gz).^2.*repmat(JF,1,3)/2));
  end 
 
  %pyr elem
  for p = 1:nump_tet
     [Tet1_phi,Tet2_phi,t1_gradphi,t2_gradphi,pxyz1,pxyz2,JF1,JF2] = basis_pyr(T.pyrelem,T.node,lambda_tet(p,:));
     u1 = pde.exactu(example,pxyz1,T.pyrsign,r);
     u2 = pde.exactu(example,pxyz2,T.pyrsign,r);
     uh1 = U(T.pyrelem)*Tet1_phi;
     uh2 = U(T.pyrelem)*Tet2_phi;
     du1 = pde.gradu(example,pxyz1,T.pyrsign,r);
     du2 = pde.gradu(example,pxyz2,T.pyrsign,r);
     z1 = pde.g1(example,pxyz1,T.pyrsign,r);
     gz1 =  pde.Eg1(example,pxyz1,T.pyrsign,r);
     z2 = pde.g1(example,pxyz2,T.pyrsign,r);
     gz2 =  pde.Eg1(example,pxyz2,T.pyrsign,r);
     duh1 = zeros(n_pyr,3);
     duh2 = zeros(n_pyr,3);
     for i = 1:5
         duh1 =  [t1_gradphi(:,1,i).*U(T.pyrelem(:,i)),t1_gradphi(:,2,i).*U(T.pyrelem(:,i)), ...
                 t1_gradphi(:,3,i).*U(T.pyrelem(:,i))] + duh1;
         duh2 =  [t2_gradphi(:,1,i).*U(T.pyrelem(:,i)),t2_gradphi(:,2,i).*U(T.pyrelem(:,i)), ...
                 t2_gradphi(:,3,i).*U(T.pyrelem(:,i))] + duh2;
     end
     L2erro = L2erro + weight_tet(p)*(sum((u1-uh1-z1).^2.*JF1/6)+sum((u2-uh2-z2).^2.*JF2/6));
     H1erro = H1erro + weight_tet(p)*(sum(sum((du1-duh1-gz1).^2.*repmat(JF1,1,3)/6))+sum(sum((du2-duh2-gz2).^2.*repmat(JF2,1,3)/6)));
  end 
 
 H1erro = sqrt(H1erro);
 L2erro = sqrt(L2erro);