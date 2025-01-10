# 🚂 Présentation de l'application

## Introduction à Grafana et ses menus principaux

Avec ce chapitre nous allons nous familiarisé avec les différents menu de configuration accessible depuis l'interface de Grafana.

Nous n'explorerons pas en détails les menu d'administration par la suite mais il est important de les connaitre.

Voici les principaux menus que vous utiliserez dans Grafana :

Sur le coté gauche de l'application:

![Menu](image.png){ align=left }

### **Home**
La page d'accueil qui vous permet d'accéder rapidement à vos tableaux de bord favoris et d'explorer les options de configuration générales.

### **Dashboards**
Cette section permet de gérer vos tableaux de bord Creation + liste des dashboards existants.

Les menu **Bookmarks** et **Starred** permettent de retrouver rapidement les tableaux de bord que vous avez marqué comme favoris.

### **Explore**
Un outil interactif pour analyser rapidement vos données (Idéal pour le dépannage rapide)

Nous en parlerons plus en détail dans un prochain chapitre. TODO

### **Alerting**
Configurez des alertes pour surveiller vos données et être notifié en cas d'anomalies 

Nous en parlerons plus en détail dans un prochain chapitre. TODO

### **Connections**
Grafana ne fournit pas de sources de données il n'est pas responsable du stockage. 

Il se connecte uniquement à ces **data sources** pour afficher les données. Dans notre TP nous aurrons l'occasion de jouer avec les sources de données les plus courantes.

On verra qu'il n'y a pas de langage de requête spécifique à Grafana, il utilise le langage de requête de la source de données.

### **Administration**

Permet de configurer les différents aspects de Grafana :

* **General** : En plus des menus de configuration on trouve ici la notion d'**Organization** c'est le plus haut niveau de ségregation de grafana.

![alt text](image-2.png){ align=left } Une **Organization** représente un tenant de votre instance. Il est possible d'y affecter des utiliseurs et de leur donner des droits d'administration / editeur / consultation.

Toutes les ressources d'une organisation sont isolées des autres organisations. Il n'est pas possible de partager une datasource ou un dashboard entre deux organisations. Cette ségregation présente quelques limitations mais elle à le mérite de faire partie de la version gratuite de grafana.

Si vous etes membre de plusieurs organisation vous pouvez changer d'organisation en cliquant sur le nom de l'organisation en haut à gauche de l'interface.

* **Plugins** : Installez des plugins pour étendre les fonctionnalités de Grafana (widgets, datasources, extensions).
* **Users** : Gérez les utilisateurs et les permissions. Il est possible de regrouper les utilisateurs en **Teams** pour faciliter la gestion des droits.

* **Authentification** : Permet de configurer les différents modes d'authentification (LDAP, OAuth, etc.)

![top-left](image-1.png){ align=right }

## **Help**

Un espace pour accéder à la documentation et aux ressources d'aide :
* **Community Support** : Rejoignez la communauté Grafana.
* **Documentation** : Lisez les guides officiels pour approfondir vos connaissances.

## Acces à votre profil

Gestion langue, des time Zones, mdp  ... 

## Mais encore ?

Bon ... Et si on commencé notre workshop ?

**🛫 Prochaine étape : Mon premier Dashboard [➡️](../vizu/1.md)**