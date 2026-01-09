# Conquista
Implementação do Dashboard de Métricas do Prometheus, completando a stack de observabilidade do SysFlow com coleta e visualização de métricas de host e containers.

# Data: 22-12-25
# Tempo Gasto: 1 hora 9 minutos

# Processo Concluído

1. Configuração da Coleta de Métricas
   - Adicionados serviços `node-exporter` e `cadvisor` ao `docker-compose.yml`
   - Configurado `prometheus.yml` para scraping dos novos endpoints
   - Validação dos targets e métricas disponíveis na API do Prometheus

2. Criação do Dashboard de Métricas no Grafana
   - Desenvolvido `sysflow-metrics-dashboard.json` com 4 painéis essenciais
   - Implementadas queries para CPU, Memória, Disco I/O e Containers
   - Configurada variável de template (`instance`) para filtragem
   - Definido UID fixo (`sysflow-metrics`) para referência consistente

3. Resolução de Conflitos e Problemas Técnicos
   - Diagnóstico e correção manual de dashboard duplicado via manipulação do SQLite
   - Deleção do UID conflitante (`ddbabf3f-2f29-42dd-8526-81727596dfd7`) do banco de dados
   - Correção de problema de permissão que impedia inicialização do Grafana
   - Recriação limpa do serviço Grafana com provisionamento automático

4. Limpeza e Otimização da Estrutura do Projeto
   - Remoção de diretórios e arquivos não utilizados (agent, api, dashboard)
   - Commit das mudanças para manter histórico limpo e focado
