%Gaussian-Jordan法解线性方程组
%Ar与Ai是系数矩阵A中的实部和虚部；br与bi是列向量b的实部与虚部
%N是矩阵A的阶数与列向量b的行数


function [result1,result2]=G_J(Ar,Ai,br,bi,M)
N=2*M;
Xi=[Ar -Ai;Ai Ar];
B=[br;bi];
result1=zeros(4,1);
result2=zeros(4,1);
for i=1:N    %对A中的元素进行行循环
    temp1=Xi(i,i);
    %temp2=Ai(i,i);
    B(i,1)=B(i,1)/temp1;
    %bi(i,1)=bi(i,1)/temp2;
    for j=1:N    %对A第i行进行列循环
        Xi(i,j)=Xi(i,j)/temp1;   %第i行各列除以第i行i列的元素值
        %Ai(i,j)=Ai(i,j)/temp2;
    end

    if ((N-i)==(N-1))
        for j=i+1:N
            temp1=Xi(j,i);
            %temp2=Ai(j,i);
            B(j,1)=B(j,1)-B(i,1)*temp1;
            %bi(j,1)=bi(j,1)-bi(i,1)*temp2;
            for k=1:N
                Xi(j,k)=Xi(j,k)-Xi(i,k)*temp1;
                %Ai(j,k)=Ai(j,k)-Ai(i,k)*temp2;
            end
        end
    else
        for j=i+1:N
            temp1=Xi(j,i);
            %temp2=Ai(j,i);
            B(j,1)=B(j,1)-B(i,1)*temp1;
            %bi(j,1)=bi(j,1)-bi(i,1)*temp2;
            for k=1:N
                Xi(j,k)=Xi(j,k)-Xi(i,k)*temp1;
                %Ai(j,k)=Ai(j,k)-Ai(i,k)*temp2;
            end
        end
        for j=i-1:-1:1
            temp1=Xi(j,i);
            %temp2=Ai(j,i);
            B(j,1)=B(j,1)-B(i,1)*temp1;
            %bi(j,1)=bi(j,1)-bi(i,1)*temp2;
            for k=1:N
                Xi(j,k)=Xi(j,k)-Xi(i,k)*temp1;
                %Ai(j,k)=Ai(j,k)-Ai(i,k)*temp2;
            end
        end
    end
end
for i=1:M
   result1(i)=B(i);
   result2(i)=B(i+4);
end
end