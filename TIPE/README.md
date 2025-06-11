# Notes principales

La plupart des notes du projet de TIPE sont disponibles dans le dossier notes, avec plus tard un compte rendu LaTeX.


# Composition du programme

## Résumé 

Ce programme permet de lire un système d'équations dans un fichier, écrit en notation préfixe (cf exemple ci-dessous), et de modéliser le problème de Cauchy avec les conditions initiales données.

Il est formé d'une librairie, auquel les tests et le fichier main peuvent faire appel. Cette librairie est constitué de :
    - lib_type : formalisme des types utilisés (vecteurs, opérateurs, etc...)
    - lib_calcul : fonctions pour effectuer des opérations sur 2 vecteurs
    - lib_expression : ensemble de fonction pour parser et évaluer une expression
    - ...

## Compilation

le fichier `build.sh` contient un ensemble de commandes pour compiler d'abord la librairie seule, puis les tests avec la librairie, puis plus tard le fichier main. Un makefile aurait été plus pratique, mais après avoir passé un moment à tenter de le créer, j'ai préféré utiliser du bash, plus flexible.

### Commande :

```sh
./build.sh
```

```sh
# Si la commande précédante ne marche pas
chmod +x build.sh
```


# Problèmes rencontrés

- **Dans le fichier lib_type.h, 2 types ont besoin l'un de l'autre :**

![alt text](README_ctx/image.png)


- **Erreur non comprise du compilateur :**

![alt text](README_ctx/image2.png)