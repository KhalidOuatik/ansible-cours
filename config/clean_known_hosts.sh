#!/bin/bash
# Script à placer dans le conteneur ansible pour nettoyer les empreintes SSH des clients
for h in client1 client2 client3 client4; do
    ssh-keygen -R "$h"
done
rm -f /root/.ssh/known_hosts.old
