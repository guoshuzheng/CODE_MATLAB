for i=1:5
    for j=1:5
        if i==j
            xij=2
       elseif i-j==1
                xij=-1
             elseif j-i==1
                xij=-1
           else
                xij=0;
        end
    end
end
for i=1:5
    for j=1:5
        A=[xij]
    end