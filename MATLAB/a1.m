x = num;
r1=zeros(8);
for i=1:1:8
    for j=1:1:8
        for k=1:1:3
            r1(i,j)=r1(i,j)+abs(x(i,k)-x(j,k));
        end
        r(i,j)=exp(-r1(i,j));
    end
end
disp('r1=')
disp(r1)

xb=zeros(1,8);
for i=1:8       
    for j=1:3    
        xb(i)=xb(i)+x(i,j);
    end
    xb(i)=xb(i)/3; 
end
for i=1:8
    for j=1:8
        t1=0;t2=0;t3=0;
        for k=1:3
            t1=t1+(x(i,k)-xb(i))*(x(j,k)-xb(j));
            t2=t2+(x(i,k)-xb(i))^2;
            t3=t3+(x(j,k)-xb(j))^2;
        end
        r2(i,j)=t1/sqrt(t2*t3);
    end
end
disp('r2 =')
disp(r2)




