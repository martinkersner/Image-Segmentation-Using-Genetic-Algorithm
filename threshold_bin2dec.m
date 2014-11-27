% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/27/2014
%
% Converts thresholds of one genome from binary to decimal format.

function dec_thresholds = threshold_bin2dec(bin_thresholds, n_thresholds)

    dec_thresholds = [];
    threshold_length = (size(bin_thresholds, 2)/n_thresholds);

    for i = 1:threshold_length:size(bin_thresholds, 2)
        dec_thresholds = [dec_thresholds, bi2de(bin_thresholds(i:i+threshold_length-1))];
    endfor

endfunction
