Pi1k=[0.7 0.2 0.1;
0.95 0.05 0;
0.8 0.15 0.05;];
Pi2k=[0 0.6 0.4;
0.75 0.2 0.05;
0.8 0.15 0.05;];
Pi3k=[0 0 1;
0.75 0 0.25;
0.8 0.15 0.05];
qi1k=[-1e6;-2e6;-7e6;];
qi2k=[-2e6;-2e6;-7e6;];
qi3k=[-4e6;-2e6;-7e6;];
p=1;
ES=zeros(27,7);
for j=1:3
for k=1:3
for m=1:3
S(1,:)=Pi1k(m,:);
S(2,:)=Pi2k(k,:);
S(3,:)=Pi3k(j,:);
Q(1,1)=qi1k(m,1);
Q(2,1)=qi2k(k,1);
Q(3,1)=qi3k(j,1);
Q
I=eye(3);
S=S'-I;
S(3,:)=ones(1,3);
b=[0;0;1];
p0=S\b
Es(p,4)=0;
for s=1:3
ES(p,s)=p0(s);
ES(p,4)=ES(p,4)+p0(s)*Q(s,1);
end
ES(p,5) = m;
ES(p,6) = k;
ES(p,7) = j;
p=p+1;
end
end
end
ES
[g,d]=max(ES(:,4));
g
dopt=zeros(1,3);
dopt=[ES(d,5);ES(d,6);ES(d,7);]