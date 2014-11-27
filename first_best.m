% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/27/2014
%
% Selecting the first best solutions from current population and 
% transfering to new population.

function new_population = first_best(ranking, population, p_selection, new_population)

    population_size = size(population, 1);
    [best, best_i] = sort(ranking);

    for i = 1:round(p_selection*population_size)
        new_population = [new_population; population(best_i(i), :)];
    endfor

endfunction
