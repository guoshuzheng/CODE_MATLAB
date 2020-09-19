real_serial=2*(rand(1,1000)>0.5)-1;
imag_serial=2*(rand(1,1000)>0.5)-1;
r1=0;
input_serial=real_serial+1i*(imag_serial);
q1=input_serial(find(input_serial==1+1i));
q2=input_serial(find(input_serial==-1+1i));
q3=input_serial(find(input_serial==-1-1i));
q4=input_serial(find(input_serial==1-1i));
awgn_noise101=10^(-r1/20)*1/sqrt(2)*(randn(1,numel(q1))+1i*randn(1,numel(q1)));
awgn_noise102=10^(-r1/20)*1/sqrt(2)*(randn(1,numel(q2))+1i*randn(1,numel(q2)));
awgn_noise103=10^(-r1/20)*1/sqrt(2)*(randn(1,numel(q3))+1i*randn(1,numel(q3)));
awgn_noise104=10^(-r1/20)*1/sqrt(2)*(randn(1,numel(q4))+1i*randn(1,numel(q4)));
recv_sig101=q1+awgn_noise101;
recv_sig102=q2+awgn_noise102;
recv_sig103=q3+awgn_noise103;
recv_sig104=q4+awgn_noise104;
plot(real(recv_sig101),imag(recv_sig101),'r*');hold on;
plot(real(recv_sig102),imag(recv_sig102),'bo');hold on;
plot(real(recv_sig103),imag(recv_sig103),'y.');hold on;
plot(real(recv_sig104),imag(recv_sig104),'g.');hold on;
axis([-5 5 -5 5])
grid on
legend ('QPSK,SNR=0dB')
title('guoshuzheeng 20163891')
xlabel('real part1')
ylabel('imag part1')
