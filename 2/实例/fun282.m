function [g,h] = fun282(x)
%FUN282 此处显示有关此函数的摘要
%   此处显示详细说明
g(1)=x(1)-400;
g(2)=1.1*x(1)+x(2)-440;
g(3)=1.21*x(1)+1.1*x(2)+x(3)-484;
g(4)=1.331*x(1)+1.21*x(2)+1.1*x(3)+x(4)-532.4;
h=0;
end

