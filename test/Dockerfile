# Используем базовый образ
FROM ubuntu:latest

# Установка curl и bc
RUN apt-get update && apt-get install -y curl bc

# Копируем скрипт в контейнер
COPY memory_monitor.sh /memory_monitor.sh

# Даем права на выполнение скрипта
RUN chmod +x /memory_monitor.sh

# Команда для запуска скрипта
CMD ["/memory_monitor.sh"]
