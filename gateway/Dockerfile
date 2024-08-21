FROM alpine:latest

# Installation des paquets nécessaires
RUN apk update && apk upgrade
RUN apk add --no-cache iptables iproute2

# Activation du routage IP
RUN echo net.ipv4.ip_forward=1 | tee -a /etc/sysctl.conf && sysctl -p

# Script de démarrage pour configurer le routage et les règles iptables
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Définir le script de démarrage comme le point d'entrée de l'image
ENTRYPOINT ["/usr/local/bin/start.sh"]
