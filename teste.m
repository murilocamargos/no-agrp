p1 = rand(1, 2) * 6 - 3;
p2 = rand(1, 2) * 6 - 3;
te = 0.2;

plot([p1(1) p2(1)], [p1(2) p2(2)], 'ro');
hold on
axis([-4 4 -4 4]);

[p1, p2, f] = extrapolar(p1, p2, te);

%fx = mean([mean([p1(1) p2(1)]) best(1,1)]);
%fy = mean([mean([p1(2) p2(2)]) best(1,2)]);

plot(f(1), f(2), 'go');


plot([p1(1) p2(1)], [p1(2) p2(2)]);