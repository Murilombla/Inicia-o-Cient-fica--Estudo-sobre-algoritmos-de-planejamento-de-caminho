% NOME DO ARQUIVO: planejamento_rota_comparacao.m
% DESCRIÇÃO: Demonstração conceitual de uma Rota Global (A*) vs. uma 
%            Trajetória Local (DWA) suavizada, incluindo um obstáculo central.

clear; clc; close all;

figure;
axis([0 20 0 20]); % Define o tamanho do mapa
grid on; hold on;
title('Comparação Conceitual: Planejador Global (A*) vs. Local (DWA)');
xlabel('Posição X');
ylabel('Posição Y');

% Define e desenha um obstáculo central
% Formato: [x, y, largura, altura]
obstaculo = [4, 8, 12, 4]; 
rectangle('Position', obstaculo, 'FaceColor', [0.7 0.7 0.7], 'EdgeColor', 'k');

% Define o ponto de partida e o destino
startPos = [2, 2];
goalPos = [18, 2];

%% 2. DEFINIÇÃO DAS ROTAS
% A Rota A* (Global): Um caminho com "quinas"
path_A_star = [startPos;   % Ponto 1: Início
               2, 14;      % Ponto 2: Canto superior esquerdo
               18, 14;     % Ponto 3: Canto superior direito
               goalPos];   % Ponto 4: Destino

% A Trajetória DWA (Local): Uma curva suave que passa pelos pontos do A*.
num_waypoints = size(path_A_star, 1);
indices_waypoints = 1:num_waypoints;
pontos_intermediarios = linspace(1, num_waypoints, 200); % Gera 200 pontos para a curva

% Interpola os pontos do A* para criar uma curva suave (simulando um DWA)
path_DWA_smooth_x = spline(indices_waypoints, path_A_star(:,1), pontos_intermediarios);
path_DWA_smooth_y = spline(indices_waypoints, path_A_star(:,2), pontos_intermediarios);

%% 3. PLOTAGEM DOS RESULTADOS
% Plota a rota A*
plot(path_A_star(:,1), path_A_star(:,2), 'b--o', 'LineWidth', 2, 'MarkerSize', 8, 'DisplayName', 'Rota Global (A*)');

% Plota a trajetória suave do DWA
plot(path_DWA_smooth_x, path_DWA_smooth_y, 'r-', 'LineWidth', 2.5, 'DisplayName', 'Trajetória Local (DWA)');

% Plota os pontos de início e fim
plot(startPos(1), startPos(2), 'go', 'MarkerSize', 12, 'MarkerFaceColor', 'g', 'DisplayName', 'Início');
plot(goalPos(1), goalPos(2), 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'k', 'DisplayName', 'Destino');

% Adiciona a legenda
legend('show', 'Location', 'west');
hold off;