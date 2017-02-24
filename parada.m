function [stop] = parada(pop, t)
    z = peaks(pop(:, 1), pop(:, 2));
    z = z - z(1);
    
    stop = ~logical(sum((z > t)));
end