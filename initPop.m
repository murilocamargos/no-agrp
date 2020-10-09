function [pop] = initPop(fr, psz)
%% INITPOP Creates the initial GA population
    % Divides the x-axis into psz(1) equal parts
    popX = fr(1):abs(fr(1) - fr(2))/(psz(1) - 1):fr(2);
    % Divides the y-axis into psz(1) equal parts
    popY = fr(1):abs(fr(1) - fr(2))/(psz(2) - 1):fr(2);
    
    % Pairwise combination of the elements in popX and popY
    [p, q] = meshgrid(popX, popY);
    pop = [p(:) q(:)];
    
    % Adds a disturbance in the population
    pop = addNoise(fr, pop);
end