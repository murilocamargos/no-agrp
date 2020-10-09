clc; clear;
close all;

%% Genetic algotihm with real representation and polarized crossover

fr = [-3 3 -3 3]; % feasible region
psz = [5 5];      % population size
maxgen = 100;     % max number of generations
cr = 0.6;         % crossover rate
er = 0.2;         % extrapolation rate
mr = 0.05;        % mutation rate
me = 0.01;        % min error allowed

% Creates the initial population
pop = initPop(fr, psz);
% Check stop criterion
stop = checkStop(pop(:, :), me);
% Init generation counter
gen = 0;

while gen <= maxgen && stop == 0
    pop = selection(pop);
    son = crossover(pop, cr, er, mr);
    pop = replace(pop, son);
    stop = checkStop(pop(:, :), me);
    gen = gen + 1;
end

%% Plot results
peaks;
hold on;
zhat = peaks(pop(:, 1), pop(:, 2));
plot3(pop(:, 1), pop(:, 2), zhat, 'rx', 'LineWidth', 2);
hold off;
box on;
grid on;
legend({'Peaks function', 'Individuals'}, 'Location', 'SouthWest')