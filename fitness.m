% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/26/2014
%
% Computes fitness ranking for all population.

function ranking = fitness(image, population, n_thresholds)
    ranking = [];

    % Convert thresholds to decimal representation
    thresholds =  convert_thresholds(population, n_thresholds);

    % Vectorize image
    image_vec = image(:);

    % Computes fitness ranking for all thresholds in population
    for i = 1:size(thresholds, 1)
        ranking = [ranking; fitness_one(image_vec, thresholds(i,:))];
    endfor

endfunction
