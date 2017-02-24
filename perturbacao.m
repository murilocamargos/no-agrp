function [pop] = perturbacao(limites, pop)
    mx = abs([unique(pop(:, 1)), unique(pop(:, 2))]);
    mx = abs(mx(1, :) - mx(2, :))/4;
    
    for i = 1:size(pop, 1)
        if randi([0 1]) == 0
            pop(i, 1) = pop(i, 1) * (rand() * mx(1) + 1);
        else
            pop(i, 1) = pop(i, 1) * (1 - rand() * mx(1));
        end
        
        if randi([0 1]) == 0
            pop(i, 2) = pop(i, 2) * (rand() * mx(2) + 1);
        else
            pop(i, 2) = pop(i, 2) * (1 - rand() * mx(2));
        end
        
        pop(:, 1) = max(min(pop(:, 1), limites(2)), limites(1));
        pop(:, 2) = max(min(pop(:, 2), limites(4)), limites(3));
    end
end