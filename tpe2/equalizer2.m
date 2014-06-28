function equalizer2(song, snapshots, bands_amount)
  [y Fm bps] = wavread(song);

  width = length(y)/snapshots;
  k = 1;
  k_end = width;
  for m=1:snapshots-1

    [freqs dBs] = get_freq_values(fft(y(k:k_end)), Fm);
    len = length(freqs);

    band_w = floor(len/bands_amount);
    a = 1;
    b = band_w;
    mean_band = [];
    for i=1:bands_amount-1
      mean_band(i) = mean(abs(dBs(a:b)));
      a = b + 1;
      b += band_w;
    end
    bar(1:bands_amount-1, mean_band);

    pause
    k = k_end + 1;
    k_end += width;
  end
end
