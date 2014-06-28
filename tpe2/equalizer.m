function equalizer(song, snapshots)
  [y Fm bps] = wavread(song);

  width = length(y)/snapshots;
  k = 1;
  k_end = width;
  for m=1:snapshots-1

    [freqs dBs] = get_freq_values(fft(y(k:k_end)), Fm);
    len = length(freqs);
    low = mean(abs(dBs(1:floor(len/3))));
    med = mean(abs(dBs(floor(len/3)+1:floor(len*2/3))));
    high = mean(abs(dBs(floor(len*2/3)+1:len)));

    bar([1:3], [low med high]);

    pause
    k = k_end + 1;
    k_end += width;
  end
end
