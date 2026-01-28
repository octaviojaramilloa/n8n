# Usa la imagen oficial más reciente de n8n como base
FROM n8nio/n8n:latest

# Ajustes para Render: puerto dinámico y binding correcto
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https

# (Opcional) Si usarás webhooks públicos, puedes manejarlo como variable en Render:
# ENV WEBHOOK_URL=https://<tu-servicio>.onrender.com/

# Crear carpeta de datos persistente
RUN mkdir -p /data
VOLUME ["/data"]

# Comando de inicio
CMD ["n8n", "start"]
