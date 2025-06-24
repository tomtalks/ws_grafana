# On va quand même pas tout faire tout seul ?

## La communauté

Grafana met à disposition des utilisateurs le site [Grafana Dashboards](https://grafana.com/grafana/dashboards/){target="_blank"} qui regroupe des dashboards partagés par la communauté. Il est possible de les importer directement dans Grafana.

![Menu d'import d'un dashboard](image-35.png)

Il est possible de faire l'import soit directement au format JSON, soit en indiquant l'ID du dashboard qui est affiché sur le site de Grafana.

## Les imports JSON

Pour exporter un de vos dashboards, il suffit de cliquer sur le bouton `Export as JSON` dans le menu `Export` du dashboard.
![Dashboard Export](image-36.png)

Le bouton `Export the dashboard to use in another instance` permet de créer une zone input qui, lors de l'import du dashboard, va permettre de choisir les sources de données à utiliser pour le dashboard.

Cela permet de ne pas *hardcoder* les noms des datasources dans le JSON du dashboard mais de tout de même spécifier le type de datasource à utiliser.

![Dashboard Var](image-37.png)

Ici, lors de l'import, un formulaire est présenté pour choisir une datasource de type `Prometheus`.

### Importez les dashboards suivants

On vous a préparé quelques dashboards exemples :

???note "DashBoardMonitoring.json"
    ``` { .json .copy }
        --8<-- "dashboards/DashBoardMonitoring.json"
    ```

???note "Perf DB.json"
    ``` { .json .copy }
        --8<-- "dashboards/Perf DB.json"
    ```

???note "Perf Code.json"
    ``` { .json .copy }
        --8<-- "dashboards/Perf Code.json"
    ```

???note "Perf API.json"
    ``` { .json .copy }
        --8<-- "dashboards/Perf API.json"
    ```

!!!question "Quizz Perf API"
    Sur le Dashboard Perf API :

    Pourquoi la visualization **Number of request** ne donne pas le meme nombre de requetes `Order` que sa voisine ?

    Et pourquoi y a t'il 2 lignes `Order` ?

???tip "Inspecter les données"
    Il est possible d'inspecter les données envoyées par Grafana et reçues par la datasource en cliquant sur le bouton `Inspect` dans le menu du panel. Les exporter en CSV facilite la lecture.
    ![Inspect](image-38.png)

???danger "Spoiler la solution est là"
    Si on regarde les labels retournée on à 2 séries différentes. L'une pour avec le label `http_response_status_code="200"` et l'autre avec `http_response_status_code="418"`. On a donc 2 séries différentes pour la même requête. 

    la visualization **Number of 2xx Requests** filtre pour ne prendre que les requêtes avec le label `http_response_status_code=~"2.*"`.

**🛫 Prochaine étape : Otel (*aka OpenTelemetry*) [➡️](../dashboard-metrics/otel.md)**
