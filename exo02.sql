-- Utilisation de la base de données
USE EcoleDB;

-- Vérifier si la table etudiants existe
CREATE TABLE IF NOT EXISTS etudiants (
    id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100)
);

-- Suppression des anciennes tables
DROP TABLE IF EXISTS inscriptions;
DROP TABLE IF EXISTS cours;

-- 1. Création de la table cours
CREATE TABLE cours (
    id_cours INT AUTO_INCREMENT PRIMARY KEY,
    nom_cours VARCHAR(100)
);

-- Insérer quelques cours pour tester
INSERT INTO cours (nom_cours) VALUES 
    ('Mathématiques'),
    ('Français');

-- 2. Création de la table de liaison inscriptions
CREATE TABLE inscriptions (
    id_etudiant INT,
    id_cours INT,
    PRIMARY KEY (id_etudiant, id_cours),
    FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant) ON DELETE CASCADE,
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours) ON DELETE CASCADE
);

-- Vérifier les tables créées
SHOW TABLES;

-- Vérifier le contenu
SELECT * FROM cours;
SELECT * FROM etudiants;
SELECT * FROM inscriptions;
