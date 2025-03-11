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

-- Insérer des données de test si les tables sont vides
INSERT INTO etudiants (nom, prenom, email) 
SELECT 'Dubois', 'Jean', 'jean.dubois@email.com'
WHERE NOT EXISTS (SELECT 1 FROM etudiants WHERE nom = 'Dubois' AND prenom = 'Jean');

INSERT INTO cours (nom_cours)
SELECT 'Mathématiques'
WHERE NOT EXISTS (SELECT 1 FROM cours WHERE nom_cours = 'Mathématiques');

-- Afficher les données avant la mise à jour
SELECT * FROM etudiants;
SELECT * FROM cours;

-- 1. Mettre à jour l'email d'un étudiant (Jean Dubois)
UPDATE etudiants 
SET email = 'jean.dubois.new@email.com'
WHERE nom = 'Dubois' AND prenom = 'Jean';

-- 2. Changer le nom d'un cours (Mathématiques -> Mathématiques Avancées)
UPDATE cours
SET nom_cours = 'Mathématiques Avancées'
WHERE nom_cours = 'Mathématiques';

-- Afficher les données après la mise à jour pour vérifier les changements
SELECT * FROM etudiants;
SELECT * FROM cours;
