%% version 1
% option = optimset;
% A=[1 0 0 0;
%     1.1 1 0 0;
%     1.21 1.1 1 0;
%     1.331 1.21 1.1 1];
% b=[400;440;484;532.4];
% [x,y]=fmincon('fun281',rand(4,1),A,b,[],[],zeros(4,1),[],[],option)
%% version 2
x0=[1;1;1;1];
lb=zeros(4,1);
ub=[];
A=[];
b=[];
Aeq=[];
beq=[];
[x,fval]=fmincon('fun281',x0,A,b,Aeq,beq,lb,ub,'fun282')