c = [3 -2 1; 4 1 5; 1 2 0];
b = [-7; 9; 5];
len = length(b);
x = zeros(len,1);   
A = [c b];
for i=1:len-1
    for j=i+1:len
        m = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - m*A(i,:);
    end
end
A
x(len) = A(len,len+1)/A(len,len);
for i=len-1:-1:1
    sum = 0;
    for j=i+1:len
        sum = sum + A(i,j)*x(j,:);
        x(i,:) = (A(i,len+1) - sum)/A(i,i);
    end
end
x