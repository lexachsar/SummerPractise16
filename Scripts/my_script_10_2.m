P = [0 1 0 0;
   0 0.4 0.6 0;
   0 0.16 0.48 0.36;
   0.064 0.288 0.432 0.216];
q = [-80; -25; -30; -15];

N = 1;
while(rem(N, 5) != 0)
    N = input ("Input the number of years, multiple of 5: ")
endwhile
N = N / 5;

vAns = zeros(N, 4);
v = [q(1); q(2); q(3); q(4)];
T = zeros(N, 1);

for i = 1 : N
    
    T(i) = 5 * i;
    vAns(i, 1) = v(1);
    vAns(i, 2) = v(2);
    vAns(i, 3) = v(3);
    vAns(i, 4) = v(4);
    disp(sprintf('( %g: %g; %g; %g; %g;) ' , 5 * i , v(1), v(2), v(3), v(4))) 
    v = q + P * v;    
end

plot(T, vAns(:, 1), '.');
hold on;
plot(T, vAns(:, 1), 'g');

plot(T, vAns(:, 2), '.');
hold on;
plot(T, vAns(:, 2), 'm');

plot(T, vAns(:, 3), '.');
hold on;
plot(T, vAns(:, 3), 'b');

plot(T, vAns(:, 4), '.');
hold on;
plot(T, vAns(:, 4), 'c');

xlabel('t, years');
ylabel('v(n)');