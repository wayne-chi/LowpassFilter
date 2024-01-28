% sample frequency 3000 Hz, this means a max freq of 1500Hz can be used
% without aliasing distortion
Fs = 3000;

% Sample time
T = 1/Fs;
f1 = 900;
% generate data 
t = 0:T:1-T;
frequencies = 0:1:Fs-1;
cleanData = 4 * sin(2*pi *f1 *t);

f2 = 1200;
noise = 12 *sin(2*pi* f2 *t) +  0.2 * randn(size(t));

dirtyData = cleanData + noise;


plot(t, cleanData);
xlabel('Time ');
ylabel('Amplitude');
title('Time Domain plot of clean signal');

figure;
plot(t, dirtyData);
xlabel('Time ');
ylabel('Amplitude');
title('Time Domain plot of dirty signal');

dirtyDataFd = abs(fft(dirtyData));
cleanDataFd = abs(fft(cleanData));

figure;
plot(dirtyDataFd);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of dirty Signal');

figure;
plot(cleanDataFd);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of clean Signal');


% filtering
filterData= filter(mylowpassfilter, dirtyData);
filterDataFd = abs(fft(filterData));


figure;
% Plot the magnitude spectrum of the filtered signal
plot(filterDataFd);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Filtered Signal');

