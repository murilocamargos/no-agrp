function [offspring] = crossover(pop, cr, er, mr)
%% CROSSOVER operator
    % Computes how many individuals will suffer crossover using the
    % crossover rate
    willcross = ceil(size(pop, 1) * cr);
    if mod(willcross, 2) ~= 0
        willcross = willcross + 1;
    end
    
    offspring = [];
    newpop = pop(1:willcross, :);
    
    factor = 0:mr/100:mr;
    signal = [-1 1];
    
    for i = 1:2:size(newpop, 1)
        p1 = newpop(i, :);
        p2 = newpop(i+1, :);
        
        [~, ~, f] = extrapolate(p1, p2, er);
        f = f + f * factor(randi([1 101])) * signal(randi([1 2]));
        
        offspring = [offspring; f];
    end
end