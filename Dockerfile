# Usa la imagen oficial más reciente de n8n como base
FROM n8nio/n8n:latest

# Ajustes para Render: puerto dinámico y binding correcto
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https

# Asegurar PATH (por si la shell/usuario no hereda el PATH esperado)
ENV PATH="/usr/local/bin:${PATH}"

# Directorio de datos estándar de n8n
ENV N8N_USER_FOLDER=/home/node/.n8n

# Asegurar que el directorio exista y tenga permisos para el usuario 'node'
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

# Comando de inicio: usar ruta ABSOLUTA del binario de n8n
CMD ["/usr/local/bin/n8n", "start"]
