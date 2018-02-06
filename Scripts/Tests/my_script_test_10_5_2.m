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
q3 = [-10; -30];
q4 = [-15];

p = 1;

delta = zeros(24, 4);
I = zeros (24, 1);
for i = 4 : 4 : 24
    delta(i, :) = P4;
    Q(i) = q4;
    I(i) = 1;
end

for i = 3 : 8 : 24
    delta(i, :) = P3(1, :);
    Q(i) = q3(1);
    I(i) = 1;
end

for i = 7 : 8 : 24
    delta(i, :) = P3(2, :);
    Q(i) = q3(2);
    I(i) = 2;
end

for i = 2 : 12 : 24
    delta(i, :) = P2(1, :);
    Q(i) = q2(1);
    I(i) = 1;
end

for i = 6 : 12 : 24
    delta(i, :) = P2(2, :);
    Q(i) = q2(2);
    I(i) = 2;
end

for i = 10 : 12 : 24
    delta(i, :) = P2(3, :);
    Q(i) = q2(3);
    I(i) = 3;
end

for i = 1 : 16 : 24
    delta(i, :) = P1(1, :);
    Q(i) = q1(1);
    I(i) = 1;
end

for i = 5 : 16 : 24
    delta(i, :) = P1(2, :);
    Q(i) = q1(2);
    I(i) = 2;
end

for i = 9 : 16 : 24
    delta(i, :) = P1(3, :);
    Q(i) = q1(3);
    I(i) = 3;
end

for i = 13 : 16 : 24
    delta(i, :) = P1(4, :);
    Q(i) = q1(4);
    I(i) = 4;
end

ES = zeros(24, 9);
for i = 1 : 4 : 24
    S(1, :) = delta(i, :);
    S(2, :) = delta(i + 1, :);
    S(3, :) = delta(i + 2, :);
    S(4, :) = delta(i + 3, :);
    
    Qtmp(1, 1) = Q(i);
    Qtmp(2, 1) = Q(i + 1);
    Qtmp(3, 1) = Q(i + 2);
    Qtmp(4, 1) = Q(i + 3);
    
    S = S'- eye(4);
    S(4,:)=ones(1, 4);
    b=[0; 0; 0; 1];
    p0 = S \ b
    Es(i,5)=0;
    for s=1:4
        p0(s)
        s
        ES(i, s)=p0(s);
        ES(i, 5)=ES(i,5)+p0(s)*Qtmp(s, 1);
    end
    ES(i, 6) = I(i);
    ES(i + 1, 7) = I(i + 1);
    ES(i + 2, 8) = I(i + 2);
    ES(i + 3, 9) = I(i + 3);
end
ES
S
[g,d]=max(ES(:,5));
g
dopt=zeros(1,4);
dopt=[ES(d,6);ES(d,7);ES(d,8); ES(d,9)]