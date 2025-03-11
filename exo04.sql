-- Sélectionner la base de données
USE EcoleDB;

-- Vérifier que les tables existent
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

-- Insérer quelques données de test si la table est vide
INSERT INTO etudiants (nom, prenom, email) 
SELECT 'Dubois', 'Jean', 'jean.dubois@email.com'
WHERE NOT EXISTS (SELECT 1 FROM etudiants WHERE nom = 'Dubois');

INSERT INTO etudiants (nom, prenom, email) 
SELECT 'Martin', 'Sophie', 'sophie.martin@email.com'
WHERE NOT EXISTS (SELECT 1 FROM etudiants WHERE nom = 'Martin');

INSERT INTO cours (nom_cours)
SELECT 'Mathématiques'
WHERE NOT EXISTS (SELECT 1 FROM cours WHERE nom_cours = 'Mathématiques');

-- 1. Sélectionner tous les étudiants 
SELECT * FROM etudiants;

-- 2. Afficher uniquement le nom et le prénom des étudiants
SELECT nom, prenom FROM etudiants;

-- 3. Sélectionner les cours contenant la lettre "a"
SELECT * FROM cours WHERE nom_cours LIKE '%a%';
