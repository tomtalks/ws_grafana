# Les plugin Grafana

Grafana est extensible via des plugins. Il existe de nombreux plugins disponibles sur le site de Grafana. Il est possible d'installer des plugins directement depuis l'interface de Grafana ou en ligne de commande.

La configuration est accessible par le menu `Administration > Plugins and data > Plugins` dans Grafana.

Ici nous allons jouer avec le plugin Infinity.

## 🎯 Fonctionnalités Clés

La source de données Infinity prend en charge les fonctionnalités clés suivantes :

- Intégrer des données provenant de multiples sources dans Grafana
- Manipulation flexible des données avec UQL, JSONata, GROQ
- Divers formats de données tels que JSON, CSV
- Diverses méthodes d'authentification :
  - Basic authentication
  - Bearer token authentication
  - API key authentication
  - OAuth passthrough
  - OAuth2 client credentials
  - OAuth2 JWT authentication
  - AWS/Azure/GCP authentication
  - Digest authentication
- Alertes, requêtes enregistrées, tableaux de bord partagés, mise en cache des requêtes
- Fonctions utilitaires pour les variables
- Panneau de graphe de nœuds Grafana, annotations, etc.

## 🚗 Utilisation avec du JSON
https://github.com/grafana/grafana-infinity-datasource/discussions/34

## 🚗 Utilisation avec du CSV
https://github.com/grafana/grafana-infinity-datasource/discussions/36
