# Un dashboard un peu plus générique

## Configuration du dashboard

On aimera voir si il y a un correlation entre la consomation CPU et la mémoire. Pour le moment lors du survol d'un point du graph des CPU on voit seulement les valeurs du TOP et pas de la mémoire.
![Single Tooltip](image-9.png)

Allez faire un tour dans le pemier onglet **General** des **Dashboard Settings** pour voir si il y a quelque chose d'intéressant.
![alt text](image-8.png)

L'idée est de pouvoir facilement faire des corélations entre les widgets.
![alt text](image-10.png)

Ici par example on remarque que lorsque la mémoire baisse le CPU augmente (avec un leger temps de retard du à notre **rate** glissant). C'est l'effet du Garbage collector Java qui viens nétoyer la *Heap* à interval régulier.

On à maintenant un Dashboard qui nous permet d'afficher les informations CPU et mémoire pour l'une de nos applications.

On fait les autres ?




**🛫 Prochaine étape : Dashboard Business [➡️](../dashboard-business/README.md)**