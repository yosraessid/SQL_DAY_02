-- Sélectionner la base de données
USE EcoleDB;

-- 0. Créer les tables si elles n'existent pas
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

-- 1. Ajouter les nouveaux étudiants
INSERT INTO etudiants (nom, prenom, email) VALUES
('Dubois', 'Jean', 'jean.dubois@email.com');

INSERT INTO etudiants (nom, prenom, email) VALUES
('Martin', 'Sophie', 'sophie.martin@email.com');

INSERT INTO etudiants (nom, prenom, email) VALUES
('Garcia', 'Lucas', 'lucas.garcia@email.com');

-- 2. Ajouter les nouveaux cours
INSERT INTO cours (nom_cours) VALUES ('Mathématiques');
INSERT INTO cours (nom_cours) VALUES ('Informatique');

-- 3. Créer les inscriptions aux cours
INSERT INTO inscriptions (id_etudiant, id_cours) VALUES (1, 1); -- Jean en Mathématiques
INSERT INTO inscriptions (id_etudiant, id_cours) VALUES (1, 2); -- Jean en Informatique
INSERT INTO inscriptions (id_etudiant, id_cours) VALUES (2, 1); -- Sophie en Mathématiques
INSERT INTO inscriptions (id_etudiant, id_cours) VALUES (3, 2); -- Lucas en Informatique

-- Afficher les résultats
SELECT * FROM etudiants;
SELECT * FROM cours;
SELECT * FROM inscriptions;
