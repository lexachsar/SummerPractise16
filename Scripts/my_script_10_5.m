Pi1k = [1 0 0 0;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];
Pi2k = [0.4 0.6 0 0;
      0 0.4 0.6 0;
      0 0 0.4 0.6];
Pi3k = [0.16 0.48 0.36 0;
      0 0.16 0.48 0.36];
Pi4k = [0.064 0.288 0.432 0.216];

qi1k = [-60; -80; -100; -120];
qi2k = [-5; -25; -45];
qi3k = [-10; -30];
qi4k = [-15];
S = zeros(4, 4)
p=1;
ES=zeros(24,9);
#S(4, :) = Pi4k(1, :);
#Q(4, 1) = qi4k(1, 1)
for z = 1 : 1
    for j = 1 : 2
        for k = 1 : 3
            for m = 1 : 4
                S(1,:) = Pi1k(m,:);
                S(2,:) = Pi2k(k,:);
                S(3,:) = Pi3k(j,:);
                S(4,:) = Pi4k(z,:);
                
                Q(1,1) = qi1k(m,1);
                Q(2,1) = qi2k(k,1);
                Q(3,1) = qi3k(j,1);
                Q(4,1) = qi4k(z, 1);
                I = eye(4);
                S=S'-I;
                S(4,:)=ones(1,4);
                b=[0; 0; 0; 1];
                p0=S\b
                Es(p,5)=0;
                for s=1:4
                    ES(p,s)=p0(s);
                    ES(p,5)=ES(p,5)+p0(s)*Q(s,1);
                end
                ES(p,6) = m;
                ES(p,7) = k;
                ES(p,8) = j;
                ES(p,9) = z;
                p=p+1;
            end
        end
    end
end
ES
[g,d]=max(ES(:,5));
g
dopt=zeros(1,4);
dopt=[ES(d,6);ES(d,7);ES(d,8); ES(d,9)]