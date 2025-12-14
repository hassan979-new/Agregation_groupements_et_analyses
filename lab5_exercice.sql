&nbsp;WITH time AS (SELECT MONTH(date\_debut) AS mois, YEAR(date\_debut) AS annee, abonne\_id FROM emprunt WHERE YEAR(date\_debut) = 2025)

SELECT mois, annee, COUNT(\*) AS total\_emprunts, COUNT(DISTINCT abonne\_id) AS abonnes\_actifs, ROUND(**COUNT(\*)/**COUNT(DISTINCT abonne\_id) **,2) AS moyenne\_par\_abonne FROM time GROUP BY annee, mois;**



**WITH count AS ( SELECT** MONTH(date\_debut) AS mois, YEAR(date\_debut) AS annee, ouvrage\_id, COUNT(\*) AS nb\_emprunts FROM emprunt GROUP BY MONTH(date\_debut), YEAR(date\_debut), ouvrage\_id), ranked AS ( SELECT \* , ROW\_NUMBER() OVER (PARTITION BY annee, mois ORDER BY nb\_emprunts DESC) AS rang FROM count) SELECT r.annee , r.mois, o.titre, r.nb\_emprunts FROM ranked r JOIN ouvrage o ON o.id = r.ouvrage\_id WHERE r.rang <= 3 ORDER BY r.annee, r.mois, r.rang;



WITH nombre AS ( SELECT MONTH(date\_debut) AS mois, YEAR(date\_debut) AS annee, COUNT(DISTINCT ouvrage\_id) AS ouvrages\_empruntes FROM emprunt GROUP BY MONTH(date\_debut), YEAR(date\_debut) ) SELECT n.annee, n.mois, n.ouvrages\_empruntes, o.total\_ouvrages, ROUND(n.ouvrages\_empruntes \* 100 / o.total\_ouvrages, 2) AS pct\_empruntes FROM nombre n CROSS JOIN ( SELECT COUNT(\*) AS total\_ouvrages FROM ouvrage ) o ORDER BY n.annee, n.mois;



WITH


time AS (

&nbsp;   SELECT 

&nbsp;       YEAR(date\_debut) AS annee,

&nbsp;       MONTH(date\_debut) AS mois,

&nbsp;       COUNT(\*) AS total\_emprunts,

&nbsp;       COUNT(DISTINCT abonne\_id) AS abonnes\_actifs,

&nbsp;       ROUND(COUNT(\*) / COUNT(DISTINCT abonne\_id), 2) AS moyenne\_par\_abonne,

&nbsp;       COUNT(DISTINCT ouvrage\_id) AS ouvrages\_empruntes

&nbsp;   FROM emprunt

&nbsp;   WHERE YEAR(date\_debut) = 2025

&nbsp;   GROUP BY YEAR(date\_debut), MONTH(date\_debut)

),

count AS (

&nbsp;   SELECT 

&nbsp;       YEAR(date\_debut) AS annee,

&nbsp;       MONTH(date\_debut) AS mois,

&nbsp;       ouvrage\_id,

&nbsp;       COUNT(\*) AS nb\_emprunts

&nbsp;   FROM emprunt

&nbsp;   GROUP BY YEAR(date\_debut), MONTH(date\_debut), ouvrage\_id

),

ranked AS (

&nbsp;   SELECT \*, ROW\_NUMBER() OVER (PARTITION BY annee, mois ORDER BY nb\_emprunts DESC) AS rang

&nbsp;   FROM count

),

top3\_titres AS (

&nbsp;   SELECT 

&nbsp;       r.annee, r.mois,

&nbsp;       GROUP\_CONCAT(o.titre ORDER BY r.nb\_emprunts DESC SEPARATOR ', ') AS titres\_top3

&nbsp;   FROM ranked r

&nbsp;   JOIN ouvrage o ON o.id = r.ouvrage\_id

&nbsp;   WHERE r.rang <= 3

&nbsp;   GROUP BY r.annee, r.mois

),

total\_ouvrages AS (

&nbsp;   SELECT COUNT(\*) AS total FROM ouvrage

)

SELECT 

&nbsp;   s.annee,

&nbsp;   s.mois,

&nbsp;   s.total\_emprunts,

&nbsp;   s.abonnes\_actifs,

&nbsp;   s.moyenne\_par\_abonne,

&nbsp;   ROUND(s.ouvrages\_empruntes \* 100 / t.total, 2) AS pct\_empruntes,

&nbsp;   COALESCE(top.titres\_top3, '') AS top3\_ouvrages

FROM time s

CROSS JOIN total\_ouvrages t

LEFT JOIN top3\_titres top 

&nbsp;      ON top.annee = s.annee AND top.mois = s.mois

ORDER BY s.annee, s.mois;







