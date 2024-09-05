clear
box = [-1 1 -1 1 -1 1];
%box = [-2 2 -2 2 -2 2];
 r = 0.5+0.01; example = uint8(11);
%box = [-3 3 -3 3 -3 3]; r = 0.67777; example = uint8(3);
L = 5;
h = [1/20 1/40 1/60 1/80 1/100];
%h = [2/10 2/20 2/30 2/40 2/50 2/60 2/70];
%h = [2/10 2/12 2/14 2/16 2/18 2/20 2/22 2/24 2/26 2/28 2/30 2/32 2/36 2/38 2/40];
%%
L2erro = zeros(1,L);
H1erro = zeros(1,L);
Linftyerror = zeros(1,L);
position = zeros(1,L);
CA = zeros(1,L);
for i=1:L
    [H1erro(i),L2erro(i)] = poissoninterface3D(box,h(i),example,r);
    %[H1erro(i),L2erro(i)] = poissonbdy3D(box,h(i),example,r);
end

order1 = log(L2erro(1:L-1)./L2erro(2:L))./log(h(1:L-1)./h(2:L));
order2 = log(H1erro(1:L-1)./H1erro(2:L))./log(h(1:L-1)./h(2:L));

logL2err = log(L2erro);
logH1err = log(H1erro);
logh =log(h(1:L));
save wanghua0.txt L2erro order1 H1erro order2 -ascii 