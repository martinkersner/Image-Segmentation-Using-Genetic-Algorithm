% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/27/2014
%
% Crossovers desired part of population.

function new_population = crossover(population, p_crossover, new_population)

    population_size = size(population, 1);

    % Random permutation of genomes order 
    parent_first = randperm(population_size);
    parent_second = randperm(population_size);

    % Number of couples used for crossover
    n_crossovers = round(p_crossover*population_size)/2;

    for i = 1:n_crossovers
        % Crossovers parents
        [desc_first desc_second] = crossover_one(population(parent_first(i),  :), ...
                                                 population(parent_second(i), :));

        % Add crossover descendants
        new_population = [new_population; desc_first; desc_second];
    endfor

endfunction
