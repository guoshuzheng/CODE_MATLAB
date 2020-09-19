fibo(1)=1;fibo(2)=1;
i=2;
while 1
    i=i+1;
    fibo(i)=fibo(i-2)+fibo(i-1);
    if fibo(i)>4000; break; end
end
disp(['ÏîÊın = ',num2str(i),'£¬ f(',num2str(i),') = ',num2str(fibo(i))])
%
