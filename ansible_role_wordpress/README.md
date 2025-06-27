# Ansible Role: WordPress + MariaDB

Ce rôle installe et configure WordPress avec MariaDB sur Ubuntu ou Rocky Linux.

## Variables principales
- `wordpress_db_name`: nom de la base de données WordPress
- `wordpress_db_user`: utilisateur MySQL pour WordPress
- `wordpress_db_password`: mot de passe utilisateur MySQL
- `wordpress_db_host`: hôte MySQL (par défaut: localhost)
- `wordpress_admin_email`: email admin du site
- `wordpress_site_url`: URL du site WordPress
- `wordpress_version`: version à installer (latest par défaut)
- `wordpress_install_dir`: dossier d'installation (par défaut: /var/www/html/wordpress)
- `mariadb_root_password`: mot de passe root MariaDB

## Utilisation

```yaml
- hosts: all
  become: true
  vars:
    mariadb_root_password: examplerootPW
    wordpress_db_password: examplePW
    wordpress_db_user: example
  roles:
    - role: ansible_role_wordpress
```

## Test

Lancez le playbook d'exemple fourni pour tester le rôle sur Ubuntu ou Rocky Linux.

## Publication

Publiez ce rôle sur Galaxy après test et validation.
