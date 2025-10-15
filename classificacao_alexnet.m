% NOME DO ARQUIVO: classificacao_alexnet.m
% DESCRIÇÃO: Identificação interativa de imagens usando a rede neural AlexNet.
% REQUISITOS: Deep Learning Toolbox e o pacote de modelo AlexNet.

%% 1. PREPARAÇÃO DO AMBIENTE
clc;
clear;
close all;

disp('Carregando a rede neural AlexNet (apenas uma vez)...');
try
    net = alexnet;
    inputSize = net.Layers(1).InputSize;
    disp('AlexNet carregada com sucesso.');
catch
    disp('ERRO: AlexNet não encontrada.');
    disp('Por favor, instale o "Deep Learning Toolbox Model for AlexNet Network".');
    return;
end

%% 2. CONFIGURAÇÃO DAS PASTAS DO DATASET
% --- Caminho para suas imagens ---
% ATENÇÃO: Altere este caminho para onde suas imagens estão!
mainPath = 'C:\Users\muril\Downloads\ObstacleDataset'; 
% Nomes exatos das subpastas.
obstacleFolders = {'box', 'chair'};

% Verifica se a pasta principal existe
if ~isfolder(mainPath)
    disp(['ERRO: A pasta principal não foi encontrada em: ', mainPath]);
    disp('Por favor, verifique se o caminho está correto e se a pasta existe.');
    return;
end

% Prepara a janela de visualização 
figure('Name', 'Resultados da Classificação de Obstáculos', 'Position', [100, 100, 800, 500]);

%% 3. LOOP DE CLASSIFICAÇÃO INTERATIVO
while true 
    % Itera sobre cada pasta de obstáculo
    for i = 1:length(obstacleFolders)
        currentFolder = obstacleFolders{i};
        fullFolderPath = fullfile(mainPath, currentFolder);
        
        % Verifica se a pasta da iteração atual existe
        if ~isfolder(fullFolderPath)
            disp(['ERRO: A subpasta "', currentFolder, '" não foi encontrada dentro de ObstacleDataset.']);
            continue;
        end
        
        % Lista todos os arquivos de imagem na pasta atual
        imageFiles = dir(fullfile(fullFolderPath, '*.jpg'));
        imageFiles = [imageFiles; dir(fullfile(fullFolderPath, '*.png'))];
        imageFiles = [imageFiles; dir(fullfile(fullFolderPath, '*.jpeg'))];
        
        % Se não houver arquivos de imagem, pula para o próximo
        if isempty(imageFiles)
            disp(['AVISO: Não há imagens nas extensões .jpg, .png ou .jpeg na pasta: ', fullFolderPath]);
            continue;
        end

        % Escolhe uma imagem aleatória da lista
        randomIndex = randi(length(imageFiles));
        randomImageName = imageFiles(randomIndex).name;
        fullImagePath = fullfile(fullFolderPath, randomImageName);
        
        % Carrega e pré-processa a imagem
        img = imread(fullImagePath);
        imgResized = imresize(img, [inputSize(1), inputSize(2)]);
        
        % Classifica a imagem
        [label, score] = classify(net, imgResized);
        
        % Prepara os resultados para exibição
        predictedLabel = string(label);
        maxScore = max(score);
        
        % Exibe o resultado na janela gráfica
        subplot(1, length(obstacleFolders), i);
        imshow(imgResized);
        title(sprintf('Real: %s\\nPredição: %s (%.2f%%)', currentFolder, predictedLabel, maxScore*100), 'FontSize', 12);
    end
    
    % Pausa e espera pelo comando do usuário 
    disp(' ');
    userInput = input('Pressione Enter para testar outras imagens ou digite ''sair'' para terminar: ', 's');
    if strcmpi(userInput, 'sair')
        disp('Programa finalizado.');
        break; % Interrompe o loop "while"
    end
    % Se o usuário apenas apertar Enter, o loop "while" recomeça.
end 
close;