# 🕵️ Grafana et les logs / traces

Quand on parle de monitoring, on distingue souvent trois types de données :

* Les métriques
* Les logs
* Les traces

Nous avons déjà vu comment afficher les métriques dans Grafana en s'appuyant sur `Prometheus`, mais il est aussi possible d'afficher les logs et les traces.

## Ajout des DS Loki et Tempo

Pour celà on vas configurer Grafana pour qu'il puisse se connecter à `Loki` et `Tempo`.

Objectifs:

* Si ce n'est pas déjà fait la datasource pour `Prometheus` [ici](README.md#prometheus)
* Une data source pour se connecter à l'instance `Loki` (Le storage pour nos logs)
    * URL : http://loki:3100
* Une data source pour se connecter à l'instance `Tempo` (le storage pour les traces)
    * URL : http://tempo:3200
    * Trace to metrics : "prometheus"
    * Trace to Logs : "loki"

Les logs sont ici gérés par Grafana `Loki` et les traces par Grafana `Tempo`. Nous allons importer le dashboard suivant pour manipuler les logs et les traces.

???note "Observability Sample.json"
    ``` { .json .copy }
        --8<-- "dashboards/Observability Sample.json"
    ```
Deux nouvelles visualisation sont disponible avec ce Dashboard.

## Logs

La premiére est la visualisation `Log` qui vas permettre d'afficher les résultats de nos requetes vers `Loki`

Utilisez la fonction *Explain Query* pour obtenir de l'aide sur ce que fait cette requete

![alt text](image-39.png)

Pour aller plus loin sur la configuration des logs c'est par [ici](https://grafana.com/docs/grafana/latest/panels-visualizations/visualizations/logs/){target="_blank"}.

On utilise Loki comme stockage mais il est possible de faire la meme chose avec Elastic, InfluxD ou autre.

!!!success "On n'affiche pas les logs INFO"
    On vas ici modifier la requete pour masquer les logs au niveau INFO

???danger "Spoiler la solution est là"
    On ajoute simplement un filtre sur le label `level` pour exclure la valeur *INFO*
    ![alt text](image-40.png)

## Traces

Les traces permettent de visualiser un succession d'événements.

Une trace est consitituée de *N* Spans qui correspondent à une action.

Ici nous utilisons l'agent OpenTelemetry sur les applications Java pour les outiller. C'est l'instrumentation automatique de l'agent qui définit les spans.

Il est aussi possible de définir ces span par développement dans l'application en utilisant [la librairie OTEL](https://opentelemetry.io/docs/concepts/instrumentation/libraries/){target="_blank"}. Elle est disponible dans [plusieurs langage](https://opentelemetry.io/docs/languages/).

![alt text](image-41.png)


**🛫 Prochaine étape : Plugin Infinity & API [➡️](../dashboard-plugin/README.md)**