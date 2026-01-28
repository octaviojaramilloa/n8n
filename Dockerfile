# Usa la imagen oficial más reciente de n8n como base
FROM n8nio/n8n:latest

# Ajustes para Render: puerto dinámico y binding correcto
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https

# Directorio de datos estándar de n8n
ENV N8N_USER_FOLDER=/home/node/.n8n

# Asegurar que el directorio exista y tenga permisos para el usuario 'node'
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

# (Opcional) Si usarás webhooks públicos, define esto como variable en Render (no aquí):
# WEBHOOK_URL=https://<tu-servicio>.onrender.com/

# Comando de inicio
CMD ["n8n", "start"]
