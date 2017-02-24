function [apr] = aproveitamento (pop, t)
    z = peaks(pop(:, 1), pop(:, 2));
    z = z - z(1);
    apr = mean(z < t);
end
