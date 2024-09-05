function [L2error,H1error] = getFEMerror(example,U,wh,elemnum,none,inte1,inte2,Nelem,...
Ielem1,Ielem2,nonelem,intelem1,intelem2,idxnon,idxint1,idxint2,lambda,weight,r,...
nonsigma,int1sigma,int2sigma1,int2sigma2,int2sigma3,nonb,intb,intb1,intb2,intb3)

L2err = zeros(elemnum,1);
H1err = zeros(elemnum,2);
for p = 1:size(weight)
%% tet elem
%     [Tgrad,nreTphi,pxy,narea] = nbasis(Nelem,none,lambda(p,:)');
%     L2err(idxnon) = L2err(idxnon) + weight(p)*(v(example,pxy,r,nonb) ...
%         - U(nonelem)*nreTphi-wh(nonelem)*nreTphi.*nonsigma).^2.*narea;
%     Tduh = [sum((Tgradx.*U(nonelem)),2),sum((Tgrady.*U(nonelem)),2)];
%     Tdwh = [sum((Tgradx.*wh(nonelem)),2).*nonsigma,sum((Tgrady.*wh(nonelem)),2).*nonsigma];

       
                  
  