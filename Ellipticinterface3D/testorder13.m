clear
box = [-1 1 -1 1 -1 1];
%box = [-2 2 -2 2 -2 2];
h = 2/40;
r = -h/5:h/20:h/5; example = uint8(13);
%box = [-3 3 -3 3 -3 3]; r = 0.67777; example = uint8(3);
L = length(r);

%%
L2erro = zeros(1,L);
H1erro = zeros(1,L);
condA = zeros(1,L);
Linftyerror = zeros(1,L);
position = zeros(1,L);
CA = zeros(1,L);
for i=1:L
    [H1erro(i),L2erro(i),condA(i)] = poissoninterface3D0(box,h,example,r(i));
end

% order1 = log(L2erro(1:L-1)./L2erro(2:L))./log(h(1:L-1)./h(2:L));
% order2 = log(H1erro(1:L-1)./H1erro(2:L))./log(h(1:L-1)./h(2:L));

% logL2err = log(L2erro);
% logH1err = log(H1erro);
% logh =log(h(1:L));
%save wanghua0.txt L2erro order1 H1erro order2 -ascii 