#import "enssat.typ":*
#show: doc => conf(
  titre: [ Devoir maison 1 "Chiffrement RSA" ],
  auteurs: (
    (nom: "Maxime Cordier", email:"mcordier@enssat.fr"),
    (nom: "Malo Louboutin", email:"mloubout@enssat.fr")
  ),
  annee: 2023,
  promotion: "FISA IAI 2",
  module: "Cryptographie",
  doc,
)

= Introduction

L'objectif de ce compte rendus est de présenter les étapes de confection d'un chiffrement RSA.
Le chiffrement RSA (Rivest, Shamir, Adleman) est un algorithme de cryptographie asymétrique. Il est basé sur le fait que la clé de codage ne peut pas permettre de trouver la clé de décodage. On utilise une clé publique pour chiffrer et une clé privée pour déchiffrer.

= Fonctions de chiffrement et de déchiffrement

Deux fonctions ont été implémentées en Python pour chiffrer et déchiffrer un message.

*- chiffrement_RSA(message, cle_publique) : *
Le message M a coder est le premier argument de la fonction. On a ensuite la clé publique qui est un tuple de deux entiers (e, n).
Cette fonction retourne un entier $X$ subissant le traitement suivant : 
$X = M^e [n]$. Afin de réaliser le calcul exponentiel, nous utilisons une fonction nommée exp_rapide prenant en paramètres M et e.

*- dechiffrement_RSA(message, cle_publique, p, q) :*
Le message X à décoder est le premier argument de la fonction. On a ensuite la clé publique qui est toujours le tuple de deux entiers (e, n) et les deux nombres premiers p et q. Les nombres p et q sont nécessaires pour obtenir la clé privée D permettant de déchiffrer le message. 

Le calcul pour déchiffrer X et ré-obtenir M est le suivant : $M = X^D [n]$. Afin de réaliser le calcul exponentiel, nous utilisons une fonction nommée exp_rapide prenant en paramètres X et D.

Pour obtenir la clé privée D, nous suivons 3 étapes :
- Calcul de $phi(n)$ : $ phi(n) = (p-1)(q-1)$
- Calcul des coefficients de Bézout entre $phi(n)$ et e : Les coéfficients de Bézout sont les coefficients u et v tels que $u * phi(n) + v * e = 1$. Pour obtenir ces coefficients nous utilisons une fonction appellée bezout prenant en paramètre $phi(n)$ et e.
- Calcul de D : $D = v [phi(n)]$. D est aussi appelé l'inverse modulaire de e modulo $phi(n)$.

= Fonction exp_rapide

Notre fonction _exp_rapide_ prend en paramètres deux entiers a et b. Cette fonction a pour but de retourner le résulat tel que $a^b$. La première façon de calculer cette puissance est de multiplier n par lui-même p fois. Cependant, la méthode de l'exponentiation rapide est plus simple. Elle permet d'obtenir le résultat $a^b$ via un algorithme récursif. Le voici : 
- Si b = 0, alors on retourne 1.
- Si b est pair, alors on retourne exp_rapide( $a*a$, $b/2$ ).
- Si b est impair, alors on retourne $a * $exp_rapide( $a*a$, $(b-1)/2$ ).

= Fonction bezout

La fonction _bezout_ prend en paramètres deux entiers a et b. Cette fonction a pour but de retourner les coefficients de Bézout u et v tels que $u * a + v * b = 1$ et le d le PGCD de a et b. Pour cela, nous utilisons un algorithme récursif. Le voici :
- Si b = 0, alors on retourne (1, 0, a).
- Sinon, on retourne $(v, u-(a/b)*v, d)$ avec (u, v, d) = bezout(b, $a[b]$).