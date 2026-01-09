#!/bin/bash
# start_sysflow_final.sh

echo "🚀 INICIANDO SYSFLOW STACK COMPLETA"
echo "=================================="

# Limpar ambiente anterior
echo "1. Parando serviços anteriores..."
docker-compose down 2>/dev/null

# Remover volumes antigos do n8n se existirem (opcional)
# docker volume rm sysflow_n8n_data 2>/dev/null || true

# Iniciar stack
echo "2. Iniciando todos os serviços..."
docker-compose up -d

echo "3. Aguardando inicialização (40 segundos)..."
echo -n "   "
for i in {1..40}; do
    echo -n "."
    sleep 1
    if [ $((i % 10)) -eq 0 ]; then
        echo -n " "
    fi
done
echo ""

echo ""
echo "4. STATUS DOS CONTAINERS:"
echo "-------------------------"
docker-compose ps

echo ""
echo "5. TESTES RÁPIDOS:"
echo "-----------------"

# Função de teste com timeout
test_service() {
    local name=$1
    local port=$2
    local path=$3
    
    echo -n "   $name (porta $port)... "
    if timeout 5 bash -c "cat < /dev/null > /dev/tcp/localhost/$port" 2>/dev/null; then
        echo "✅ ONLINE"
        return 0
    else
        echo "❌ OFFLINE"
        return 1
    fi
}

test_service "Grafana" "3000"
test_service "Prometheus" "9090" 
test_service "Alertmanager" "9093"
test_service "n8n" "5678"
test_service "Loki" "3100"
test_service "Node Exporter" "9100"
test_service "cAdvisor" "8080"

echo ""
echo "6. VERIFICANDO SAÚDE DOS SERVIÇOS:"
echo "---------------------------------"

# Testar endpoints específicos
echo -n "   n8n health check... "
if curl -s -f http://localhost:5678/healthz --max-time 5 | grep -q "OK"; then
    echo "✅ SAUDÁVEL"
else
    echo "❌ PROBLEMA"
    echo "   Logs do n8n:"
    docker-compose logs n8n --tail=5
fi

echo -n "   Prometheus targets... "
if curl -s http://localhost:9090/api/v1/targets --max-time 5 | grep -q '"health":"up"'; then
    echo "✅ MÉTRICAS COLETANDO"
else
    echo "⚠️  ALGUNS TARGETS OFFLINE"
fi

echo -n "   Loki readiness... "
if curl -s http://localhost:3100/ready --max-time 5 | grep -q "ready"; then
    echo "✅ PRONTO"
else
    echo "❌ NÃO PRONTO"
fi

echo ""
echo "7. INSTRUÇÕES DE ACESSO:"
echo "========================"
echo ""
echo "📊 GRAFANA:"
echo "   URL:      http://localhost:3000"
echo "   Usuário:  admin"
echo "   Senha:    admin123"
echo ""
echo "⚡ n8n:"
echo "   URL:      http://localhost:5678"
echo "   Usuário:  admin"
echo "   Senha:    admin123"
echo ""
echo "📈 PROMETHEUS:"
echo "   URL:      http://localhost:9090"
echo ""
echo "🚨 ALERTMANAGER:"
echo "   URL:      http://localhost:9093"
echo ""
echo "📝 LOKI (Logs):"
echo "   URL:      http://localhost:3100"
echo ""
echo "🛠️  COMANDOS ÚTEIS:"
echo "   docker-compose logs -f [nome]  # Ver logs de um serviço"
echo "   docker-compose restart [nome]  # Reiniciar serviço"
echo "   docker-compose down            # Parar toda a stack"
echo "   docker-compose ps              # Ver status"
echo ""
echo "8. MONITORAMENTO:"
echo "----------------"
echo "   Para verificar se as métricas estão sendo coletadas:"
echo "   http://localhost:9090/targets"
echo ""
echo "⚠️  NOTA: O TimescaleDB está configurado na porta 5433 (externo)"
echo "   para evitar conflito com PostgreSQL local (5432)."
echo ""
echo "=================================="
echo "🎯 SYSFLOW STACK INICIADA!"
echo "=================================="
