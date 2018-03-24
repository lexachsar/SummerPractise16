clc

[x, y] = meshgrid (-1 : 1, 1 : 3);

z = (x.^2 + y.^2 - 3).^2 + (x.^2 + y.^2 - 2*x - 3).^2 + 1;

plot3 (x, y, z)

function f = Fxy(x)
    f = (x(1)^2 + x(2)^2 - 3)^2 + (x(1)^2 + x(2)^2 - 2 * x(1) - 3)^2 + 1;
end;

[xmin, minf] = fminsearch (@ Fxy, [1; 1])