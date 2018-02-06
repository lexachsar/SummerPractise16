clc
%1 zadanie
display('1st task');

a = 1.1; b = 0.09;
x = 1.2 : 0.2 : 2.2;

y = log(x.^2 - 1) ./ (log(a * x.^2 .- b) ./ log(5)); [x; y]

clear x y;

%2 zadanie
display('2nd task')

a = 1.1; b = 0.09;
x(1) = 1.21; x(2) = 1.76;
x(3) = 2.53; x(4) = 3.48;
x(5) = 4.52;

for i = 1 : 5
  y(i) = log(x(i)^2 - 1) / (log(a * x(i)^2 - b) / log(5));
  
end;
[x; y]