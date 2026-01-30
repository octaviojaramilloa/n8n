# Etapa 1: conseguir Graphviz (dot) desde Alpine
FROM alpine:3.19 AS alpine
RUN apk add --no-cache graphviz

# Etapa 2: imagen oficial de n8n (usa una etiqueta existente)
# Puedes usar 'stable' o fijar versión disponible (por ejemplo, 2.6.0).
# Ver tags: https://hub.docker.com/r/n8nio/n8n/tags
FROM n8nio/n8n:stable

# Ser root para copiar binarios/libs
USER root

# Copiamos binarios y recursos de graphviz desde la etapa Alpine
COPY --from=alpine /usr/bin/dot /usr/bin/dot
COPY --from=alpine /usr/bin/neato /usr/bin/neato
COPY --from=alpine /usr/lib/graphviz /usr/lib/graphviz
COPY --from=alpine /usr/share/graphviz /usr/share/graphviz
# En algunas plataformas puede hacer falta esta librería:
# COPY --from=alpine /usr/lib/libltdl.so* /usr/lib/

# Volver al usuario por defecto
USER node

# No sobreescribimos el ENTRYPOINT/CMD: la imagen de n8n ya arranca sola.
# (Si quieres mantenerlo explícito podrías usar: CMD ["n8n", "start"])
