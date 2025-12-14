
SELECT COUNT(*) AS total_abonnes
FROM abonne;

SELECT AVG(nb) AS moyen_emprunts
FROM (
  SELECT COUNT(*) AS nb
  FROM emprunt
  GROUP BY abonne_id
) AS sous;

SELECT abonne_id, COUNT(*) AS nbre
FROM emprunt
GROUP BY abonne_id;

SELECT auteur_id, COUNT(*) AS total_ouvrages
FROM ouvrage
GROUP BY auteur_id;

SELECT abonne_id, COUNT(*) AS nbre
FROM emprunt
GROUP BY abonne_id
HAVING COUNT(*) >= 3;

SELECT
  ROUND(
    COUNT(CASE WHEN e.ouvrage_id IS NOT NULL THEN 1 END) * 100
    / COUNT(DISTINCT o.id), 2
  ) AS pct_empruntes
FROM ouvrage o
LEFT JOIN emprunt e ON e.ouvrage_id = o.id;

SELECT a.nom, COUNT(*) AS nbre_emprunts
FROM abonne a
JOIN emprunt e ON e.abonne_id = a.id
GROUP BY a.id, a.nom
ORDER BY nbre_emprunts DESC
LIMIT 3;

WITH stats AS (
  SELECT o.auteur_id,
         COUNT(e.ouvrage_id) AS emprunts,
         COUNT(DISTINCT o.id) AS ouvrages
  FROM ouvrage o
  LEFT JOIN emprunt e ON e.ouvrage_id = o.id
  GROUP BY o.auteur_id
)
SELECT auteur_id, emprunts / ouvrages AS moyenne
FROM stats;

SELECT date_debut, COUNT(*) AS emprunts
FROM emprunt
GROUP BY date_debut;

SELECT DAYOFWEEK(date_debut) AS jour,
       AVG(emprunts) AS moyenne_emprunt
FROM (
  SELECT date_debut, COUNT(*) AS emprunts
  FROM emprunt
  GROUP BY date_debut
) AS stats
GROUP BY jour;

SELECT MONTH(date_debut) AS mois,
       COUNT(*) AS total_emprunts
FROM emprunt
WHERE YEAR(date_debut) = 2025
GROUP BY MONTH(date_debut);

SELECT COUNT(*) AS ouvrage_null
FROM ouvrage o
LEFT JOIN emprunt e ON e.ouvrage_id = o.id
WHERE e.ouvrage_id IS NULL;

SELECT o.titre
FROM ouvrage o
LEFT JOIN emprunt e ON e.ouvrage_id = o.id
WHERE e.ouvrage_id IS NULL;
