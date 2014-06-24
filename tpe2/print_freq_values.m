function [frequencies values] = print_freq_values(filtered_fft, sample_rate)

    N = length(filtered_fft);
    frequencies = zeros(N/2, 1);
    values = zeros(N/2, 1);
    
    for i = 1:N/2
        values(i) = real(filtered_fft(i));
        frequencies(i) = (i-1)*sample_rate/N;
    end

end
