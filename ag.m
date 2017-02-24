clear all
clc

% AG com cruzamento do tipo real polarizado.

% região factível
rf = [-3 3 -3 3];

% tamanho da pop.
tam = [5 5];
% numero máximo de gerações
ger = 100;
% taxa de cruzamento
tc = 0.6;
% taxa de extrapolação
te = 0.2;
% taxa de mutação
tm = 0.05;

t = 0.01;

pop = gerarPop(rf, tam);
plotPop(rf, pop);

i = 0;
stop = 0;
while (i <= ger && stop == 0)
    pop = torneio(pop);
    filhos = cruzamento(pop, tc, te, tm);
    pop = substituir(pop, filhos);
    
    plotPop(rf, pop);
    
    i = i + 1;
    stop = parada(pop(:, :), t);
end

aproveitamento(pop, t);

hold off
peaks;
hold on
plot(pop(:, 1), pop(:, 2), 'ro')
