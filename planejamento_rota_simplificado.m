% NOME DO ARQUIVO: planejamento_rota_simplificado.m
% DESCRIÇÃO: Demonstração simples de um espaço de planejamento 2D com obstáculos, 
%            conectando um ponto inicial a um destino com uma linha reta.
% OBS: Não implementa algoritmos de navegação (ex: A*, DWA) para desvio de obstáculos.

clc;
clear;
close all;

% --- Definindo o espaço de planejamento ---
xLim = [0 10];      % Limite eixo X
yLim = [0 10];      % Limite eixo Y

figure('Name', 'Planejamento de Rota 2D', 'Position', [100, 100, 600, 600]);
hold on;
axis([xLim yLim]);
axis equal;
grid on;

% --- Definindo obstáculos ---
% Formato: [x_center y_center raio]
obstaculos = [3 4 1; 7 6 1.5; 5 8 0.8];  
for i = 1:size(obstaculos,1)
    viscircles(obstaculos(i,1:2), obstaculos(i,3), 'Color', 'r', 'LineWidth', 1);
end

% --- Ponto de início e destino ---
startPoint = [1, 1];
goalPoint = [9, 9];

plot(startPoint(1), startPoint(2), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); % Início
plot(goalPoint(1), goalPoint(2), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');   % Destino

% --- Trajeto planejado (linha direta) ---
pathX = [startPoint(1), goalPoint(1)];
pathY = [startPoint(2), goalPoint(2)];
plot(pathX, pathY, 'k-', 'LineWidth', 2);

% --- Configurações finais ---
title('Planejamento de Rota 2D - Exemplo Simplificado');
xlabel('Eixo X');
ylabel('Eixo Y');
hold off;