function y = cirshift(x,m,N)
if length(x) > N
    error('N����>=x�ĳ���')
end;
x = [x zero(1,N-length(x))];
n = [0:1:N-1];
n = mod(n - m,N);
y =  x(n+1);
