Pk0=K;
Pi1k=[Pk0(1,:);
Pk1(1,:);
Pk2(1,:)];
qi1k=[qk0(1,1);qk1(1,1);qk2(1,1);];
Pi3k=[Pk0(3,:);
Pk1(3,:);
Pk2(2,:);];
qi3k=[qk0(3,1);qk1(3,1);qk2(2,1);];
Pi2k=[Pk0(2,:);
Pk1(2,:);];
qi2k=[qk0(2,1);qk1(2,1);] ;
v=zeros(3,1);
Vopt=zeros(3,10);
n=1;
while n<20
v1=zeros(3,1);
v2=zeros(2,1);
v3=zeros(3,1);
for i=1:3
for j=1:3
v1(i,1)=v1(i,1)+Pi1k(i,j)*v(j,1);
end
v1(i,1)=v1(i,1)+qi1k(i,1);
end
for i=1:2
for j=1:3
v2(i,1)=v2(i,1)+Pi2k(i,j)*v(j,1);
end
v2(i,1)=v2(i,1)+qi2k(i,1);
end
for i=1:3
for j=1:3
v3(i,1)=v3(i,1)+Pi3k(i,j)*v(j,1);
end
v3(i,1)=v3(i,1)+qi3k(i,1);
end
[v11,i1]=max(v1);
v(1,1)=max(v1);
Vopt(1,n)=v11;
Vopt(1,n+1)=i1;
[v12,i2]=max(v2);
v(2,1)=max(v2);
Vopt(2,n)=v12;
Vopt(2,n+1)=i2;
[v13,i3]=max(v3);
v(3,1)=max(v3);
Vopt(3,n)=v13;
Vopt(3,n+1)=i3;
n=n+2;
end
v;
Vopt(:,3)
Vopt(:,9)
Vopt(:,19)
Vopt;