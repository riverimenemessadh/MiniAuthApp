-- Script de création de la base de données pour MiniAuthApp
-- Gestion d'accès utilisateur (Authentification)

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS users_db;
USE users_db;

-- Création de la table users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

-- Insertion de données de test
INSERT INTO users(username, password) VALUES ('admin', '1234');
INSERT INTO users(username, password) VALUES ('user', 'pass');
INSERT INTO users(username, password) VALUES ('test', 'test123');

-- Vérification des données
SELECT * FROM users;
