close all;clc;
init1;%get initial conditions c0,r0,s0,delta1
T=30;% total time for simulation
dt=0.01; %time step (choose a small dt. This need not be the sampling time for actual data %but sampling for simulation. ).
time1=0:dt:T;N=length(time1);

p_node=10^5;
beta1=1.75*10^(-10)*1.33*10^9/p_node;
gamma1=.03;


C=zeros(32,N);S=zeros(32,N);R=zeros(32,N);
C(:,1)=c0;S(:,1)=s0;R(:,1)=r0;

% %delete--just to check code, isolate node 1, and initialize zero infections
% C(1,1)=0;
% delta1(1,:)=zeros(1,32);delta1(1,1)=1;
%  %uniformize off diagonal delta1 to check consistency
%  % also need to uniformize initial conditions and p_node 
%    delta1=0.0*ones(32,32);
%    for i=1:32
%     delta1(i,i)=1;
%    end
%     
  
% %%%%%

for t=1:N-1
   
C(:,t+1)= C(:,t) +dt*(beta1*S(:,t).*(delta1*C(:,t))  -gamma1*C(:,t) );   

R(:,t+1)=R(:,t)+dt*(gamma1*C(:,t) );

S(:,t+1) =S(:,t)+dt*(-beta1*S(:,t).*(delta1*C(:,t)));

    
end
figure(1),
for i=1:32
    plot(time1,C(i,:)),grid on; hold on;
end

