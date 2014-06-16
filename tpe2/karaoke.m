function [y b filtered] = karaoke(song, out_file, order, f, filter_type)

  [y Fm bps] = wavread(song);
  % freq = fft(y(:,1));
  % absolutes = abs(freq);
  % points = length(freq);
  Fnyquist = Fm/2;

  passband = f/Fnyquist;
  b = fir1(order, passband, filter_type);
  filtered = filter(b, 1, y(:,1));
  wavwrite(filtered, Fm, bps, out_file);

end
