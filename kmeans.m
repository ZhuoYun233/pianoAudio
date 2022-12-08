%名称：kmeans
%功能：把信号按帧长和帧移进行分帧。
%调用格式：f=kmeans(x,win,inc)

function [Idx,centers]=kmeans(x,xstart)
len = length(x);
Idx = zeros(len,1);

C1=xstart(1,:);
C2=xstart(2,:);
C3=xstart(3,:);

for i = 1:100
    for j = 1:len
        x_tmp = X(j,:);
        d1=norm(x_tmp-C1);
        d2=norm(x_tmp-C2);
        d3=norm(x_tmp-C3);
        d=[d1,d2,d3];
        [~,id]=min(d);
        Idx(j)=id;
    end

    %更新中心位置
    
end

end