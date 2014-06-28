function [f, values] = get_freq_values(frequencies, sample_rate)
    N = length(frequencies);

    f = (0:N/2-1)*sample_rate/N;
    values = log10(abs(frequencies(1:length(f))));
    values = values - max(values);
end






