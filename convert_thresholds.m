% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/26/2014
%
% Converts binary thresholds of all population to decimal representation.

function thresholds = convert_thresholds(population, n_thresholds)

    thresholds = [];
    
    for i = 1:n_thresholds
        thresholds = [thresholds, threshold_bin2dec(population(i,:), n_thresholds)];
    endfor

endfunction
