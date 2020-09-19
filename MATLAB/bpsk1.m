Input_serial = 2 * (rand(1,100)>0.5) -1;
r1 = 0;r2 = 10;
AWGN_noise10= 10^(-r1 / 20) * 1/sqrt(2) * (randn(1,100) + 1i * randn(1,100));
AWGN_noise20 = 10^(-r2 / 20) * 1/sqrt(2) * (randn(1,100) + 1i * randn(1,100));
Recv_sig10 = Input_serial + AWGN_noise10;
Recv_sig20 = Input_serial + AWGN_noise20;

j = 1;
while(j < 100)
    if Input_serial(j) > 0
        plot(real(Recv_sig10(j)),imag(Recv_sig10(j)),'r.')
        j = j+1
        hold on
        
    else Input_serial(j)
        plot(real(Recv_sig10(j)),imag(Recv_sig10(j)),'b*')
        j = j+1
        hold on
    end
end
legend( 'BPSK,SNR = 10dB')
title('xingzuotu guoshuzheng ')
xlabel('real part')
ylabel('imagnarity part')
 

