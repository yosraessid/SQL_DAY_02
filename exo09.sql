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

-- Insérer quelques données de test
INSERT IGNORE INTO etudiants (nom, prenom, email) VALUES
    ('Dubois', 'Jean', 'jean.dubois@email.com'),
    ('Martin', 'Sophie', 'sophie.martin@email.com');

INSERT IGNORE INTO cours (nom_cours) VALUES
    ('Mathématiques'),
    ('Informatique');

-- 1. Ajouter une contrainte d'unicité sur l'email
ALTER TABLE etudiants
ADD CONSTRAINT email_unique UNIQUE (email);

-- 2. Modifier les clés étrangères pour ajouter ON DELETE CASCADE
-- D'abord, supprimer les anciennes contraintes
ALTER TABLE inscriptions
DROP FOREIGN KEY inscriptions_ibfk_1,
DROP FOREIGN KEY inscriptions_ibfk_2;

-- Puis ajouter les nouvelles contraintes avec CASCADE
ALTER TABLE inscriptions
ADD CONSTRAINT fk_etudiant
    FOREIGN KEY (id_etudiant) 
    REFERENCES etudiants(id_etudiant) 
    ON DELETE CASCADE,
ADD CONSTRAINT fk_cours
    FOREIGN KEY (id_cours) 
    REFERENCES cours(id_cours) 
    ON DELETE CASCADE;

-- Vérifier que les contraintes ont été ajoutées
SHOW CREATE TABLE etudiants;
SHOW CREATE TABLE inscriptions;
