function [pop] = selection(pop)
%% SELECTION Selects the individuals from the population using some strategy
    % Evaluates the population
    z = peaks(pop(:, 1), pop(:, 2));
    % Sorts for a minimization problem
    [~, idx] = sort(z);
    pop = pop(idx, :);
end