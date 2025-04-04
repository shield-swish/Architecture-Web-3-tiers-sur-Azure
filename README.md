# Architecture-Web-3-tiers-sur-Azure

Ce projet vise à déployer une architecture web 3-tiers sur Azure en utilisant Terraform pour la gestion de l'infrastructure en tant que code. L'infrastructure déployée est composée de :

- Une VM Frontend avec un serveur web NGINX
- Une VM Backend pour le traitement des requêtes
- Une Base de données MySQL managée (Azure Database for MySQL)
- Un réseau sécurisé avec des sous-réseaux et un NSG (Network Security Group)

L'application web sur la VM Frontend est configurée pour afficher une page HTML simple indiquant qu'elle a été déployée automatiquement avec Terraform.

Composants clés :

- Frontend VM : Un serveur NGINX qui sert une page HTML avec des informations sur le déploiement.
- Backend VM : Une VM dédiée pour exécuter des applications backend (API, logique d'affaires).
- Database : Une base de données MySQL managée sur Azure pour stocker les données.
- Réseau sécurisé : Un réseau virtuel avec des sous-réseaux isolés pour chaque tier, sécurisé par un Network Security Group.

Conclusion
Ce projet permet de comprendre comment déployer une infrastructure cloud multi-tiers avec Terraform sur Azure. Il montre comment gérer les ressources cloud de manière déclarative et réutilisable, tout en automatisant le déploiement d'une application web complète.


Étapes futures :

- Ajouter un backend API : Le backend pourra traiter des requêtes via des services REST, en interagissant avec la base de données MySQL.
- Configurer une CI/CD pipeline : Utiliser Azure DevOps ou GitHub Actions pour automatiser le déploiement de l'application et la gestion de l'infrastructure.
- Sécurisation avancée : Ajouter des contrôles d'accès supplémentaires à la base de données et des règles de sécurité plus strictes sur les VMs.
