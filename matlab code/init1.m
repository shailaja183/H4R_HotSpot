%please refer this paper for details related to this model -
%Simha, Ashutosh, R. Venkatesha Prasad, and Sujay Narayana. 
%"A simple stochastic SIR model for covid 19 infection dynamics for 
%Karnataka: Learning from europe." arXiv preprint arXiv:2003.11920 (2020). 
%Available online here: https://arxiv.org/abs/2003.11920


%initialization code for the model
%please note that "alpha_ij" are described in the writeup is implemented
%here as the matrix delta1. 

%initialize the connectivity matrix randomly for this prototype
%in the full solution, this would be loaded from
%factors derived from the adjacency matrix from mobility
%data

delta1=randn(32);delta1=delta1*delta1';delta1=delta1/max(max(delta1));
%this ensures that the factors are correctly normalized between 0 & 1


for i=1:32
    delta1(i,i)=1;  %ensure the diagonals are all 1 - true for any adjacency matrix
end
delta1=delta1.^2;


% RULES FOR delta1
%1. MAKE SURE THAT delta1(i,i)=1,forall i;
%2. other entries must be within [0,1]
%3. delta1 must be symmetric! because beta1 is uniform
%4. please note that delta1 might not be symmetric in the non-uniform beta
%case. However, that situation can be modelled with appropriate data and
%setup and is not considered in this prototype example.

%Initialize with nonnegative integers only

p_node=10^5*ones(32,1);%write out 32x1 matrix pop in each node

%there are assumed to be 32 nodes in this proof-of-concept model. However,
%to provide granular predictions at the city scale, there would need to be
%many more nodes. Nodes might be initialized for each ward or even more
%granular scale. Further, cyclically (daily) migrating populations can be
%modelled using additional nodes. Therefore, the total number of nodes in
%the real model could be in excess of 200 (for Hyderabad city). For
%accurate predictions, good setup/initialization of the model is key!

c0=100*ones(32,1); %write out a 32x1 matrix init infections
%c in the code corresponds to I in the SIR model - i.e. the infected
%population

r0=10*ones(32,1);  %write out a 32x1 matrix init outcomes
%r corresponds to "removed" population - basically 

s0=p_node-c0-r0;
