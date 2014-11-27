% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/27/2014
%
% Crossover of two parents creating new descendants by one-point crossover.

function [desc_first desc_second] = crossover_one(parent_first, parent_second)

    parent_size = size(parent_first, 2);

    % Randomly generated number between 1 and the length of parent's genome.
    point = round(unifrnd(1, parent_size-1));

    % Crossover
    desc_first  = [parent_first(1:point)   parent_second(point+1:parent_size)];
    desc_second = [parent_second(1:point)  parent_first(point+1:parent_size)];

endfunction
