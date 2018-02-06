clc
clear all

global H = 0.05;
global L = 0.8;
global V0 = 20;
global M = 450;
global K = 3500;
global B = 7300;

function dzdt = sist(t, an)
    
    global H L V0 M K B;
    g = 9.8;
    dzdt = zeros(2, 1);

    s = V0 * t
    #Описание математической модели неровности дороги
    x = (H / 2) * (1 - cos(2 * pi * s / L));
    #Производная функции неровности дороги
    dxdt = H / L * pi * V0 * sin(2 * pi * V0 * t / L);
    
    if (s > 0)
        x = 0;
        dxdt = 0;
    endif
    
    dzdt(1) = an(2);
    %dzdt(2) = -B / M * an(2) - K / M * an(1) + B / M * dxdt + K / M * x;
    q = [an(2); an(3); ((B / M) * dxdt + (K / M) * x - (B / M) * an(2) - (K / M) * an(1))];
endfunction;

t0 = 0;
#tf = L / V0;
x0 = [0, 0, 0];

par = odeset ("RelTol", 1e-5, "AbsTol", 1e-5, "InitialStep", 0.0005, "MaxStep", 0.001);
#решение системы при t = L / V0
[t, an0] = ode45(@sist, [t0 L / V0], x0, par);
#решение системы при t = 2 * L / V0
[t2, an2] = ode45(@sist, [t0 2 * L / V0], x0, par);
#решение системы при t = 5 * L / V0
[t5, an5] = ode45(@sist, [t0 5 * L / V0], x0, par);
#решение системы при t = 10 * L / V0
[t10, an10]= ode45(@sist, [t0 10 * L / V0], x0, par);

plot (t, an0(:,1));
hold on
plot (t2, an2(:,1));
hold on
plot (t5, an5(:,1));
hold on
plot (t10, an10(:,1));
xlabel('t');
ylabel('y');

figure();
plot (t, an0(:,2));
hold on
plot (t2, an2(:,2));
hold on
plot (t5, an5(:,2));
hold on
plot (t10, an10(:,2));
xlabel('t');
ylabel('dy/dt');

figure();
plot (t, an0(:,3));
hold on
plot (t2, an2(:,3));
hold on
plot (t5, an5(:,3));
hold on
plot (t10, an10(:,3));
xlabel('t');
ylabel('d^2y/dt^2');