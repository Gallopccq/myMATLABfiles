clc;
ObjBayes = NaiveBayes.fit(trainning_sampl,class);
pred = ObjBayes.predict(test);
% strcmpi 函数是用来比较两串字符是否相同，相同则返回1，否则返回0
strcmpi(pred,test_class);
% 计算测试机的分类准确率
A = sum(strcmpi(pred,test_class));
B = length(strcmpi(pred,test_class));
acc_tate = A/B
find(strcmpi(pred,test_class)==0)

