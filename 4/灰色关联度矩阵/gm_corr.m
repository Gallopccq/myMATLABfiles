clc;
close;
clear all;
% ��������������
format short;
% ���������������ļ���ɣ�һ���ǱȽ����У�һ���ǲο�����
% ���ݸ�ʽΪ�������а��д��
% ����ԭʼ����
compare = xlsread("compare.xlsx");
consult = xlsread("consult.xlsx");
m1=size(consult,1);
m2=size(compare,1);
  % �������б�ǩ
  mylabel = readmatrix("label.xlsx");
  myxlabel = mylabel(1:m1);
  myylabel = mylabel(m1+1:end);

% ���ݱ�׼������
for i = 1:m1
consult(i,:) = consult(i,:)/consult(i,1);
end
for i = 1:m2
compare(i,:) = compare(i,:)/compare(i,1);
end


for i=1:m1 % ������R��ʱ����Ϊconsult���У���Ӧy�ᣩ����Ϊcompare���У���Ӧx�ᣩ
	for j=1:m2
	t(j,:)=compare(j,:)-consult(i,:);
	end
	min_min=min(min(abs(t')));
	max_max=max(max(abs(t')));
	% ͨ���ֱ��ʶ���ȡ0.5
	resolution=0.5;
	% �������ϵ��
	coefficient=(min_min+resolution*max_max)./(abs(t)+resolution*max_max);
	% ���������
	corr_degree=sum(coefficient')/size(coefficient,2);
	r(i,:)=corr_degree;
end

% ���������ֵ����������ͼ
r
bar(r,0.90);
axis tight;
% �������������� �̶��ʲ�Ͷ��,��ҵͶ��,ũҵͶ��,�Ƽ�Ͷ��,��ͨͶ��
% �ο���legend('�̶��ʲ�Ͷ��','��ҵͶ��','ũҵͶ��','�Ƽ�Ͷ��','��ͨͶ��');
legend(myxlabel); % ����Ū���Լ����ְ�

% ���³�����Ϊ�˸�x����Ӻ��ֱ�ǩ
% �����ԭ������ȥ��x���ϵĹ��б�ǩ��Ȼ�����ı���עx��
% ȥ��X����Ĭ�ϵı�ǩ
set(gca,'XTickLabel','');

%  �趨X��̶ȵ�λ�ã�������6��ĸ����
n=m2;
% ����ע�⣺x_range��Χ�����[1 n]�ᵼ�²���������������ʾ����
% ���Է�ΧҪ��һ��
x_value = 1:1:n;
x_range = [0.6 n+.4];  % ���ﲻ���QAQ
% ��ȡ��ǰͼ�εľ��
set(gca,'XTick',x_value,'XLim',x_range);

% ��X���ϱ��6��ĸ����
% �ο���profits={'��������','��ҵ����','ũҵ����','��ҵ����','��ͨ����','����ҵ����'};
profits={myylabel}; % ����Ū���Լ����ְ�

y_range = ylim;
% ���ı���עĸ��������
handle_date = text(x_value,y_range(1)*ones(1,n)+.018,profits(1:1:n));
% ���ı����������ú��ʵĸ�ʽ�ʹ�С����תһ���ĽǶ�
set(handle_date,'HorizontalAlignment','right','VerticalAlignment','top', 'Rotation',35,...
'fontname','Arial','fontsize',10.5);
% y����
ylabel('y');
title('Ͷ�ʶ����������'); % ����ǵøı���
