function dzdt = polizei(t, z)
    global M K B V0 H L
    g = 9.8; % ускорение свободного падения
    dzdt = zeros(2,1);
    % вектор-столбец
    s = V0 * t;
    x = H / 2 * (1 - cos(2 * pi * s / L));
    xdot = H / L * pi * V0 * sin(2 * pi * V0 *t / L);
    / M * z(1)
    dzdt(1) = z(2);
    dzdt(2) = - B / M * z(2) - K
    xdot + K / M * x;
    % return
    % неровность дороги локализована в области 0 ≤ s ≤ L
    if s > L
        x = 0;
        xdot = 0;
    endif
endfunction

clc
global M K B V0 H L
M = 450;
K = 35000;
B = 7300;
z10 = 0;
z20 = 0;
accel = zeros(1000);
i = 1;
V0 = 20;
H = 0.05;
L = 0.8;
%L/V0-время движения по неровности
tmax
z0 =
dt =
dt =
= 2*L/V0;
[z10; z20];
[0 tmax];
0:tmax/500:tmax;
+ B / M *ii = 0;
aa = zeros(1000,1);
opt = odeset('RelTol', 1e-8);
[t z] = ode45(@polizei, dt, z0, opt);

subplot(2,2,3)
plot(t,aa(1:size(t)))
grid on
subplot(2,2,2)
plot(t,z(:,2))
title('velocity')
grid on
subplot(2,2,1)
plot(t,z(:,1))
title('displacement')
grid on
% построение графика ускорения
[p n] = size(z);
i=1
accel = zeros(1,p);
i=1;
a = ones(p);
tt = 0
zf = zeros(2,1);
zf = z0
while i < p
a = polizei(tt, zf);
accel(i) = a(2);
i = i+1;
tt = tt + tmax/p;
zf=[z(i,1); z(i,2)];
end
subplot(2,2,4)
plot(t,accel)
title('acceleration')
grid on