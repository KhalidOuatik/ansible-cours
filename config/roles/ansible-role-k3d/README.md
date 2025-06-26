# Exercice 33 : Déploiement automatisé d’un cluster Kubernetes k3d avec Ansible

## Énoncé

**Exercice 33 :** Mettre en œuvre Ansible pour automatiser le déploiement d’un cluster Kubernetes léger avec k3d, dans un environnement Docker, et y déployer un service web NGINX personnalisé, tout cela sans quitter votre machine locale.

**Contexte :**
Vous venez d’être recruté comme DevOps junior dans une entreprise spécialisée dans l’hébergement de sites web. Votre manager vous confie une première mission : améliorer la plateforme d’apprentissage interne sur https://github.com/franklin-tutorials/ansible pour permettre aux développeurs de tester leurs déploiements dans un cluster Kubernetes local, léger et réutilisable.

**Objectifs de la mission :**
- Automatiser le déploiement d’un cluster Kubernetes local avec k3d via un playbook Ansible.
- Créer un manifest Kubernetes nginx.yaml pour exposer un site web avec un message personnalisé.
- Déployer ce manifest dans le cluster automatiquement à la fin du playbook.

---

## Approche retenue

- Utilisation d’un **rôle Ansible** (`ansible-role-k3d`) pour tout automatiser : installation de k3d, kubectl, création du cluster, et déploiement du manifest NGINX.
- Le rôle est appelé dans un playbook unique, exécuté en local dans le conteneur Ansible (avec le socket Docker monté).
- Le manifest `nginx.yaml` est intégré dans le rôle pour garantir la portabilité et la reproductibilité.
- Le port 30080 est exposé automatiquement pour accéder au service NGINX depuis la machine hôte.

---

## Arborescence des fichiers utilisés

```
config/
├── playbooks/
│   └── k3d-nginx-role-demo.yaml         # Playbook principal pour lancer le rôle
├── roles/
│   └── ansible-role-k3d/
│       ├── README.md                    # Ce fichier
│       ├── files/
│       │   └── nginx.yaml               # Manifest Kubernetes NGINX personnalisé
│       └── tasks/
│           ├── main.yml                 # Inclusion des sous-tâches
│           ├── install_k3d.yml          # Installation de k3d, kubectl, Docker CLI
│           ├── create_cluster.yml       # Création/suppression du cluster k3d
│           └── deploy_nginx.yml         # Application du manifest NGINX
```

---

## Résultat attendu

- Après exécution du playbook, un cluster k3d est disponible localement.
- Le service NGINX personnalisé est accessible sur http://localhost:30080 avec le message :
  **Bien joué cela fonctionne**
- Toute la chaîne est automatisée, reproductible et portable.
