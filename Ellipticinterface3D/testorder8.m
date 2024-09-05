clear
box = [-3 3 -3 3 -3 3];
%box = [-2 2 -2 2 -2 2];
r = 0.67777; example = uint8(8);
L = 4;
h = [1/4 1/6 1/8 1/10 1/12 1/30];
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
save wanghua8.txt L2erro order1 H1erro order2 -ascii 