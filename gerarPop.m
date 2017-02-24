function [pop] = gerarPop(rf, tam)
    % divide o eixo x em tam(1) partes iguais
    popX = rf(1):abs(rf(1) - rf(2))/(tam(1) - 1):rf(2);
    % divide o eixo y em tam(2) partes iguais
    popY = rf(1):abs(rf(1) - rf(2))/(tam(2) - 1):rf(2);
    
    % faz a combinação 2 a 2 dos elementos de popX e popY
    [p, q] = meshgrid(popX, popY);
    pop = [p(:) q(:)];
    
    pop = perturbacao(rf, pop);
end