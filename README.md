# Repositório de Algoritmos de Visão e Planejamento de Rota (MATLAB)

Este repositório contém uma coleção de scripts MATLAB focados em tarefas de processamento de imagens (classificação com Deep Learning) e planejamento de rota 2D.

## Estrutura do Projeto

| Arquivo | Descrição | Requisitos Específicos |
| :--- | :--- | :--- |
| **`classificacao_alexnet.m`** | Script para carregar a rede AlexNet e realizar uma classificação interativa de imagens. | Deep Learning Toolbox, Modelo AlexNet (instalável via Add-Ons do MATLAB). |
| **`planejamento_rota_simplificado.m`** | Exemplo básico de um espaço de planejamento 2D, definindo pontos de início, destino e obstáculos circulares. Traçado em linha reta (sem desvio). | Nenhum (MATLAB básico). |
| **`planejamento_rota_comparacao.m`** | Demonstração conceitual da diferença entre rotas globais (A*) e trajetórias suaves (simulação de DWA - Dynamic Window Approach). | Nenhum (MATLAB básico). |
| **`.gitignore`** | Configuração para ignorar arquivos de cache e dados gerados pelo MATLAB (`.mat`, `.fig`, etc.). | - |

## Requisitos Gerais

Para executar estes scripts, é necessário ter:

1.  **MATLAB** (Recomendada a versão R2020a ou mais recente).
2.  **Toolboxes:** Os scripts de Deep Learning exigem o **Deep Learning Toolbox**.

## Como Usar

1.  Clone este repositório para o seu computador.
    ```bash
    git clone [https://www.youtube.com/watch?v=6YQIWRyPxnk](https://www.youtube.com/watch?v=6YQIWRyPxnk)
    ```
2.  Abra o MATLAB e navegue até a pasta do repositório.
3.  Execute o script desejado no *Command Window* (por exemplo, `classificacao_alexnet`).

**⚠️ Nota sobre o script AlexNet:**
Você precisará criar ou ajustar a pasta `ObstacleDataset` no caminho configurado dentro do script (`mainPath`) e garantir que ele contenha as subpastas `box` e `chair` com as respectivas imagens.