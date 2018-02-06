clc

x = 1.0 : 0.0005 : 2.5;
y = sin(1./x).*x.^4;

sim = trapz(x, y)

clear x y z;

tr = quad(inline("(sin(1./x).*x.^4)"), 1.0, 2.5, 0.0005)