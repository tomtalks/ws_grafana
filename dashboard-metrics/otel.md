# 🕵️ Grafana et les logs / traces

Quand on parle de monitoring, on distingue souvent trois types de données :

* Les métriques
* Les logs
* Les traces

Nous avons déjà vu comment afficher les métriques dans Grafana en s'appuyant sur `Prometheus`, mais il est aussi possible d'afficher les logs et les traces.

Les logs sont ici gérés par Grafana `Loki` et les traces par Grafana `Tempo`. Nous allons importez le dashboard suivant pour manipuler les logs et les traces.

???note "Observability Sample.json"
    ``` { .json .copy }
        --8<-- "dashboards/Observability Sample.json"
    ```

// ToDo : Pas fini ?

**🛫 Prochaine étape : Plugin Infinity & API [➡️](../dashboard-plugin/README.md)**