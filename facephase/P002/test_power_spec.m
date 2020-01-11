fs = 44.1e3;
duration = 100;

y = pinknoise(duration*fs);

%x = spatialPattern([1000 1000], -1);

[~,freqVec,~,psd] = spectrogram(y + 1, round(0.05*fs),[],[],fs);
%[~,freqVec,~,psd] = spectrogram(x(1, :));
meanPSD = mean(psd,2);

semilogx(freqVec,db(meanPSD,"power"))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
title('Power Spectral Density of Pink Noise (Averaged)')
grid on