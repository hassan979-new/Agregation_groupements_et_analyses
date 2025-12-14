# Agrégation, groupements et analyses
## Découverte des fonctions d’agrégation
### Compter le nombre total d’abonnés 
- <img width="480" height="115" alt="image" src="https://github.com/user-attachments/assets/eb305fdf-3082-4272-9c99-131a2617e990" />
### Calculer la moyenne de prêts par abonné 
- <img width="480" height="178" alt="image" src="https://github.com/user-attachments/assets/6ac80396-0873-4aa8-9475-38c17f8225b8" />
### Déterminer le prix moyen des ouvrages (si la colonne prix existe)
- <img width="480" height="65" alt="image" src="https://github.com/user-attachments/assets/70317480-4d7e-4f82-a099-0499c3319b0b" />
## Utilisation de GROUP BY
### Lister pour chaque abonné le nombre d’emprunts
- <img width="480" height="146" alt="image" src="https://github.com/user-attachments/assets/15510210-0a44-4808-9dad-1eff25dd7735" />
### Afficher pour chaque auteur le nombre d’ouvrages écrits
- <img width="480" height="169" alt="image" src="https://github.com/user-attachments/assets/585f5130-393c-4bf0-801a-10d80d02f86b" />
## Filtrer les groupes avec HAVING
### Ne conserver que les abonnés ayant effectué au moins 3 emprunts
- <img width="480" height="85" alt="image" src="https://github.com/user-attachments/assets/86f40774-405b-4875-b8dd-5d6e5f23a6bf" />
### Afficher les auteurs avec plus de 5 ouvrages
- <img width="480" height="90" alt="image" src="https://github.com/user-attachments/assets/53af9e7d-f5c4-45ff-a348-e76f61f2b7c5" />
## Jointures et agrégats combinés
### Pour chaque abonné, afficher son nom et son nombre d’emprunts
- <img width="480" height="269" alt="image" src="https://github.com/user-attachments/assets/19498025-fb8c-45ca-85be-a390f5033ead" />
### Pour chaque auteur, afficher son nom et le nombre total d’emprunts de ses ouvrages
- <img width="480" height="202" alt="image" src="https://github.com/user-attachments/assets/0be785dc-ba1a-4535-856d-920e9332984f" />
## Analyses plus complexes (ratio, pourcentage)
### Calculer le pourcentage d’ouvrages empruntés parmi tous les ouvrages
- <img width="480" height="198" alt="image" src="https://github.com/user-attachments/assets/74d5f5a0-a097-4d60-8c56-e8bb049e53af" />
### Identifier les 3 abonnés les plus actifs
- <img width="480" height="198" alt="image" src="https://github.com/user-attachments/assets/f9ca4999-a676-4d84-884f-31227c44e71f" />
## Sous-requêtes et CTE pour l’agrégation
### Avec une CTE, lister les auteurs dont la moyenne d’emprunts par ouvrage dépasse 2
- <img width="480" height="464" alt="image" src="https://github.com/user-attachments/assets/fc3e5816-9ebb-4eaf-8e81-ac33c288e069" />
## Exercices pratiques
### Trouver le nombre moyen d’emprunts par jour de la semaine (utiliser DAYOFWEEK(date_debut))
- <img width="480" height="164" alt="image" src="https://github.com/user-attachments/assets/b8a25d87-fb87-4bfe-941e-9f3d487b5820" />
### Afficher, pour chaque mois de l’année 2025, le total d’emprunts effectués
- <img width="480" height="210" alt="image" src="https://github.com/user-attachments/assets/6a433495-1fbb-4e98-b4d4-9b0533d7a8ec" />
### Repérer les ouvrages jamais empruntés et compter leur nombre
- <img width="480" height="154" alt="image" src="https://github.com/user-attachments/assets/29b0d38c-a551-4f39-a5f7-d75e14cab8bf" />
#  l’intérêt d’agrégation :
Les fonctions d’agrégation servent à résumer les données et à mieux comprendre l’activité du système.
COUNT permet de compter des éléments (emprunts, abonnés, ouvrages).
AVG sert à calculer des moyennes pour analyser les tendances.
Avec GROUP BY et HAVING, on peut comparer des groupes et repérer les cas importants.
