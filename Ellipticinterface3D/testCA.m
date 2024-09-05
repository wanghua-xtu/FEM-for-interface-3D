clear
box = [-1 1 -1 1 -1 1];
example = uint8(1);
h = 1/4;
r = 0.1:h/50:(2*h+0.001); 
L = length(r);
CA = zeros(1,L);
for i=1:L
    CA(i) = condA(box,h,example,r(i));
end
plot(r,CA)