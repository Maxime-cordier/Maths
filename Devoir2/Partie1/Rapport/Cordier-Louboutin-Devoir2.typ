#import "enssat.typ":*
#show: doc => conf(
  titre: [ Devoir maison 2 "Loi des grands nombres et marche aléatoire" ],
  auteurs: (
    (nom: "Maxime Cordier", email:"mcordier@enssat.fr"),
    (nom: "Malo Louboutin", email:"mloubout@enssat.fr")
  ),
  annee: 2023,
  promotion: "FISA IAI 2",
  module: "Probabilités et statistiques",
  doc,
)

= Loi des grands nombres
== Partie 1

Nous avons choisi de générer des nombres aléatoires pour une loi discrète uniforme et pour une loi continue exponentielle. La figure 1 ci-dessous regroupe des représentations graphiques de généréation de nombre aléatoire pour la loi discrète uniforme. Ces nombres ont été créés à l'aide d'une fonction génératrice congruencielle linéaire.

#figure(
  table(
    columns: 2,
    [#image("../Images/Partie1.1/loi_uniforme_10.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_uniforme_100.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_uniforme_1000.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_uniforme_10000.png",width: 90%)],
  ),
  caption: [Génération de N nombres aléatoires suivant une loi uniforme, pour plusieurs valeurs de N.],
)


Ensuite, la figure 2 ci-dessous regroupe des représentations graphiques de généréation de nombre aléatoire pour la loi continue exponentielle. Ces nombres ont été créés à l'aide d'une fonction génératrice congruencielle linéaire et de la fonction inverse de la fonction de répartition de la loi exponentielle ayant pour paramètre $lambda$.

Cette fonction inverse a pour équation : $F#super[-1] (x)$ = $frac(-ln(1-x),lambda)$

Pour la génération des nombres aléatoires suivant une loi exponentielle, nous avons choisi de prendre $lambda$ = 3.

#figure(
  table(
    columns: 2,
    [#image("../Images/Partie1.1/loi_exponentielle_10.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_exponentielle_100.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_exponentielle_1000.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_exponentielle_10000.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_exponentielle_100000.png",width: 90%)],
    [#image("../Images/Partie1.1/loi_exponentielle_1000000.png",width: 90%)],
  ),
  caption: [Génération de N nombres aléatoires suivant une loi exponentielle, pour plusieurs valeurs de N.],
)

== Partie 2

Rappel : Soit N variables aléatoires $X#sub[i]$ indépendantes de même loi. La moyenne empirique $overline(X#sub[N])$ est définie par :
$overline(X#sub[N])$ = $frac(1,N) sum_(i=1)^N X#sub[i]$

On note l'*espérance* de $overline(X#sub[N])$ : $E(overline(X#sub[N]))$. On a :

$E(overline(X#sub[N]))$ = $E(frac(1,N) sum_(i=1)^N X#sub[i])$ = $frac(1,N) sum_(i=1)^N E(X#sub[i])$ 

Or les $X#sub[i]$ sont indépendantes et suivent la même loi, donc $E(X#sub[i])$ = $E(X#sub[1])$ pour tout i. On a donc :

$frac(1,N) sum_(i=1)^N E(X#sub[i])$ = $frac(1,N) sum_(i=1)^N E(X#sub[1])$ = $frac(1,N) N E(X#sub[1])$ = $E(X#sub[1])$

Ainsi $E(overline(X#sub[N]))$ = $E(X#sub[1])$.

On note l'*écart-type* de $overline(X#sub[N])$ : $sigma(overline(X#sub[N]))$. Par ailleur, nous savons que l'écart-type vaut la racine carré de la variance. Déterminons premièrement la variance de $overline(X#sub[N])$. On note $V(overline(X#sub[N]))$ cette variance. On a :

$V(overline(X#sub[N]))$ = $V(frac(1,N) sum_(i=1)^N X#sub[i])$ = $frac(1,N^2) sum_(i=1)^N V(X#sub[i])$

Or les $X#sub[i]$ sont indépendantes et suivent la même loi, donc $V(X#sub[i])$ = $V(X#sub[1])$ pour tout i. On a donc :

$frac(1,N^2) sum_(i=1)^N V(X#sub[i])$ = $frac(1,N^2) sum_(i=1)^N V(X#sub[1])$ = $frac(1,N^2) N V(X#sub[1])$ = $frac(V(X#sub[1]),N)$

Ainsi $V(overline(X#sub[N]))$ = $frac(V(X#sub[1]),N)$.

Pour conclure, $sigma(overline(X#sub[N]))$ = $sqrt(frac(V(X#sub[1]),N))$.

La figure 3 ci-dessous regroupe des représentations graphiques de la moyenne empirique pour plusieurs nombres de variables aléatoires.

#figure(
  table(
    columns: 3,
    [#image("../Images/Partie1.2/loi_des_grands_nombres_10.png",width: 100%)],
    [#image("../Images/Partie1.2/loi_des_grands_nombres_100.png",width: 100%)],
    [#image("../Images/Partie1.2/loi_des_grands_nombres_1000.png",width: 100%)],
    [#image("../Images/Partie1.2/loi_des_grands_nombres_10000.png",width: 100%)],
    [#image("../Images/Partie1.2/loi_des_grands_nombres_100000.png",width: 100%)],
    [#image("../Images/Partie1.2/loi_des_grands_nombres_1000000.png",width: 100%)],
  ),
  caption: [Moyenne empirique pour N variables aléatoires.],
)
Il semblerai que la limite vers l'infini de la moyenne soit égale à 0.

Pour chaque N, nous avons également calculer l'espérance et l'écart type : 
#figure(
  table(
    columns: 1,
    [#image("../Images/Partie1.2/loi_des_grands_nombres_esp_et_ecart_type_N_grand.png",width: 80%)],
  ),
  caption: [Espérance et écart-type en fonction de N variables aléatoires.],
)

Nous pouvons remarquer que l'écart type tand vers 1. L'espérance tand par contre vers 0 comme la moyenne empirique. On viens de mettre en évidence la loi des grands nombres qui est : plus le nombre d'observations augmente, plus la moyenne empirique se rapproche de l'espérance théorique de la variable aléatoire.

= Marche aléatoire
== Partie 1

== Partie 2
