function [stop] = checkStop(pop, me)
    z = peaks(pop(:, 1), pop(:, 2));
    z = z - z(1);
    stop = ~logical(sum((z > me)));
end