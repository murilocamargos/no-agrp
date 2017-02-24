function [filhos] = cruzamento(pop, tc, te, tm)
    % calcula quantos individos irão cruzar
    ira_cruzar = ceil(size(pop, 1) * tc);
    if mod(ira_cruzar, 2) ~= 0
        ira_cruzar = ira_cruzar + 1;
    end
    
    nfilhos = [];
    filhos = pop(1:ira_cruzar, :);
    
    fator = 0:tm/100:tm;
    signal = [-1 1];
    
    for i = 1:2:size(filhos, 1)
        p1 = filhos(i, :);
        p2 = filhos(i+1, :);
        
        [p1, p2, f] = extrapolar(p1, p2, te);

        f = f + f * fator(randi([1 101])) * signal(randi([1 2]));
        
        plot(filhos(i:i+1, 1), filhos(i:i+1, 2), 'bo');
        plot([p1(1) p2(1)], [p1(2) p2(2)]);
        plot(f(1), f(2), 'go');
        
        nfilhos = [nfilhos; f];
    end
    
    filhos = nfilhos;
    
    pause
end