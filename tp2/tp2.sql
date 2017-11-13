-- TP2 : Requete SQL utiles pour le tp

SET AUTOTRACE ON;
SET LINESIZE 200;

SELECT * FROM Film WHERE titre = 'Vertigo';

select * from Film ;

select nom,prenom from film f,artiste a where f.annee=a.annee_naissance and titre='Vertigo';

SELECT * FROM Film WHERE id=21;

SELECT titre, nom, prenom FROM Film f, Artiste a WHERE f.id_realisateur = a.id;

SELECT titre FROM Film f, Role r, Artiste a WHERE a.nom = 'Stewart' AND
a.prenom='James' AND f.id = r.id_film AND r.id_acteur = a.id AND f.annee = 1958 ;

SELECT titre FROM Film f, Role r WHERE f.id = r.id_film AND f.annee = 1958 AND
r.id_acteur IN (SELECT id FROM Artiste WHERE nom='Stewart' AND prenom= 'James') ;

SELECT titre FROM Film WHERE annee = 1958 AND id IN (SELECT id_film FROM Role
WHERE id_acteur IN (SELECT id FROM Artiste WHERE nom='Stewart' AND
prenom= 'James'));
