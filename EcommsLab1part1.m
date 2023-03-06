%ECOMMS LAB 1
clear;
clc;
close all;

syms sym_t;

f_s = 10e3;
T_s = 1/f_s;

t = -1:T_s:10-T_s;
figure()
subplot(2,1,1)
s_sym = heaviside(sym_t) - heaviside(sym_t-.6) + heaviside(sym_t-.7)- heaviside(sym_t-1);

s = heaviside(t) - heaviside(t-.6) + heaviside(t-.7)- heaviside(t-1);
plot(t,s)
xlabel('Time')
ylabel('W')
title('Rectangular Signal')
axis([-.1 1.1 0 1.5])

f = -10:0.1:10;
w = 2*pi*f;

F = (sinc(.6*w)-sinc(.7*w)+sinc(w));

subplot(2,1,2)

plot(w, abs(F))
xlabel('Frequency W = 2/pi')
ylabel('|F(jw)|')
title('Continious Fourier Transform')

%%%%%%%%%%%% DFT mangitude spectrum
figure()
subplot(2,1,1)
S=fft(s);
plot((0:length(s)-1),fftshift(abs(S)))
xlabel('Frequency W = 2/pi')
ylabel('|F(jw)|')
title('DFT')

%%%%%%%%%%% IFT %%%%%%%%%%%%%

s_cft_inv = ifft(F, length(s));
subplot(2,1,2)
plot((0:length(s)-1),fftshift(abs(s_cft_inv)))
xlabel('Time')
ylabel('|F(jw)|')
title('IFFT')

%%%%%%%%%% DFT and IDFT %%%%%%%%%

[P,Q] = rat(15e3/f_s);
s_new = resample(s,P,Q);
S = fft(s_new);
figure()
subplot(2,1,1)
plot((0:length(s_new)-1),fftshift(abs(S)))
xlabel('Frequency w = 2/pi')
ylabel('|F(jw)|')
title('DFT at 15kHz')

s_dft_inv = ifft(S, length(s_new));
subplot(2,1,2)
plot((0:length(s_new)-1),fftshift(abs(s_dft_inv)))
xlabel('Time')
ylabel('|F(jw)|')
title('IFFT at 15kHz')

%%%%%%%%%%%%%%%%%%%

[P,Q] = rat(50e3/f_s);
s_new = resample(s,P,Q);
S = fft(s_new);
figure()
subplot(2,1,1)
plot((0:length(s_new)-1),fftshift(abs(S)))
xlabel('Frequency w = 2/pi')
ylabel('|F(jw)|')
title('DFT at 50kHz')

%%%%%%%%% IFT %%%%%%%%%%%%%%%%%

s_dft_inv = ifft(S, length(s_new));
subplot(2,1,2)
plot((0:length(s_new)-1),fftshift(abs(s_dft_inv)))
xlabel('Time')
ylabel('|F(jw)|')
title('IFFT at 15kHz')

