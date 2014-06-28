function [y b filtered Fm] = custom_filter(song, out_file, order, f, filter_type)
  [y Fm bps] = wavread(song);
  Fnyquist = Fm/2;

  filter_freqz = f/Fnyquist;
  b = fir1(order, filter_freqz, filter_type);
  
  figure(4);
  [h w] = freqz(b, 1);
  w = w/pi;
  plot(w, abs(h));

  filtered = filter(b, 1, y(:,1));
  wavwrite(filtered, Fm, bps, out_file);

end




