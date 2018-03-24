clc

[x, y] = meshgrid (-0.5 : 0.01 : 0.5, 0 : 0.01 : 0.5);

z = log(1 + x.^2 + y.^2).^2 + (x - y -1).^2;

plot3 (x, y, z)

function f = Fxy(x)
    f = log(1 + x(1)^2 + x(2)^2)^2 + (x(1) - x(2) - 1)^2;
end;

[xmin, minf] = fminsearch (@ Fxy, [2; 2])