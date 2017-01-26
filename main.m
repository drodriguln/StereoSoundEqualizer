clc;
clear all;
close all;

[stereochirp, Fs, nbits] = wavread('stereo.WAV');
xt = stereochirp;

Ts = 1/Fs;
N = length(stereochirp);
df = Fs/N;
f = df*[0:1:N-1];

%%%%---- LOWPASS ----%%%%

% 32 - 64 Hertz

[Hznum_32, Hzden_32] = butter(3,64/(Fs/2), 'low');
bp_32 = filter(Hznum_32,Hzden_32,xt);
bp_32_fft = abs(fft(bp_32));
bp_32_dB = 20*log10(bp_32_fft);

%%%%---- BANDPASS ----%%%%

% 64 - 125 Hertz
[Hznum_64, Hzden_64] = butter(2,[64 125]/(Fs/2), 'bandpass');
bp_64 = filter(Hznum_64,Hzden_64,xt);
bp_64_fft = abs(fft(bp_64));
bp_64_dB = 20*log10(bp_64_fft);

% 125 - 250 Hertz
[Hznum_125, Hzden_125] = butter(4,[125 250]/(Fs/2), 'bandpass');
bp_125 = filter(Hznum_125,Hzden_125,xt);
bp_125_fft = abs(fft(bp_125));
bp_125_dB = 20*log10(bp_125_fft);

% 250 - 500 Hertz
[Hznum_250, Hzden_250] = butter(4,[250 500]/(Fs/2), 'bandpass');
bp_250 = filter(Hznum_250,Hzden_250,xt);
bp_250_fft = abs(fft(bp_250));
bp_250_dB = 20*log10(bp_250_fft);

% 500 - 1000 Hertz
[Hznum_500, Hzden_500] = butter(5,[500 1000]/(Fs/2), 'bandpass');
bp_500 = filter(Hznum_500,Hzden_500,xt);
bp_500_fft = abs(fft(bp_500));
bp_500_dB = 20*log10(bp_500_fft);

% 1000 - 2000 Hertz
[Hznum_1000, Hzden_1000] = butter(6,[1000 2000]/(Fs/2), 'bandpass');
bp_1000 = filter(Hznum_1000,Hzden_1000,xt);
bp_1000_fft = abs(fft(bp_1000));
bp_1000_dB = 20*log10(bp_1000_fft);

% 2000 - 4000 Hertz
[Hznum_2000, Hzden_2000] = butter(9,[2000 4000]/(Fs/2), 'bandpass');
bp_2000 = filter(Hznum_2000,Hzden_2000,xt);
bp_2000_fft = abs(fft(bp_2000));
bp_2000_dB = 20*log10(bp_2000_fft);

% 4000 - 8000 Hertz
[Hznum_4000, Hzden_4000] = butter(14,[4000 8000]/(Fs/2), 'bandpass');
bp_4000 = filter(Hznum_4000,Hzden_4000,xt);
bp_4000_fft = abs(fft(bp_4000));
bp_4000_dB = 20*log10(bp_4000_fft);

% 8000 - 16000 Hertz
[Hznum_8000, Hzden_8000] = butter(25,[8000 16000]/(Fs/2), 'bandpass');
bp_8000 = filter(Hznum_8000,Hzden_8000,xt);
bp_8000_fft = abs(fft(bp_8000));
bp_8000_dB = 20*log10(bp_8000_fft);

%%%%---- HIGHPASS ----%%%%

% 16000 - 20000 Hertz
[Hznum_16000, Hzden_16000] = butter(20,16000/(Fs/2), 'high');
bp_16000 = filter(Hznum_16000,Hzden_16000,xt);
bp_16000_fft = abs(fft(bp_16000));

bp_16000_dB = 20*log10(bp_16000_fft);

%%%%---- CHANNEL SPLITTING ----%%%%

bp_32_l = bp_32(:,1);
bp_32_r = bp_32(:,2);

bp_64_l = bp_64(:,1);
bp_64_r = bp_64(:,2);

bp_125_l = bp_125(:,1);
bp_125_r = bp_125(:,2);

bp_250_l = bp_250(:,1);
bp_250_r = bp_250(:,2);

bp_500_l = bp_500(:,1);
bp_500_r = bp_500(:,2);

bp_1000_l = bp_1000(:,1);
bp_1000_r = bp_1000(:,2);

bp_2000_l = bp_2000(:,1);
bp_2000_r = bp_2000(:,2);

bp_4000_l = bp_4000(:,1);
bp_4000_r = bp_4000(:,2);

bp_8000_l = bp_8000(:,1);
bp_8000_r = bp_8000(:,2);

bp_16000_l = bp_16000(:,1);
bp_16000_r = bp_16000(:,2);


%%%%---- GAIN CONTROL ----%%%%

%Left Channel Gain
a_32_dB_l = 0;
a_32_l = 10^(a_32_dB_l/20);

a_64_dB_l = 0;
a_64_l = 10^(a_64_dB_l/20);

a_125_dB_l = 0;
a_125_l = 10^(a_125_dB_l/20);

a_250_dB_l = 0;
a_250_l = 10^(a_250_dB_l/20);

a_500_dB_l = 0;
a_500_l = 10^(a_500_dB_l/20);

a_1000_dB_l = 0;
a_1000_l = 10^(a_1000_dB_l/20);

a_2000_dB_l = 0;
a_2000_l = 10^(a_2000_dB_l/20);

a_4000_dB_l = 0;
a_4000_l = 10^(a_4000_dB_l/20);

a_8000_dB_l = 0;
a_8000_l = 10^(a_8000_dB_l/20);

a_16000_dB_l = 0;
a_16000_l = 10^(a_16000_dB_l/20);

% Right Channel Gain
a_32_dB_r = 0;
a_32_r = 10^(a_32_dB_r/20);

a_64_dB_r = 0;
a_64_r = 10^(a_64_dB_r/20);

a_125_dB_r = 0;
a_125_r = 10^(a_125_dB_r/20);

a_250_dB_r = 0;
a_250_r = 10^(a_250_dB_r/20);

a_500_dB_r = 0;
a_500_r = 10^(a_500_dB_r/20);

a_1000_dB_r = 0;
a_1000_r = 10^(a_1000_dB_r/20);

a_2000_dB_r = 0;
a_2000_r = 10^(a_2000_dB_r/20);

a_4000_dB_r = 0;
a_4000_r = 10^(a_4000_dB_r/20);

a_8000_dB_r = 0;
a_8000_r = 10^(a_8000_dB_r/20);

a_16000_dB_r = 0;
a_16000_r = 10^(a_16000_dB_r/20);


%%%%---- SIGNAL ADDITION ----%%%%

bp_l =   a_32_l*bp_32_l + a_64_l*bp_64_l + a_125_l*bp_125_l ...
       + a_125_l*bp_125_l + a_250_l*bp_250_l + a_500_l*bp_500_l ... 
       + a_1000_l*bp_1000_l + a_2000_l*bp_2000_l + a_4000_l*bp_4000_l ...
       + a_8000_l*bp_8000_l + a_16000_l*bp_16000_l;
       
bp_r =   a_32_r*bp_32_r + a_64_r*bp_64_r + a_125_r*bp_125_r ...
       + a_125_r*bp_125_r + a_250_r*bp_250_r + a_500_r*bp_500_r ...
       + a_1000_r*bp_1000_r + a_2000_r*bp_2000_r + a_4000_r*bp_4000_r ...
       + a_8000_r*bp_8000_r + a_16000_r*bp_16000_r;

plot(f,a_32_dB_l + bp_32_dB - 49.5,'r')
hold on
plot(f,a_64_dB_l + bp_64_dB - 49.5,'g')
plot(f,a_125_dB_l + bp_125_dB - 49.5,'b')
plot(f,a_250_dB_l + bp_250_dB - 49.5,'r')
plot(f,a_500_dB_l + bp_500_dB - 49.5,'g')
plot(f,a_1000_dB_l + bp_1000_dB - 49.5,'b')
plot(f,a_2000_dB_l + bp_2000_dB - 49.5,'r')
plot(f,a_4000_dB_l + bp_4000_dB - 49.5,'g')
plot(f,a_8000_dB_l + bp_8000_dB - 49.5,'b')
plot(f,a_16000_dB_l + bp_16000_dB - 49.5,'r')
grid on
ylim([-15 15])
xlim([0 Fs/2])
xlabel('Frequency (Hz)')
ylabel('Gain (dB)')

bp_stereo = [bp_l bp_r];

t = f/(10^4);

figure(2)
plot(t, bp_l)
grid on
xlabel('Time (s)')
ylabel('Signal Amplitude')

wavwrite(bp_stereo, Fs, 'bp_stereo.WAV');