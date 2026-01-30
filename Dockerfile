# Etapa 1: Conseguimos graphviz (incluye 'dot') desde Alpine
FROM alpine:3.19 AS alpine
RUN apk add --no-cache graphviz

# Etapa 2: n8n oficial (usa una etiqueta existente)
# Puedes usar 'stable' o una versión concreta disponible (por ejemplo, 2.6.0).
# Consulta: https://hub.docker.com/r/n8nio/n8n/tags
FROM n8nio/n8n:stable

# Cambiamos a root para copiar binarios y libs
USER root

# Copiamos el ejecutable y sus dependencias comunes
COPY --from=alpine /usr/bin/dot /usr/bin/dot
COPY --from=alpine /usr/bin/neato /usr/bin/neato
COPY --from=alpine /usr/lib/graphviz /usr/lib/graphviz
COPY --from=alpine /usr/share/graphviz /usr/share/graphviz
# En algunas plataformas también se requiere:
# COPY --from=alpine /usr/lib/libltdl.so* /usr/lib/

# Volvemos al usuario por defecto
USER node

# (Opcional) Comando explícito; la imagen ya trae el entrypoint por defecto
CMD ["n8n", "start"]
