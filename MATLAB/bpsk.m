Input_serial = 2 * (rand(1,100)>0.5) -1;
r1 = 0;r2 = 10;
AWGN_noise10= 10^(-r1 / 20) * 1/sqrt(2) * (randn(1,100) + 1i * randn(1,100));
AWGN_noise20 = 10^(-r2 / 20) * 1/sqrt(2) * (randn(1,100) + 1i * randn(1,100));

Recv_sig10 = Input_serial + AWGN_noise10;
Recv_sig20 = Input_serial + AWGN_noise20;

subplot(1,2,1)
plot(real(Recv_sig10),imag(Recv_sig10),'r.')
axis([-1.5 1.5 -1 1])
grid on
legend('BPSK,SNR = 10dB')
title('xingzuotu guoshuzheng ')
xlabel('real part')
ylabel('imagnarity part')
 
subplot(1,2,2)
plot(real(Recv_sig20),imag(Recv_sig20),'r*')
axis([-1.5 1.5 -1 1])
grid on
legend('BPSK,SNR = 20dB')
title('xingzuotu guoshuzheng ')
xlabel('real part')
ylabel('imagnarity part') 


