# Conquista
Completação da seção 2.5 (A Trilha dos Eventos: Loki e o Agente Promtail) do Capítulo 2 do Guia Pedagógico SysFlow, com análise técnica detalhada dos arquivos de configuração do Loki e Promtail.

# Data: 28-12-2025
# Tempo Gasto: 6 minutos

# Processo Concluído

1. **Análise Técnica dos Arquivos Loki/Promtail**
   - Análise estrutural do `local-config.yaml` com foco em retenção de logs (1 hora), armazenamento filesystem e cache de consultas
   - Exame detalhado do `promtail-config.yml` com três jobs de coleta: system, containers e sysflow
   - Identificação do pipeline de processamento com regex para extração de níveis de log (INFO, ERROR, DEBUG)

2. **Redação da Seção 2.5 - A Trilha dos Eventos: Loki e o Agente Promtail**
   - Explicação conceitual da filosofia do Loki: indexação por metadados vs. conteúdo do log
   - Demonstração da arquitetura de coleta: Promtail como agente com modelo push
   - Análise pedagógica da configuração: retenção curta (1h) para fins didáticos
   - Descrição do pipeline de três fontes: logs do sistema, containers Docker e aplicação SysFlow
   - Comparação técnica com stack de métricas (Prometheus vs. Loki)
   - Inclusão de comandos práticos para validação da instalação
   - Diagrama mental do caminho de uma linha de log através da stack

*Observação: Apenas conceitos teóricos foram abordados e redigidos, sem implementação prática ou modificação de código.*
