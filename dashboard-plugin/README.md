# Dashboard "Infinity"

L'écosystème Grafana est riche de plugins, datasources, ... Celui de *Infinity* est l'un des plus complets car offrant de nombreux use cases (HTTP, CSV, ...).

## Installation

Il faut tout d'abord installer le plugin. Pour cela, aller dans `Connections > Add new connection` et rechercher `infinity`

![Infinity](infinity.png){width="300"}

Puis installer le plugin. Une fois installé, vous pouvez ajouter une nouvelle *DataSource*:

![Install](install.png)

Le plugin dispose de nombreuses possibilités de configuration.

## Configuration d'une API

Dans notre cas, on va configurer la connexion à une API HTTP car dans la vraie vie, il est fort possible que l'on ait pas accès directement à la BDD comme nous l'avons fait dans les premières étapes du lab.

On configure donc la connexion à l'API `stock` de notre service `lumbercamp`:

![configuration](config.png)

On valide que tout est ok via le bouton `Save & Test`

!!!success
    ![success](success.png)

Cliquez maintenant sur `Explore view` pour voir les données disponibles via l'API

On observe que l'on a bien les données en temps réel du stock:

![data](data.png)

## Configuration du dashboard

Retournez dans `Dashboard` et ajoutez un nouveau intitulé `API`.

Ajoutez une visualisation utilisant notre nouvelle datasource `api-lumbercamp`:
- type `Pie chart``
- affichant les portions avec leur pourcentage par type de bois

!!!success
    ![stock global](stock.png)

Il serait aussi intéressant d'avoir une visualisation montrant les stocks "à risque" facilement.

En dupliquant le widget précédent, configurez-en un nouveau n'affichant que les stocks en-dessous de 30 pièces disponibles.

!!!success
    ![warning](warning.png)

???danger "Spoiler la solution est là"
    * Widget de type "Bar gauge" en affichage horizontal
    * 2 transformations
        * Filtrer les stocks supérieurs à 30
        * Ordonner les données en mode décroissant
    * Configurer les thresholds
        * `Base` en rouge
        * `30` en orange