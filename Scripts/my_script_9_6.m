clc
clear all

global H = 0.05;
global L = 0.8;
global V0 = 20;
global M = 450;
global K = 35000;
global B = 7300;

global H1 = 0.1;
global L1 = 0.4;

global H2 = 0.1;
global L2 = 1;

global H3 = 0.04;
global L3 = 1;

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
    q = [an(2); an(3); ((B / M) * dxdt + (K / M) * x - (B / M) * an(2) - (K / M) * an(1))];
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
    q1 = [an1(2); an1(3); ((B / M) * dxdt + (K / M) * x - (B / M) * an1(2) - (K / M) * an1(1))];
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
    q2 = [an2(2); an2(3); ((B / M) * dxdt + (K / M) * x - (B / M) * an2(2) - (K / M) * an2(1))];
endfunction;

function q3 = sist3(t3, an3)
    
    global H3;
    global L3;
    global V0;
    global M;
    global K;
    global B;

    #Описание математической модели неровности дороги
    x = (H3 / 2) * (1 - cos((2 * pi * V0 * t3) / L3));
    #Производная функции неровности дороги
    dxdt = (H3 / L3) * pi * V0 * sin((2 * pi * V0 * t3)/L3);
    q3 = [an3(2); an3(3); ((B / M) * dxdt + (K / M) * x - (B / M) * an3(2) - (K / M) * an3(1))];
endfunction;

t0 = 0;
tf = L / V0;
x0 = [0, 0, 0];

par = odeset ("RelTol", 1e-5, "AbsTol", 1e-5, "InitialStep", 0.0005, "MaxStep", 0.001);
#решение системы при t = L / V0
[t, an0] = ode45(@sist, [t0 tf], x0, par);
[t1 an1] = ode45(@sist1, [t0 tf], x0, par);
[t2 an2] = ode45(@sist2, [t0 tf], x0, par);
[t3 an3] = ode45(@sist3, [t0 tf], x0, par);

plot (t, an0(:,1), '--');
hold on
plot (t1, an1(:,1), ':');
hold on
plot (t2, an2(:,1));
hold on
plot (t3, an3(:,1), 'r');
h = legend("H = 0.05; L = 0.8", "H = 0.1; L = 0.4", "H = 0.1; L = 1", "H = 0.04; L = 1");
legend(h, "location", "northwest");
xlabel('t');
ylabel('y');

figure();
plot (t, an0(:,2), '--');
hold on
plot (t1, an1(:,2), ':');
hold on
plot (t2, an2(:,2));
hold on
plot (t3, an3(:,2), 'r');
h = legend("H = 0.05; L = 0.8", "H = 0.1; L = 0.4", "H = 0.1; L = 1", "H = 0.04; L = 1");
legend(h, "location", "northwest");
xlabel('t');
ylabel('dy/dt');

figure();
plot (t, an0(:,3), '--');
hold on
plot (t1, an1(:,3), ':');
hold on
plot (t2, an2(:,3));
hold on
plot (t3, an3(:,3), 'r');
h = legend("H = 0.05; L = 0.8", "H = 0.1; L = 0.4", "H = 0.1; L = 1", "H = 0.04; L = 1");
legend(h, "location", "northwest");
xlabel('t');
ylabel('d^2y/dt^2');