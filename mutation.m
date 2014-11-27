% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/27/2014
%

function new_population = mutation(population, p_mutation, new_population)

    population_size = size(population, 1);

    % Random permutation of genomes order 
    mutation_order = randperm(population_size);

    for i = 1:round(p_mutation*population_size);
        new_population = [new_population; mutate_one(population(mutation_order(i), :))];
    endfor

endfunction
