delta1=randn(32);delta1=delta1*delta1';delta1=delta1/max(max(delta1));
for i=1:32
    delta1(i,i)=1;
end
delta1=delta1.^2;
%write out a 32x32 matrix here for delta1 

% RULES FOR delta1
%1. MAKE SURE THAT delta1(i,i)=1,forall i;
%2. other entries must be within [0,1]
%3. delta1 must be symmetric!because beta1 is uniform

%Initialize with nonnegative integers only
p_node=10^5*ones(32,1);%write out 32x1 matrix pop in each node
c0=100*ones(32,1);%write out a 32x1 matrix init infections
r0=10*ones(32,1);%write out a 32x1 matrix init outcomes
s0=p_node-c0-r0;
