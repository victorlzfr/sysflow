# SysFlow - Plataforma de Observabilidade Self-Hosted

## Visão Geral
SysFlow é uma stack completa de observabilidade auto-hospedada para monitoramento de infraestrutura e aplicações. A solução implementa coleta, armazenamento e visualização unificada de métricas e logs em tempo real.

## Arquitetura
A plataforma é composta por 7 serviços Docker orquestrados:

### Armazenamento e Processamento
- **TimescaleDB**: Armazenamento de métricas de longo prazo
- **Prometheus**: Coleta e armazenamento de métricas
- **Loki**: Agregação e indexação de logs

### Coleta de Dados
- **Promtail**: Coletor de logs com parsing automático
- **Node Exporter**: Métricas do sistema host
- **cAdvisor**: Métricas de containers Docker

### Visualização
- **Grafana**: Dashboards unificados com provisionamento automático

## Instalação
```bash
git clone https://github.com/victorlzfr/sysflow.git
cd sysflow
docker-compose up -d
```
## Acessos
- **Grafana**: http://localhost:3000 (usuário: admin, senha: admin123)

- **Prometheus**: http://localhost:9090

- **Loki**: http://localhost:3100 (API-only)

- **cAdvisor**: http://localhost:8080

## Dashboards

### Dashboard de Métricas (UID: sysflow-metrics)
- CPU, memória e uso de disco do host

- Métricas de containers por nome

- Filtros dinâmicos por instância

### Dashboard de Logs (UID: sysflow-logs)
- Visualização de logs em tempo real

- Parsing automático de níveis (INFO, ERROR, DEBUG)

- Taxa de logs e contagem por nível

- Filtros por job e nível de log

## Configuração
A stack é totalmente configurável via arquivos no diretório configs/:
```bash
configs/grafana/provisioning/datasources/: Fontes de dados (Prometheus, Loki)

configs/grafana/provisioning/dashboards/: Definições dos dashboards

configs/prometheus/prometheus.yml: Configuração de scrape do Prometheus

configs/loki/promtail-config.yml: Pipeline de coleta de logs
```
## Extensibilidade
Para monitorar uma nova aplicação:

1) Adicione um novo job no prometheus.yml

2) Configure o Promtail para coletar os logs da aplicação

3) Estenda os dashboards existentes ou crie novos

## Roadmap
- Implementação de alertas com Alertmanager

- Métricas de aplicações personalizadas

- Autenticação externa no Grafana (OAuth/SSO)

- Backup e restore automatizado

- Monitoramento de banco de dados TimescaleDB
