function [pop] = torneio(pop)
    z = peaks(pop(:, 1), pop(:, 2));
    [z, idx] = sort(z);
    pop = pop(idx, :);
end