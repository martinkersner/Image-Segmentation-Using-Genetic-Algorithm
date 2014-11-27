% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/27/2014
%
% Mutates given chromose at one randomly generated position.

function new_chromosome = mutate_one(chromosome)

    new_chromosome = chromosome;

    chromosome_size = size(chromosome, 2);
    gene = round(unifrnd(1, chromosome_size));

    % Mutate one gene
    if (chromosome(gene) == 1)
        new_chromosome(gene) = 0;
    else
        new_chromosome(gene) = 1;
    endif

endfunction
