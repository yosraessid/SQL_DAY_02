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

-- Insérer des données de test
INSERT IGNORE INTO etudiants (nom, prenom, email) VALUES
    ('Dubois', 'Jean', 'jean.dubois@email.com'),
    ('Li', 'Ana', 'ana.li@email.com'),
    ('Martin', 'Sophie', 'sophie.martin@email.com'),
    ('Garcia', 'Lucas', 'lucas.garcia@email.com');

INSERT IGNORE INTO cours (nom_cours) VALUES
    ('Mathématiques'),
    ('SQL'),
    ('Python'),
    ('Art');

-- 1. Afficher les étudiants dont le nom est plus grand que 3 caractères
SELECT 
    nom,
    prenom,
    LENGTH(nom) as longueur_nom
FROM etudiants
WHERE LENGTH(nom) > 3
ORDER BY nom;

-- 2. Afficher les cours qui ne contiennent pas la lettre "e"
SELECT 
    nom_cours,
    LENGTH(nom_cours) as longueur
FROM cours
WHERE nom_cours NOT LIKE '%e%'
ORDER BY nom_cours;
