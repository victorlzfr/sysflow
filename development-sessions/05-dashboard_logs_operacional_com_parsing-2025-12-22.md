# Conquista
Dashboard de logs do SysFlow aprimorado com parsing de níveis e painéis dinâmicos operacionais.

# Data: 22-12-25
# Tempo Gasto: 1 hora 50 minutos

# Processo Concluído

1. **Correção do Parsing de Logs**
   - Configuração do pipeline do Promtail corrigida para extrair níveis (INFO, ERROR, DEBUG) dos logs
   - Label `level` criado e validado no Loki (valores: DEBUG, ERROR, INFO)
   - Timestamp dos logs ajustado para evitar duplicação

2. **Dashboard de Logs Aprimorado**
   - Painéis atualizados para usar datasource Loki corretamente (UID corrigido: P8E80F9AEF21F6940)
   - Variável de template `job` funcionando com valores fixos (sysflow, varlogs, containerlogs)
   - Painel "Log Count by Level" adicionado e exibindo dados
   - Queries ajustadas com fallback para variável `level`

3. **Correção de Configuração**
   - Janela de tempo expandida para `now-4h` (problema de timezone UTC/local)
   - Timezone configurado como `browser` para consistência
   - Refresh rate ajustado para `5s` para atualização em tempo real
   - Erro "Datasource loki was not found" resolvido

4. **Validação do Pipeline**
   - Logs sendo ingeridos corretamente via Promtail → Loki
   - Queries funcionando via API `/query_range`
   - Filtro por nível operacional: `{job="sysflow", level="ERROR"}` retorna apenas logs de erro

*Status final:* Dashboard funcional com logs em tempo real, painéis dinâmicos e estatísticas por nível. Variável `level` configurada mas dropdown não populando opções automaticamente - a ser abordado na próxima sessão.
