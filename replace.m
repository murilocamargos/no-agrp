function [pop] = replace(pop, children)
%% REPLACE replaces the last individuals (lowest fitness) by the children 
    pop(size(pop, 1) - size(children, 1) + 1:end, :) = children(:, :);
end