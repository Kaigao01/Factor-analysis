%function:�������ӷ����Ĳ���IT��˾�ɳ��������о� 
%
%
%
%��һ�������ӷ���
%
[X,textdata] = xlsread('/ITdata.xls');
X = X(:,1:end)    % ��ȡX�ĵ�3�����һ�У���Ҫ����������  %�����ȡ������Ҫ����ע��
varname = textdata(1,3:end)  %��ȡtextdata�ĵ�1�У���3�����һ�У���������
obsname = textdata(2:end,1)%��ȡtextdata�ĵ�1�У���2�������һ�У�����˾��
[lambda,psi,T,stats,F] = factoran(X,3);% ����������ת(��󷽲���ת��)
[varname' num2cell(lambda)] 
[varname' num2cell(psi)] 
Contribut = 100*sum(lambda.^2)/7   %���㹱���ʣ������غ������Ԫ��֮�ͳ���ά��
CumCont = cumsum(Contribut)    %�����ۻ�������
%
%�ڶ������������ӵ÷ֲ�����
%
obsF = [obsname, num2cell(F)] %����˾�������ӵ÷ַ���һ��Ԫ����������ʾ
F1 = sortrows(obsF, -2);    % ��ӯ�������÷�����
F2 = sortrows(obsF, -3);   % ����Ӫ�����÷�����
F3 = sortrows(obsF, -4);   % ����չǰ���÷�����
head = {'��˾','ӯ������','��Ӫ����','��չǰ��'};
result1 = [head; F1]
result2 = [head; F2]
result3 = [head; F3]

%
%������������ʾ��������Ż�
%
scatter3(F(:,1),F(:,2),F(:,3),'k'); 
xlabel('ӯ������');
ylabel('��Ӫ����');
zlabel('��չǰ��');
text(F(:,1)+0.03,F(:,2),F(:,3), obsname, 'fontsize', 5);%��Ӹ�ɢ��ı�ע
