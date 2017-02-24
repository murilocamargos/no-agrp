function [p1, p2, f] = extrapolar (p1, p2, te)
    tam = pdist2(p1, p2, 'euclidean');
    tamf = tam * (1 + te);

    i = 0.01;
    
    a = (p1(2) - p2(2))/(p1(1) - p2(1));
    b = p1(2) - a * p1(1);
    
    xa = mean([p1(1,1); p2(1,1)]);
    
    while tam < tamf
        x = [min([p1(1), p2(1)]) - i, max([p1(1), p2(1)]) + i];
        y = a * x + b;

        p1 = [x(1), y(1)];
        p2 = [x(2), y(2)];

        tam = pdist2(p1, p2, 'euclidean');
        i = i + 0.01;
    end
    
    best = torneio([p1; p2]);
    best = best(1,1);
    
    f = min([best xa]):abs(best - xa)/100:max([best xa]);

    f = f(randi([1, size(f, 2)]));
    f = [f, f*a + b];
    %f = [xa, xa*a + b];
end