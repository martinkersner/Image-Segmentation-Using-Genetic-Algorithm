% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/26/2014
%
% Randomly generates the first population.

function population = initialization(n_population, n_bins, n_thresholds)

     population = round(unifrnd(0, 1, [n_population ceil(log2(n_bins))*n_thresholds]));

endfunction
