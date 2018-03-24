clc
clear all
global H = 0.05;
global H1 = 0.1;
global H2 = 0.04;
global L = 0.8;
global L1 = 0.4;
global L2 = 1;
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

function q1 = sist1(t1, an1)
    global H1;
    global L1;
    global V0;
    global M;
    global K;
    global B;
    #Описание математической модели неровности дороги
    x = (H1 / 2) * (1 - cos((2 * pi * V0 * t1) / L1));
    #Производная функции неровности дороги
    dxdt = (H1 / L1) * pi * V0 * sin((2 * pi * V0 * t1)/L1);
    q1 = [an1(2); ((B / M) * dxdt + (K / M) * x - (B / M) * an1(2) - (K / M)*an1(1))];
endfunction;

function q2 = sist2(t2, an2)
    global H2;
    global L2;
    global V0;
    global M;
    global K;
    global B;
    #Описание математической модели неровности дороги
    x = (H2 / 2) * (1 - cos((2 * pi * V0 * t2) / L2));
    #Производная функции неровности дороги
    dxdt = (H2 / L2) * pi * V0 * sin((2 * pi * V0 * t2)/L2);
    q2 = [an2(2); ((B / M) * dxdt + (K / M) * x - (B / M) * an2(2) - (K / M)*an2(1))];
endfunction;

t0 = 0;

tf =  L / V0;

x0 = [0, 0];

par = odeset ("RelTol", 1e-5, "AbsTol", 1e-5, "InitialStep", 0.05,
"MaxStep", 0.001);
[t, an] = ode45(@sist, [t0 tf], x0, par);
[t1, an1] = ode45(@sist1, [t0 tf], x0, par);
[t2, an2] = ode45(@sist2, [t0 tf], x0, par);

plot (t, an(:,1), '--');
hold on
plot (t1, an1(:,1), ':');
hold on
plot (t2, an2(:,1));
h = legend("H = 0.05, L =0.8", "H = 0.1 L = 0.4", "H = 0.04, L = 1");
legend(h, "location", "northwest");
xlabel('t');
ylabel('y');

figure();
plot (t, an(:,2), '--');
hold on
plot (t1, an1(:,2), ':');
hold on
plot (t2, an2(:,2));
h = legend("H = 0.05, L =0.8", "H = 0.1 L = 0.4", "H = 0.04, L = 1");
legend(h, "location", "northwest");
xlabel('t');
ylabel('dy/dt');

x = (H / 2) * (1 - cos((2 * pi * V0 * t) / L));
dxdt = (H / L) * pi * V0 * sin((2 * pi * V0 * t)/L);
an3=((B / M) * dxdt + (K / M) * x - (B / M) * an(:,2) - (K / M)*an(:,1));

x1 = (H1 / 2) * (1 - cos((2 * pi * V0 * t) / L1));
dxdt1 = (H1 / L1) * pi * V0 * sin((2 * pi * V0 * t)/L1);
an3_1 = ((B / M) * dxdt1 + (K / M) * x1 - (B / M) * an1(:,2) - (K / M)*an1(:,1));

x2 = (H2 / 2) * (1 - cos((2 * pi * V0 * t) / L2));
dxdt2 = (H2 / L2) * pi * V0 * sin((2 * pi * V0 * t)/L2);
an3_2 = ((B / M) * dxdt2 + (K / M) * x2 - (B / M) * an2(:,2) - (K / M)*an2(:,1));

figure();
plot (t, an3, '--');
xlabel('t');
ylabel('d^2y/dt^2');
hold on
plot (t1, an3_1, ':');
xlabel('t');
ylabel('d^2y/dt^2');
hold on
plot (t2, an3_2);
xlabel('t');
ylabel('d^2y/dt^2');

h = legend("H = 0.05, L =0.8", "H = 0.1 L = 0.4", "H = 0.04, L = 1");
legend(h, "location", "northwest");
xlabel('t');
ylabel('d^2y/dt^2');