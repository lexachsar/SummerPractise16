P1 = [1 0 0 0;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];
P2 = [0.4 0.6 0 0;
      0 0.4 0.6 0;
      0 0 0.4 0.6];
P3 = [0.16 0.48 0.36 0;
      0 0.16 0.48 0.36];
P4 = [0.064 0.288 0.432 0.216];
      
q1 = [-60; -80; -100; -120];
q2 = [-5; -25; -45];
q3 = [-10 -30];
q4 = [-15];

N = 1;
while(rem(N, 5) != 0)
    N = input ("Input the number of years, multiple of 5: ")
endwhile
N = N / 5;

vGraph = zeros(N, 4);
T = zeros(N, 1);
[vopt(1), I(1)] = max(q1);
[vopt(2), I(2)] = max(q2);
[vopt(3), I(3)] = max(q3);
[vopt(4), I(4)] = max(q4);

startup = -1;
while(startup != 1 && startup != 2 && startup != 3 && startup != 4)
    startup = input ("Input the startup state [1, 2, 3, 4] : ")
endwhile

for years = 1 : N
    
    vGraph(years, 1) = vopt(1);
    vGraph(years, 2) = vopt(2);
    vGraph(years, 3) = vopt(3);
    vGraph(years, 4) = vopt(4);
    T(years) = 5 * years;
    
    switch(startup)
    case 1
        disp(sprintf('Год %g Управление %g Затраты %g' , 5 * years , I(1), vopt(1)))
    case 2
        disp(sprintf('Год %g Управление %g Затраты %g' , 5 * years , I(2), vopt(2)))
    case 3
        disp(sprintf('Год %g Управление %g Затраты %g' , 5 * years , I(3), vopt(3)))
    case 4
        disp(sprintf('Год %g Управление %g Затраты %g' , 5 * years , I(4), vopt(4)))
    endswitch
    
    for i = 1 : 4
        switch(I(i))
            case 1
                [vopt(i), I(i)] = max( [ ( q1(1) + P1(1, 1) * vopt(1) ),
                                      ( q1(2) + P1(2, 2) * vopt(2) ),
                                      ( q1(3) + P1(3, 3) * vopt(3) ),
                                      ( q1(4) + P1(4, 4) * vopt(4) ) ] );
            case 2
                [vopt(i), I(i)] = max( [ ( q2(1) + ( P2(1, 1) * vopt(1) + P2(1, 2) * vopt(2) ) ),
                                      ( q2(2) + ( P2(2, 2) * vopt(2) + P2(2, 3) * vopt(3) ) ),
                                      ( q2(3) + ( P2(3, 3) * vopt(3) + P2(3, 4) * vopt(4) ) ) ] );
            case 3
                [vopt(i), I(i)] = max( [ ( q3(1) + ( P3(1, 1) * vopt(1) + P3(1,2) * vopt(2) + P3(1, 3) * vopt(3) ) ),
                                      ( q3(2) + ( P3(2, 2) * vopt(2) + P3(2, 3) * vopt(3) + P3(2, 4) * vopt(4) ) ) ] );
            case 4
                [vopt(i), I(i)] = max(q4(1) + (P4(1) * vopt(1) + P4(2) * vopt(2) + P4(3) * vopt(3) + P4(4) * vopt(4)));
        endswitch
                            
    end
    
end

vGraph

plot(T, vGraph(:, 1), '.');
hold on;
plot(T, vGraph(:, 1), 'g');

plot(T, vGraph(:, 2), '.');
hold on;
plot(T, vGraph(:, 2), 'm');

plot(T, vGraph(:, 3), '.');
hold on;
plot(T, vGraph(:, 3), 'b');

plot(T, vGraph(:, 4), '.');
hold on;
plot(T, vGraph(:, 4), 'c');

xlabel('t, years');
ylabel('v(n)');