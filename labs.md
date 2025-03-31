Pour accéder aux données, il faut les importer dans Grafana. Pour cela, il faut ajouter une source de données.

Rendez-vous dans le menu de configuration à gauche, puis cliquez sur *Connections*.

### Les différents types de data sources

Il existe de multiples plugins pour se connecter à différentes data sources.

On retrouve bien évidemment les datasources sur des bases de données de type time series (Prometheus, Tempo, InfluxDB). Mais aussi des bases relationnelles ou NoSQL, des bases de traces (Jaeger, Tempo) ou de log (Loki, Elasticsearch).

Chaque source de données a sa propre configuration et son propre langage de requêtage.