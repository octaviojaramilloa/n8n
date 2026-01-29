# Use the official latest n8n image as base
FROM n8nio/n8n:latest

# Render settings: dynamic port and correct binding
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https

# Ensure PATH (in case the runtime shell/user doesn't inherit PATH as expected)
ENV PATH="/usr/local/bin:${PATH}"

# Standard n8n data folder
ENV N8N_USER_FOLDER=/home/node/.n8n

# Make sure the folder exists and belongs to 'node'
USER root
RUN mkdir -p /home/node/.n8n
RUN chown -R node:node /home/node/.n8n
USER node

# Start command (absolute binary path to avoid PATH issues)
CMD ["/usr/local/bin/n8n", "start"]
