clc
x = 0.8 : 0.001 : 1.0;

y = x.^4 + 2*x.^3 - x - 1;

plot(x, y);

x1 = fzero(inline("x.^4 + 2*x.^3 - x - 1"), [0.8 1.0])

x2 = fsolve(inline("x.^4 + 2*x.^3 - x - 1"), 0.8 : 1.0) 