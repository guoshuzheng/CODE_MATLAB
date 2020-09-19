clc;clear all;
OmegaP = 2*pi*3000;OmegaS = 2*pi*6000;Rp = 2; As = 30;
N = ceil(log10((10^(As/10)-1) / 10^(Rp/10)-1))/( 2 * log10(OmegaS/OmegaP));

OmegaC = OmegaP/((10^(Rp/10)-1^(1/(2*N))));
[z0,p0,k0] = buttap(N);
p = p0*OmegaC; a = real(poly(p))
k = k0*OmegaC^N;b0 = real(poly(Z0));
b = k*b0
w0 = [OmegaP.OmegaS];
[H,w] = freeqs(b,a);
Hx = freqs(b,a,w0);
dbHx = -20*log10(abs(Hx)/max(abs(H)));
plot(w/(2*pi)/1000,20*log10(abs(H)));
xlabel('f(kHz)');ylabel('dB');axis([-1,12,-55,1])
set (gca,'xtickmode','manual','xtick',[0 1 2 3 4 5 6 7 8 9 10]);
set (gca,'ytickmode','manual','ytick',[-50 -40 -30 -20 -10 0]);grid;
%%N =6
%%b = 5.8650e+25
%%a = 1 7.618e+04 2.9000e+09 7.0010e+13 101267e+18 .11496e+22 5.8650e+25
%%dbHx = 2.0000 33.7962

