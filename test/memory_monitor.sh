#!/bin/bash

# Установка порога использования памяти в процентах
THRESHOLD=80

# Периодичность проверок в секундах
SLEEP_INTERVAL=60

# API URL для отправки HTTP запроса
API_URL="http://localhost:8080/api/alarm"

while true; do
    # Получаем процент использованной памяти
    used=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

    # Сравниваем с порогом
    if (( $(echo "$used > $THRESHOLD" | bc -l) )); then
        # Отправляем HTTP POST запрос на API
        curl -X POST $API_URL -H "Content-Type: application/json" -d "{\"alarm\":\"memory usage high\",\"used\":$used}"
    fi

    # Ждем перед следующей проверкой
    sleep $SLEEP_INTERVAL
done
