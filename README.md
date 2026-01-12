# SysFlow - Observabilidade para Logística e Automação

## Visão Geral
SysFlow é uma stack completa de observabilidade auto-hospedada focada em monitoramento de integrações APIs e automação, desenvolvida para casos de uso de logística. A solução implementa coleta, alertas e visualização unificada com pipeline completo até notificações no Slack.

## Stack Atual
- **Monitoramento**: Prometheus, Alertmanager, Node Exporter, cAdvisor
- **Logs**: Loki + Promtail
- **Visualização**: Grafana com dashboards provisionados
- **Automação**: n8n integrado para processamento de alertas
- **Armazenamento**: TimescaleDB para métricas históricas

## Instalação
```bash
git clone https://github.com/victorlzfr/sysflow.git
cd sysflow
docker-compose up -d
```

## Acessos
- **Grafana**: http://localhost:3000 (admin/admin123)
- **Prometheus**: http://localhost:9090
- **Alertmanager**: http://localhost:9093
- **n8n**: http://localhost:5678

## Pipeline de Alertas
Prometheus → Alertmanager → n8n (webhook) → Slack

## Caso de Uso: Beuni (Logística)
Monitoramento de integrações entre APIs de estoque e ERP, com alertas proativos para falhas de sincronização e dashboard NOC unificado.

## Roadmap
- [x] Stack básica de observabilidade
- [x] Integração n8n para automação de alertas
- [x] Pipeline completo até Slack
- [ ] Dashboard NOC com KPIs de logística
- [ ] API FastAPI para métricas customizadas
- [ ] Monitoramento de APIs externas

## Configuração
Toda stack é configurável via arquivos no diretório `configs/`: alertmanager, grafana, loki, n8n, prometheus.

## Tecnologias
Docker Compose, Prometheus, Grafana, Loki, n8n, TimescaleDB, Alertmanager, Slack.

