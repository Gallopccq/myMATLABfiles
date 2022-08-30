clc;
close;
clear all;
% 控制输出结果精度
format short;
% 假设数据由两个文件组成，一个是比较数列，一个是参考数列
% 数据格式为：各数列按行存放
% 读入原始数据
compare = xlsread("compare.xlsx");
consult = xlsread("consult.xlsx");
m1=size(consult,1);
m2=size(compare,1);
  % 读入行列标签
  mylabel = readmatrix("label.xlsx");
  myxlabel = mylabel(1:m1);
  myylabel = mylabel(m1+1:end);

% 数据标准化处理
for i = 1:m1
consult(i,:) = consult(i,:)/consult(i,1);
end
for i = 1:m2
compare(i,:) = compare(i,:)/compare(i,1);
end


for i=1:m1 % 体现在R中时，行为consult数列（对应y轴），列为compare数列（对应x轴）
	for j=1:m2
	t(j,:)=compare(j,:)-consult(i,:);
	end
	min_min=min(min(abs(t')));
	max_max=max(max(abs(t')));
	% 通常分辨率都是取0.5
	resolution=0.5;
	% 计算关联系数
	coefficient=(min_min+resolution*max_max)./(abs(t)+resolution*max_max);
	% 计算关联度
	corr_degree=sum(coefficient')/size(coefficient,2);
	r(i,:)=corr_degree;
end

% 输出关联度值并绘制柱形图
r
bar(r,0.90);
axis tight;
% 从左至右依次是 固定资产投资,工业投资,农业投资,科技投资,交通投资
% 参考：legend('固定资产投资','工业投资','农业投资','科技投资','交通投资');
legend(myxlabel); % 不会弄，自己打字吧

% 以下程序是为了给x轴添加汉字标签
% 其基本原理是先去掉x轴上的固有标签，然后用文本标注x轴
% 去掉X轴上默认的标签
set(gca,'XTickLabel','');

%  设定X轴刻度的位置，这里有6个母因素
n=m2;
% 这里注意：x_range范围如果是[1 n]会导致部分柱形条不能显示出来
% 所以范围要缩一点
x_value = 1:1:n;
x_range = [0.6 n+.4];  % 这里不会改QAQ
% 获取当前图形的句柄
set(gca,'XTick',x_value,'XLim',x_range);

% 在X轴上标记6个母因素
% 参考：profits={'国民收入','工业收入','农业收入','商业收入','交通收入','建筑业收入'};
profits={myylabel}; % 不会弄，自己打字吧

y_range = ylim;
% 用文本标注母因素名称
handle_date = text(x_value,y_range(1)*ones(1,n)+.018,profits(1:1:n));
% 把文本的字体设置合适的格式和大小并旋转一定的角度
set(handle_date,'HorizontalAlignment','right','VerticalAlignment','top', 'Rotation',35,...
'fontname','Arial','fontsize',10.5);
% y轴标记
ylabel('y');
title('投资对收入的作用'); % 这里记得改标题
