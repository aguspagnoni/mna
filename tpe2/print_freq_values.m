function [frequencies values] = print_freq_values(filtered_fft, sample_rate)
    [frequencies values] = get_freq_values(filtered_fft, sample_rate);

    plot(frequencies, values);
    xlabel("Frequencies (Hz)");
    ylabel("dB");
end
