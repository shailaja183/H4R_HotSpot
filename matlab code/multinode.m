%please refer this paper for details related to this model -
%Simha, Ashutosh, R. Venkatesha Prasad, and Sujay Narayana. 
%"A simple stochastic SIR model for covid 19 infection dynamics for 
%Karnataka: Learning from europe." arXiv preprint arXiv:2003.11920 (2020). 
%Available online here: https://arxiv.org/abs/2003.11920


close all;clc;
init1;%get initial conditions c0,r0,s0,delta1

T=300;% total time for simulation in DAYS
dt=0.01; %time step 
%(choose a small dt. This need not be the sampling time for actual data 
%but sampling for simulation. ).

time1=0:dt:T;N=length(time1);

p_node=10^5;

beta1=1.75*10^(-10)*1.33*10^9/p_node;   
%in the full model, there could certainly be different beta factors for
%different clusters

gamma1=.03;

C=zeros(32,N);S=zeros(32,N);R=zeros(32,N);
C(:,1)=c0;S(:,1)=s0;R(:,1)=r0;

%%%%%%%%%%%%%%
% %DELETE--just to check code, isolate node 1, and initialize zero infections
% C(1,1)=0;
% delta1(1,:)=zeros(1,32);delta1(1,1)=1;
%  %uniformize off diagonal delta1 to check consistency
%  % also need to uniformize initial conditions and p_node 
%    delta1=0.0*ones(32,32);
%    for i=1:32
%     delta1(i,i)=1;
%    end
%%%%%%%%%%%%%%  

for t=1:N-1
    C(:,t+1)= C(:,t) +dt*(beta1*S(:,t).*(delta1*C(:,t))  -gamma1*C(:,t) );   
    R(:,t+1)=R(:,t)+dt*(gamma1*C(:,t) );
    S(:,t+1) =S(:,t)+dt*(-beta1*S(:,t).*(delta1*C(:,t)));

%STUB for MACHINE LEARNING to be incorporated (as per Fig 5 in writeup)
%on providing sufficiently disaggregated spatio-temporal data, this can
%be incorporated.

%for j=1:N-1
%   look at actual numbers vs predicted numbers
%   look at other connectivity-related datasets
%   update beta parameter for node j - 
%                       based on feedback learning or other
%                       algorithm
%   update correction factors for delta1 [alpha_ij in paper]
%end


end

figure(1),

for i=1:32
    plot(time1,C(i,:)),grid on; hold on;
end

