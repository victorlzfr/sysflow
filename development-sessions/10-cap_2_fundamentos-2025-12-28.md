# Conquista
Início da redação do Capítulo 2 (Fundamentos) do Guia Pedagógico SysFlow, com duas seções completas que conectam teoria dos conceitos de observabilidade aos arquivos reais do projeto.

# Data: 28-12-2025
# Tempo Gasto: 36 minutos

# Processo Concluído

1. **Análise de Arquivos do Projeto para Base Conceitual**
   - Revisão do arquivo principal `docker-compose.yml` para compreensão da estrutura de contêineres
   - Análise do arquivo de configuração `prometheus.yml` para entendimento da coleta de métricas
   - Exame do `promtail-config.yml` para fundamentação do pipeline de logs
   - Verificação dos arquivos de datasources do Grafana (`prometheus.yml`, `loki.yml`)

2. **Redação da Seção 2.1 - Contêiner como Unidade Básica**
   - Desenvolvimento de analogia pedagógica (quebra-cabeça/caixinhas) para explicar Docker/Docker Compose
   - Análise detalhada e didática dos componentes do `docker-compose.yml` (image, container_name, restart, environment, volumes, ports, networks)
   - Explicação do princípio "infraestrutura como código" e sua materialização no arquivo
   - Formatação ABNT aplicada: títulos em negrito, estilo frase, sem ponto final

3. **Redação da Seção 2.2 - Coleta de Métricas com Prometheus**
   - Introdução do conceito de métricas e arquitetura pull do Prometheus
   - Explicação pedagógica dos exporters (node-exporter, cAdvisor) como tradutores de telemetria
   - Análise didática do arquivo `prometheus.yml` e seus jobs de scrape
   - Descrição do ciclo completo da métrica no SysFlow (exposição → coleta → armazenamento → consulta)
   - Demonstração da integração via rede Docker usando nomes de serviço

4. **Integração com Documentação Existente**
   - Análise do README.md do projeto para contextualização
   - Definição clara das funções distintas: README (técnico/operacional) vs Guia Pedagógico (didático/conceitual)
   - Planejamento de referências cruzadas entre os documentos
