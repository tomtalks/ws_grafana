Pour accéder aux données, il faut les importer dans Grafana. Pour cela, il faut ajouter une source de données.

Rendez-vous dans le menu de configuration à gauche, puis cliquez sur *Connections*.

### Les différents types de data sources

Il existe de multiples plugins pour se connecter à différentes data sources.

On retrouve bien évidemment les datasources sur des bases de données de type time series (Prometheus, Tempo, InfluxDB). Mais aussi des bases relationnelles ou NoSQL, des bases de traces (Jaeger, Tempo) ou de log (Loki, Elasticsearch).

Chaque source de données a sa propre configuration et son propre langage de requêtage.

Au programme donc plusieurs cas (*On vous conseille de les faire dans l'ordre, mais c'est vous qui voyez*) : 

* [🐣 Mon premier dashboard](vizu/1.md) : Pour découvrir les fonctionnalités de base
* [💾 PostGreSQL](dashboard-business/README.md) : Pour afficher des données d'une base de données
* [🎠 Prometheus](dashboard-metrics/README.md) : Pour afficher des données issues d'une source de données dynamique
* [🎢 Prometheus avancé](dashboard-metrics/advanced.md) : Pour aller plus loin dans la configuration
