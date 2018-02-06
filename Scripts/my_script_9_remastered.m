clc
clear all
global H = 0.05;
global L = 0.8;
global V0 = 20;
global M = 450;
global K = 3500;
global B =7300;
function q = sist(t, an)
    global H;
    global L;
    global V0;
    global M;
    global K;
    global B;
    #Описание математической модели неровности дороги
    x = (H / 2) * (1 - cos((2 * pi * V0 * t) / L));
    #Производная функции неровности дороги
    dxdt = (H / L) * pi * V0 * sin((2 * pi * V0 * t)/L);
    q = [an(2); ((B / M) * dxdt + (K / M) * x - (B / M) * an(2) - (K / M)*an(1))];
endfunction;

t0 = 0;

tf =  L / V0;

x0 = [0, 0];

par = odeset ("RelTol", 1e-5, "AbsTol", 1e-5, "InitialStep", 0.05,
"MaxStep", 0.001);
[t, an] = ode45(@sist, [t0 tf], x0, par);
plot (t, an(:,1));
xlabel('t');
ylabel('y');
figure();
plot (t, an(:,2));
xlabel('t');
ylabel('dy/dt');

x = (H / 2) * (1 - cos((2 * pi * V0 * t) / L));
dxdt = (H / L) * pi * V0 * sin((2 * pi * V0 * t)/L);
an3=((B / M) * dxdt + (K / M) * x - (B / M) * an(:,2) - (K / M)*an(:,1));

figure();
plot (t, an3);
xlabel('t');
ylabel('d^2y/dt^2');