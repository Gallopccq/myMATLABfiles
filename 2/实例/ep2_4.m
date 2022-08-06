f = -[2;3;-5];
Aeq=[1 1 1];
beq=[7];
A=-[2 -5 1];
b=-[10];
[x,fval,exitflag,output,lambda]=linprog(f,A,b,Aeq,beq,zeros(3,1))
fval=-fval