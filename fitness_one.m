% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS
% Martin Kersner, <m.kersner@gmail.com>
% 11/26/2014
%
% Computes fitness ranking for given chromosome.

function ranking = fitness_one(image_vec, thresholds_vec)

    ranking = 1;
    inter_var = 0;
    intra_var = 0; % TODO implement

    % Sort thresholds
    thresholds_vec = sort(thresholds_vec);

    end_i = size(thresholds_vec, 2) + 1;
    for i = 1:end_i
        if ((i == 1 && end_i == 2) || i == 1)
        % One threshold or the first threshold
            left = 0;
            right = thresholds_vec(i);
        elseif (i == end_i)
        % The last threshold
            left = thresholds_vec(i-1);
            right = max(image_vec);
        else
        % More thresholds
            left = thresholds_vec(i-1);
            right = thresholds_vec(i);
        endif

            % <0; x) <x; y) <y; max(image_vec))
            left_mask = image_vec >= left;
            right_mask = image_vec < right;
            mask = left_mask .* right_mask;
            object = image_vec(find(mask));

        % TODO better way to relate all variances within objects?
        if (length(object) == 0)
            variance = 1;
        else
            variance = var(object);
        endif

        ranking = ranking + variance;
    endfor

endfunction
