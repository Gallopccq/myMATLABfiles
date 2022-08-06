% % 第3章 数据建模及MATLAB实现
% logistic方法MATLAB实现程序
% logistic方法主要应用于研究某些现象发生的概率P，比如股票涨还是跌，公司成功或失败的概率。
% 在实际应用中，因为因变量y的取值常是0或1，会导致ln（P/（1-P））形式失意，为此，我们常常不是直接对P...
% 进行回归，而是先定义单调连续的概率函数π，如……分段区间[0, 0.5],(0, 5.1]，值取区间中点值。
%----------------
%% 数据准备
clear all;
clc
X0=xlsread('Ch2_loistic_ex1.xlsx','A2:C21'); % 多元自变量（不含预测部分），格式为：从上到下为各样本，从左到右为各变量
XE=xlsread('Ch2_logistic_ex2.xlsx','A2:C26'); % 多元自变量（含预测部分），格式为：同上
Y0=xlsread('Ch2_logistic_ex3.xlsx','D2:D21'); % 因变量（应为定性值，如0或1），格式为列向量
%% 数据转化和参数回归
n=size(Y0,1);
for i=1:n
    if Y0==0 % 将定性离散值转化为连续值，此处为取区间中点
        Y1(i,1)=0.25;
    else
        Y1(i,1)=0.75;
    end
end
X1=ones(size(X0,1),1); % 构建常数项系数
X=[X1,X0];
Y=log(Y1./(1-Y1));
b=regress(Y,X); % 线性回归（方法为最小二乘法）
%%模型验证和应用
for i=1:size(XE,1)
    % logistic函数，应用时需要在此修改程序
    %源程序： Pai0=exp(b(1)+b(2)*XE(i,1)+b(3)*XE(i,2)+b(4)*XE(i,3))/1+exp(b(1)+b(2)*XE(i,1)+b(3)*XE(i,2)+b(4)*XE(i,3);
    Pai0 = b'*[1,XE(i,:)];
    % 分段区间为[0, 0.5],(0, 5.1]
    if Pai0<=0.5
        P(i)=0;
    else
        P(i)=1;
    end
end
%% 显示结果
disp(['回归系数：' num2str(b')]);
disp(['评价结果：' num2str(P)]);