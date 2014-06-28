function equalizer(song, snapshots)
  [y Fm bps] = wavread(song);

  [f d] = get_freq_values(y, Fm);
  "width"
  width = length(f)
  k_end = width/snapshots;
  for k=1:snapshots-1

    [freqs dBs] = get_freq_values(fft(y(k:k_end)), Fm);
    len = length(freqs)

    bands = [1:len/3, len/3+1:len*2/3, len*2/3+1:len];

    low = mean(abs(dBs(bands(1))));
    med = mean(abs(dBs(bands(2))));
    high = mean(abs(dBs(bands(3))));

    bar([1:3], [low med high]);

    pause
    k = k_end + 1;
    k_end += width;
  end
end
