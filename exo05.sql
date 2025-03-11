-- Sélectionner la base de données
USE EcoleDB;

-- Créer les tables si elles n'existent pas
CREATE TABLE IF NOT EXISTS etudiants (
    id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS cours (
    id_cours INT AUTO_INCREMENT PRIMARY KEY,
    nom_cours VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS inscriptions (
    id_etudiant INT,
    id_cours INT,
    PRIMARY KEY (id_etudiant, id_cours),
    FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours)
);

-- Insérer des données de test si les tables sont vides
INSERT INTO etudiants (nom, prenom, email) 
SELECT * FROM (
    SELECT 'Dubois', 'Jean', 'jean.dubois@email.com'
) AS tmp 
WHERE NOT EXISTS (
    SELECT 1 FROM etudiants WHERE nom = 'Dubois'
);

INSERT INTO etudiants (nom, prenom, email)
SELECT * FROM (
    SELECT 'Martin', 'Sophie', 'sophie.martin@email.com'
) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM etudiants WHERE nom = 'Martin'
);

INSERT INTO cours (nom_cours)
SELECT * FROM (
    SELECT 'Mathématiques'
) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM cours WHERE nom_cours = 'Mathématiques'
);

INSERT INTO cours (nom_cours)
SELECT * FROM (
    SELECT 'Informatique'
) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM cours WHERE nom_cours = 'Informatique'
);

-- Insérer des inscriptions de test
INSERT IGNORE INTO inscriptions (id_etudiant, id_cours)
SELECT e.id_etudiant, c.id_cours
FROM etudiants e, cours c
WHERE e.nom = 'Dubois' AND c.nom_cours = 'Mathématiques';

-- 1. INNER JOIN : Affiche uniquement les étudiants qui sont inscrits à des cours
SELECT 
    e.nom,
    e.prenom,
    c.nom_cours
FROM etudiants e
INNER JOIN inscriptions i ON e.id_etudiant = i.id_etudiant
INNER JOIN cours c ON i.id_cours = c.id_cours
ORDER BY e.nom, e.prenom, c.nom_cours;

-- 2. LEFT JOIN : Affiche tous les étudiants, même ceux qui ne sont pas inscrits à des cours
SELECT 
    e.nom,
    e.prenom,
    c.nom_cours
FROM etudiants e
LEFT JOIN inscriptions i ON e.id_etudiant = i.id_etudiant
LEFT JOIN cours c ON i.id_cours = c.id_cours
ORDER BY e.nom, e.prenom, c.nom_cours;

