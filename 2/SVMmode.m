%% 线性规划法求解SVM模型
%% 清空环境变量，读入数据

%% 数据格式要求：
%% 每个指标按列存放（一列一个指标），最后一列为类指标（取值为1或-1）


clc 
clear all 
X0=xlsread('','');
[m,n]=size(X0);
for i=1:(n-1)
	X(:,i)=(X0(:,i)-mean(X0(:,i))/std(X0(:,i)); % 标准化
end
% 数据预处理
e = ones(m,1);
D=[X0(:,n)];
B=zeros(m,m);
C=zeros(m,m);
for i=1:m
	B(i,i)=1;
	C(i,i)=D(i,1);
end
%% 转化成规划模型进行求解
A=[];
for i=1:(n-1)
	A=[A,-X(:,i).*D];
end
A=[A,D,-B];
b=-e;
f=[zeros(1,m),ones(1,m)];
lb = [];
for i=1:n
	lb=[lb,-inf];
end
lb=[lb,zeros(1,m)];
x = linprog(f,A,b,[],[],lb);

%% 模型验证与结果显示
W=[];
for i=1:(n-1)
	W=[W,x(i,1)]; % 提取系数
end
CC=[x(n,1)]; % 提取截矩
X1=[];
for i=1:(n-1)
	X1=[X1,X(:,i)];
end
R1=X1*W'-CC;
R2=sign(R1); % 进行分类
disp('程序输出结果：');
disp('超平面方程：');
for i=1:(n-1)
	disp(['X' num2str(i) ':' num2str(x(i,1))]);
end
disp(['intercept:' num2str(x(n,1))]); % 常数项
disp(['超平面分类结果：']);
R=[R1,R2]
