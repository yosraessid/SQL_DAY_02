-- Création de la base de données
CREATE DATABASE IF NOT EXISTS EcoleDB;

-- Utilisation de la base de données
USE EcoleDB;

-- Création de la table etudiants
CREATE TABLE etudiants (
    id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100)
);
