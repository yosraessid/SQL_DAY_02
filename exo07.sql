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
    SELECT 'Dubois', 'Jean', 'jean.dubois@email.com' UNION
    SELECT 'Martin', 'Sophie', 'sophie.martin@email.com' UNION
    SELECT 'Garcia', 'Lucas', 'lucas.garcia@email.com'
) AS tmp 
WHERE NOT EXISTS (SELECT 1 FROM etudiants);

INSERT INTO cours (nom_cours)
SELECT * FROM (
    SELECT 'Mathématiques' UNION
    SELECT 'Informatique'
) AS tmp
WHERE NOT EXISTS (SELECT 1 FROM cours);

-- Ajouter quelques inscriptions de test
INSERT IGNORE INTO inscriptions (id_etudiant, id_cours)
SELECT e.id_etudiant, c.id_cours FROM etudiants e, cours c;

-- 1. Compter le nombre d'étudiants et de cours
SELECT 'Nombre total d étudiants' as Description, COUNT(*) as Nombre 
FROM etudiants;

SELECT 'Nombre total de cours' as Description, COUNT(*) as Nombre 
FROM cours;

-- 2. Grouper les inscriptions par cours
SELECT 
    c.nom_cours,
    COUNT(i.id_etudiant) as nombre_etudiants
FROM cours c
LEFT JOIN inscriptions i ON c.id_cours = i.id_cours
GROUP BY c.nom_cours
ORDER BY nombre_etudiants DESC;
