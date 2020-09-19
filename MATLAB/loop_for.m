n=0;
for m=100:1000
    flag=1;j=m-1;i=2;
    while i<=j&flag
        if rem(m,i)==0
            flag=0;
        end
        i=i+1;
    end
    if flag
        n=n+1;
        prime(n)=m;
    end
end
prime %±äÁ¿prime´¢´æËØÊý£»