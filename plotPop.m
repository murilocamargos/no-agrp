function plotPop(rf, pop)
    hold off
    plot(pop(:, 1), pop(:, 2), 'rx');
    axis(rf * 1.5);
    hold on
    pause
end