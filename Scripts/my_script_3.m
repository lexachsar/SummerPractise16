clc
x = [10.0 12.0 13.0 15.0 18.0 20.0 21.0]
y = [0.66 0.89 1.24 1.36 1.56 1.76 1.92]

plot(x, y, 'o')
hold on 


[p1, s1] = polyfit(x, y, 1);
y1 = polyval(p1, x);
plot(x, y1, 'g')
hold on

[p1, s1] = polyfit(x, y, 2);
y1 = polyval(p1, x);
plot(x, y1, 'k')
hold on

[p1, s1] = polyfit(x, y, 3);
y1 = polyval(p1, x);
plot(x, y1, 'm')
hold on

[p1, s1] = polyfit(x, y, 4);
y1 = polyval(p1, x);
plot(x, y1, 'b')
hold on

[p1, s1] = polyfit(x, y, 5);
y1 = polyval(p1, x);
plot(x, y1, 'r')
hold on

[p1, s1] = polyfit(x, y, 6);
y1 = polyval(p1, x);
plot(x, y1, 'c')
hold on


h = legend("graph", "polyfit (k = 1)", "polyfit (k = 2)", "polyfit (k = 3)", "polyfit (k = 4)", "polyfit (k = 5)", "polyfit (k = 6)"); 
legend(h, "location", "northeastoutside");