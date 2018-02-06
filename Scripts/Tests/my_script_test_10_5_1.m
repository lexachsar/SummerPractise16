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

delta = zeros(24, 4);

for i = 1 : 6
    delta(i, 4) = P4(1);
    delta(i + 6, 4) = P4(2);
    delta(i + 12, 4) = P4(3);
    delta(i + 18, 4) = P4(4);
end
#for i = 1 : 24
#    for j = 1 : 6
#        if (i % 2 == 1) 
#            delta(i, 3) = P3( 1, 1 );
#            delta( i + )
for i = 1 : 2 : 6 
    delta(i, 3) = P3(1, 1);
    delta(i + 6, 3) = P3(1, 2);
    delta(i + 12, 3) = P3(1, 3);
    delta(i + 18, 3) = P3(1, 4);
    delta(i+1, 3) = P3(2, 1);
    delta(i + 7, 3) = P3(2, 2);
    delta(i + 13, 3) = P3(2, 3);
    delta(i + 19, 3) = P3(2, 4);
end

for i = 1 : 3 : 6
    delta(i, 2) = P2(1, 1);
    delta(i + 6, 2) = P2(1, 2);
    delta(i + 12, 2) = P2(1, 3);
    delta(i + 18, 2) = P2(1, 4);
    delta(i+1, 2) = P2(2, 1);
    delta(i + 7, 2) = P2(2, 2);
    delta(i + 13, 2) = P2(2, 3);
    delta(i + 19, 2) = P2(2, 4);
    delta(i+2, 2) = P2(3, 1);
    delta(i + 8, 2) = P2(3, 2);
    delta(i + 14, 2) = P2(3, 3);
    delta(i + 20, 2) = P2(3, 4);
end    

for i = 1 : 4 : 6
    delta(i, 1) = P1(1, 1);
    delta(i + 6, 1) = P1(1, 2);
    delta(i + 12, 1) = P1(1, 3);
    delta(i + 18, 1) = P1(1, 4);
    delta(i+1, 1) = P1(2, 1);
    delta(i + 7, 1) = P1(2, 2);
    delta(i + 13, 1) = P1(2, 3);
    delta(i + 19, 1) = P1(2, 4);
    delta(i+2, 1) = P1(3, 1);
    delta(i + 8, 1) = P1(3, 2);
    delta(i + 14, 1) = P1(3, 3);
    delta(i + 20, 1) = P1(3, 4);
    delta(i+3, 1) = P1(3, 1);
    delta(i + 9, 1) = P1(3, 2);
    delta(i + 15, 1) = P1(3, 3);
    delta(i + 21, 1) = P1(3, 4);
end    



 delta           