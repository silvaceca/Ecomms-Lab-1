%% ECOMMS LAB 1
clear;
clc;
close all;

f_m = 5e3;
f_c = 25e3;
f_s = 1e3;

t1 = 1/f_s;
t = linspace(0,t1,1000);

A_m = 1;
A_c = 1;

s = A_c*(1+A_m*cos(2*pi*f_m*t)).*cos(2*pi*f_c*t);
figure()
subplot(2,1,1)
plot(t,s)
xlabel('Time')
ylabel('Modulated Signal')
title('AM Bandpass Signal in t-domain')

n = length(s);

S_dft=fftshift(fft(s,n));
f = f_s*(-(n-1)/2:(n/2))/n;
subplot(2,1,2)
plot(f,abs(S_dft))
xlabel('Frequency')
ylabel('|S(f)|')
title('AM Bandpass Signal Spectrum')

%%%%%%%%%%%%%%%%%%%%%%%%%

snr = 10;

S_awgn = awgn(s,snr);
figure()
subplot(2,1,1)
plot(t,S_awgn)
xlabel('Time')
ylabel('Modulated Signal')
title('AM Bandpass Signal in t-domain')

n = length(S_awgn);
S_dft_awgn=fftshift(fft(S_awgn,n));
f = f_s*(-(n-1)/2:(n/2))/n;
subplot(2,1,2)
plot(f,abs(S_dft_awgn))
xlabel('Frequency')
ylabel('|S(f)|')
title('AM Bandpass Signal Spectrum')

%% Synthesize a bandpass FM signal

beta_f = 10;

S_fm = A_c*cos(2*pi*f_c*t+beta_f*A_m*sin(2*pi*f_m*t));

figure()
subplot(2,1,1)
plot(t,S_fm)
xlabel('Time')
ylabel('s(t)')
title('FM Bandpass Signal in t domain')

%%%%%%%%%%%%%%%%

n_fm = length(S_fm);
S_dft_fm = fftshift(fft(S_fm,n_fm));
f = f_s*(-(n_fm-1)/2:(n_fm/2))/n_fm;
subplot(2,1,2)
plot(f,abs(S_dft_fm))
xlabel('Frequency')
ylabel('|S(f)|')
title('FM Bandpass Signal Spectrum')

SNR = 10;
S_awgn_fm = awgn(S_fm,snr);
figure()
subplot(2,1,1)
plot(t,S_awgn_fm)
xlabel('Time')
ylabel('s(t)')
title('AM Bandpass Signal in t domain SNR = 10')

n = length(S_awgn_fm);
S_dft_awgn_fm=fftshift(fft(S_awgn_fm,n));
f = f_s*(-(n-1)/2:(n/2))/n;
subplot(2,1,2)
plot(f,abs(S_dft_awgn_fm))
xlabel('Frequency')
ylabel('|S(f)|')
title('FM Bandpass Signal Spectru SNR = 10')