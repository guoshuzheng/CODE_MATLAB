input_serial=2*(rand(1,100)>0.5)-1;
input_serial_1=1i*(2*(rand(1,100)>0.5)-1);
r1=10;r2=20;
awgn_noise10=10^(-r1/20)*1/sqrt(2)*(randn(1,100)+1i*randn(1,100));
recv_sig10=input_serial+awgn_noise10;
recv_sig10_1=input_serial_1+awgn_noise10;
a=find(input_serial==-1);
b=find(input_serial==1);
recv_sig10_a=recv_sig10(a);
recv_sig10_b=recv_sig10(b);
subplot(2,2,1)
plot(real(recv_sig10_a),imag(recv_sig10_a),'r+')
hold on
plot(real(recv_sig10_b),imag(recv_sig10_b),'r*')

plot(real(recv_sig10_a),imag(recv_sig10_a),'r+')
plot(real(recv_sig10_1),imag(recv_sig10_1),'b+')
hold on

axis([-1.5 1.5 -2 2])
grid on
legend('bpsk,snr=10db')
title('20163846  liridong ')


