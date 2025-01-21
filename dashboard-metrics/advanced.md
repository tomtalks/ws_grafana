# Un dashboard un peu plus générique

## Configuration du dashboard

On aimera voir si il y a un correlation entre la consomation CPU et la mémoire. Pour le moment lors du survol d'un point du graph des CPU on voit seulement les valeurs du TOP et pas de la mémoire.
![Single Tooltip](image-11.png)

Allez faire un tour dans le pemier onglet **General** des **Dashboard Settings** pour voir si il y a quelque chose d'intéressant.
![Dashboard Settings](image-8.png)

L'idée est de pouvoir facilement faire des corélations entre les widgets.
![Shared Tooltip](image-10.png)

Ici par example on remarque que lorsque la mémoire baisse le CPU augmente (avec un leger temps de retard du à notre **rate** glissant). C'est l'effet du Garbage collector Java qui viens nétoyer la *Heap* à interval régulier.

On à maintenant un Dashboard qui nous permet d'afficher les informations CPU et mémoire pour l'une de nos applications.

!!! tip "Parametres généraux du dashboard"

    On peux ici paramétres des informations sur le dashboard (Lecture seule, tags , description ...)

    On peux aussi changer les frequences de rafraichissement du dashboard, voir masquer la possibilité de changer la plage de temps consultée.

### Annotations

Ici on peux configurer des alertes qui seront matérialisées directement sur les graphs.

### Variables

Patience on vas y revenir.

### Versions

Grafana stock les différentes version des dashboards en base de donnée. Il est possible de restaurer les versions précédentes et pour auditer les modifications.

### Permissions

Rien de bien fou mais à noter que l'on peux gérer les permissions assez finement sur chaque dashboard en plus de celles au niveau de l'organisation.

### JSON Modele

Les Dashboards sont décrit en JSON et il est possible de réaliser les exports import. Il existe d'ailleur un [marketplace](https://grafana.com/grafana/dashboards/) de dashboard pour grafana.

On fait les autres ?

## Les row

Pour le moment un seul service est affiché. Ce n'est pas très générique.

Revenez sur le dashboard. On vas rajouter un élement de présentation sur notre dashboard. Les *row*.

Cet élément de présentation permet de ranger les différentes visualization. Pour ajouter une visualisation dans une ligne il faut au préalable déplier la ligne pour les affecter à cette ligne.

Chaque ligne à un titre. Il y aussi une option qui pourrait nous interesser ici : *Repeat for*.

Pour ça il est nécessaire de définir des *variables*

## Les variables

![Variables](image-12.png)

L'idée ici est de [variabiliser](https://grafana.com/docs/grafana/latest/dashboards/variables/) le **service_name**.

Pour ça on peux, comme pour les query des visualisations, selectionner une datasource. La requete doit être adaptée au type de *datasource*.

Avec Prometheus on peux aussi bien utilisé les valeurs de chaque metrics mais on peux aussi utiliser les *labels*.

Il faut créer une variable qui s'appele *service_name* et dont les valeurs sont celles du label *service_name*

Ensuite sur la dashboard on va activer les répétitions sur les row pour iterer sur les valeurs de notre nouvelle variables.

!!! tip "Les variables utilisation avancée"

    Il est possible d'utiliser les variables comme label. Plus de détail [ici](https://grafana.com/docs/grafana/latest/dashboards/variables/variable-syntax/#variable-syntax) 

Il ne nous reste plus qu'a changer nos query pour intégrer cette variable au lieux de la valeur den du *Lumbercamp* et nous voici avec un Dashboard paramétrable, qui affichera tout les applications à l'instant T. Si de nouvelles application apparaissent comme la query associée à notre variable se base sur la meme plage de temps que notre dashboard on vas pouvoir les afficher.

!!! tip "Edition et repetition"

    Attention si vous souhaitez modifier une visualisation sur laquelle est active une répétition, il faut faire la modification sur la  premiére instance. Le menu d'edition n'est pas disponible sur les 1+ instances.

![alt text](image-13.png)

**🛫 Prochaine étape : Dashboard Business [➡️](../dashboard-business/README.md)**