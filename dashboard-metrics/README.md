# Metrics Dashboard

## Configuration

#### Prometheus

Nous allons ajouter une *DS* Prometheus pour afficher les métriques de nos applications Java.

L'URL est `http://prometheus:9090`. Vous pouvez d'ailleurs vous connecter à cette instance qui tourne en local [ici](http://localhost:9090).

Comme tout est en local, nous n'avons pas d'authentification à ajouter. Ni de gestion des TLS.

Nommez votre *DS* `prometheus` et cliquez sur *Save & Test*.

### La fonction explore

La fonction *Explore* permet de tester les requêtes directement sans passer par un dashboard.

On retrouve le même type de formulaire que pour les requêtes d'un widget.

![Query param](image-5.png)

Une visualisation par défaut est proposée pour afficher les données.

![alt text](image-6.png)

Et les données brutes.
![alt text](image-7.png)

Cet affichage est aussi accessible sur un widget dans l'écran de configuration des requêtes.

!!! info "Formulaire query"

    Dans les versions récentes de Grafana, on retrouve un mode *Builder* qui permet de construire la requête à l'aide d'un formulaire.
    
    On est guidé dans la construction de la requête. Le formulaire s'adapte à chaque type de requête (PromQL, SQL ...).
    C'est souvent pratique pour débuter et pour déboguer une requête.

    Le mode Code permet de voir la requête. C'est souvent plus rapide pour modifier une requête.

### Quelques mots sur PromQL

Prometheus utilise le langage [PromQL](https://prometheus.io/docs/prometheus/latest/querying/basics/) pour Prometheus Query Language ...

Une requête *PromQL* retourne une liste d'enregistrements, ils sont composés des éléments suivants :

* le nom de la métrique
* les labels associés à la métrique
* la valeur de la métrique
* le timestamp

La clé primaire d'un enregistrement est la combinaison du nom de la métrique et des labels associés.

Les labels et le nom de la métrique sont en partie définis par la source de données. Il est aussi possible d'ajouter des règles dans Prometheus pour ajouter / modifier / supprimer des labels.

Par défaut, Prometheus va ajouter des labels pour donner des informations sur la source des données (le label **job** par exemple).

C'est très utile pour séparer les données de plusieurs sources (ex environnement de production / préprod).

## Le dashboard

Maintenant, nous allons créer un nouveau Dashboard nommé *Dashboard de monitoring*.

On ajoute une *Visualization* et on sélectionne la *DS* précédemment créée.

### Mémoire

On souhaite afficher un graphe des métriques de mémoire de notre application Java.

Pour cela, on va utiliser la métrique suivante : *jvm_memory_used_bytes*

En spécifiant uniquement le nom de la métrique, on remonte l'ensemble des valeurs associées à cette métrique.

Prometheus utilise des *Labels* pour donner plus d'informations sur une métrique.

#### Configuration du widget

![données brutes](image.png)

Pour le moment, notre widget n'est pas particulièrement lisible. On va ajouter des informations pour le rendre plus lisible.

Toutes les informations mémoire de nos JVM sont retournées sur le même graphe.

On va sélectionner uniquement celles du service *lumbercamp*. Observer les labels pour identifier ceux qui sont les plus intéressants et modifier la requête en conséquence.

Soit à l'aide du builder de requête, soit en modifiant directement la requête avec l'onglet code :
![Builder/Code](image-1.png)

Changez les unités du graphe pour afficher les valeurs en MB.

On souhaite afficher les mémoires [Heap / Non Heap](https://medium.com/@kiarash.shamaii/understanding-javas-memory-model-and-the-inner-workings-of-garbage-collection-f73e2b399605) pour le service *lumbercamp* pour suivre l'évolution de la mémoire.

!!! tip "Changez la query pour avoir le paramétrage suivant"

    Le label `jvm_memory_type` permet de faire la différence entre la Heap et la non Heap.

    Attention `jvm_memory_pool_name="Metaspace"` est déjà la somme des pools : "CodeHeap 'non-nmethods'" "CodeHeap 'non-profiled nmethods'" "CodeHeap 'profiled nmethods'" "Compressed Class Space"

#### PromQL Sum

Le langage de requêtage *PromQL* permet de faire des opérations sur les données. On utilisera ici l'opérateur d'agrégation [sum](https://prometheus.io/docs/prometheus/latest/querying/operators/#aggregation-operators)

L'objectif est d'avoir le dashboard suivant : 

![Lumbercamp memory](image-2.png)

On affichera la mémoire Heap avec une query et la non Heap avec une autre sur le même graphe.

Le fait de pouvoir ajouter de multiples queries sur un même graphe permet d'afficher des données avec des modes de calcul différents.

On peut facilement dupliquer une query pour la modifier et l'adapter à nos besoins.

### CPU

On va aussi afficher la consommation CPU de nos applications.

Pour cela, on va utiliser la métrique `jvm_cpu_time_seconds_total`.

![CPU / Mem](image-3.png)

#### Les métriques total

Petit problème ici, la valeur correspond à la somme des temps CPU utilisés par l'ensemble des threads de notre application depuis le démarrage.

#### PromQL Rate

On aimerait avoir la consommation par minute. Pour cela, il existe des [fonctions](https://prometheus.io/docs/prometheus/latest/querying/functions/) avec **PromQL** notamment [rate](https://prometheus.io/docs/prometheus/latest/querying/functions/#rate) qui permet de calculer la dérivée d'une série temporelle.

Cette fonction travaille avec un **range-vector**. Le range-vector est un vecteur de valeurs sur une période donnée. Ainsi, pour calculer la dérivée d'une série temporelle, il faut spécifier une période.

On utilisera les ranges **[1m]** **[5m]** **[15m]** qui vont calculer un rate par seconde en se basant sur l'ensemble des données des *X* dernières minutes pour chaque point de données. On reproduit ainsi l'affichage du `top` unix.

L'objectif est d'obtenir le graphe suivant :

![Top / Mem](image-4.png)

Ok c'est pas mal mais allons plus loin :

**🛫 Prochaine étape : Dashboard Metrics Step2 [➡️](../dashboard-metrics/advanced.md)**
