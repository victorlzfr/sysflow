# Bloqueio Técnico - Extração de Severity no n8n
Integração Alertmanager → n8n → Slack parcialmente configurada, mas bloqueada na extração correta do campo `severity`

# Data: 10-01-26
# Tempo Gasto: 1 hora 7 minutos

# Processo Realizado

1. **Configuração Inicial do Fluxo**
   - Webhook do n8n configurado no endpoint `/webhook/alertmanager`
   - Workflow básico criado: Webhook → Function → IF → HTTP Request (Slack)
   - URL do webhook do Slack obtida com sucesso

2. **Problema Identificado e Diagnosticado**
   - Teste via curl direto para o n8n: `curl -X POST http://localhost:5678/webhook/alertmanager`
   - Payload enviado contém `"severity": "critical"`
   - Nó Function processa mas gera saída com `severity: "none"`
   - Nó IF recebe valor incorreto e direciona para ramo falso
   - Fluxo não chega ao nó HTTP Request para o Slack

3. **Estado Atual dos Componentes**
   - **Alertmanager**: Configurado para enviar para `http://n8n:5678/webhook/alertmanager`
   - **n8n Workflow**: Estrutura pronta, mas código do Function Node precisa de ajuste
   - **Slack**: Webhook configurado, aguardando primeira notificação
   - **Código JavaScript**: Versão atual não extrai `severity` do formato de teste

4. **Próximos Passos Necessários**
   - Revisar e corrigir o código do nó Function para extrair `severity` corretamente
   - Testar com payloads nos formatos Alertmanager real e de teste
   - Validar que o nó IF direciona corretamente para `critical` e `warning`
   - Executar teste end-to-end completo

# Bloqueio Técnico
O código JavaScript no nó Function não está mapeando corretamente o campo `severity` do payload de entrada para a saída. Necessário ajustar a lógica de extração para o formato específico usado nos testes.
