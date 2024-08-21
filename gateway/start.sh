#!/bin/sh

# Activation du NAT (si nécessaire)
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Règles iptables pour autoriser le trafic entre les conteneurs
iptables -A FORWARD -s 172.40.0.0/24 -d 172.40.0.0/24 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j DROP

# Boucle infinie pour que le conteneur reste actif
tail -f /dev/null
