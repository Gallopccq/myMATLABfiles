f = [-5;-4;-6];
A=[1 -1 1;
    3 2 4;
    3 2 0];
b=[20;42;30];
[x,fval,exitflag,output,lambda]=linprog(f,A,b,[],[],zeros(3,1))