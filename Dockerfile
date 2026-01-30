# Usa una versión estable de n8n (evita "latest" para tener builds reproducibles)
FROM n8nio/n8n:1.66.1

# Cambiar a root para instalar paquetes del sistema
USER root

# Instalar Graphviz (proporciona el comando `dot`)
RUN apt-get update \
    && apt-get install -y --no-install-recommends graphviz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ====== (Opcional) Config que ya tenías; mantenla si la necesitas ======
# Variables que ya usabas (si te sirven, puedes dejarlas)
# ENV N8N_HOST=<tu-host>
# ENV N8N_PORT=0.0.0.0
# ENV N8N_PROTOCOL=https
# ENV N8N_WEBHOOK_URL=<tu-webhook-url>

# Crear directorio de trabajo (si lo usabas)
# RUN mkdir -p /home/node/.n8n \
#  && chown -R node:node /home/node/.n8n

# Volver al usuario por defecto para ejecutar n8n
USER node

# Comando de inicio (la imagen ya trae "n8n start" por defecto,
# pero si quieres mantenerlo explícito, puedes dejarlo)
CMD ["n8n", "start"]
