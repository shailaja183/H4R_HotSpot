close all;clc;
T= 30;% total time for simulation
dt=0.01; %time step (choose a small dt. This need not be the sampling time for actual data %but sampling for simulation. ).
time1=0:dt:T;N=length(time1);

p_node=10^5;
beta1=1.75*10^(-10)*1.33*10^9/p_node;



C_1=zeros(1,N);S_1=zeros(1,N);R_1=zeros(1,N);
C_2=zeros(1,N);S_2=zeros(1,N);R_2=zeros(1,N);
C_1(1)= 20;R_1(1)=0;S_1(1)=p_node-C_1(1)-R_1(1);
C_2(1)= 100;R_2(1)=10;S_2(1)=p_node-C_2(1)-R_2(1);


gamma1=.03;
delta12=0.1;%MAKE ARRAY

for t=1:N-1
C_1(t+1)= C_1(t) +dt*(beta1*S_1(t)*(C_1(t) +(delta12)*C_2(t))-gamma1*C_1(t) );   

R_1(t+1)=R_1(t)+dt*(gamma1*C_1(t) );

S_1(t+1) =S_1(t)-dt*(beta1*S_1(t)*(C_1(t) +delta12* C_2(t)));

S_2(t+1) =S_2(t)-dt*(beta1*S_2(t)*(C_2(t) +delta12* C_1(t)));

C_2(t+1)= C_2(t)+dt*(beta1*S_2(t)*(C_2(t) +delta12*C_1(t))-gamma1*C_2(t) );   

R_2(t+1)=R_2(t) +dt*gamma1*C_2(t);

end

figure(1),
plot(time1,C_1,time1,R_1);
figure(2),
plot(time1,C_2,time1,R_2);
