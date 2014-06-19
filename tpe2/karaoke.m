function [y b filtered] = karaoke(song, out_file, order, f, filter_type)

  [y Fm bps] = wavread(song);
  Fnyquist = Fm/2;

  passband = f/Fnyquist;
  b = fir1(order, passband, filter_type);
  filtered = filter(b, 1, y(:,1));
  [freq val] = print_freq_values(fft(filtered), Fm);
  plot(freq, val);
  wavwrite(filtered, Fm, bps, out_file);

end
