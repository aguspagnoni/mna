function song_filter(song, out_file, order, f, filter_type)
    [y b filtered Fm] = custom_filter(song, out_file, order, f, filter_type);
    
    % Plot song frequencies
    figure(1);
    print_freq_values(fft(y), Fm);

    % Plot after filter frequencies
    figure(2);
    print_freq_values(fft(filtered), Fm);

    % Plot both together
    figure(3);
    [f1, X] = get_freq_values(fft(y), Fm);
    [f2, Y] = get_freq_values(fft(filtered), Fm);
    plot(f1, X, f1, Y);
    xlabel("Frequencies (Hz)");
    ylabel("dB");
end
