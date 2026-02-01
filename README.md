# MiniAuthApp - Application Web Java EE : Gestion d'accès utilisateur

## 📋 Description

Application web de gestion d'authentification utilisateur développée en Java EE avec l'architecture MVC.

## 🎯 Objectifs pédagogiques

- ✅ Utiliser Git et GitHub pour le travail collaboratif
- ✅ Créer et configurer des Servlets
- ✅ Utiliser des JSP avec séparation des rôles
- ✅ Implémenter le modèle MVC
- ✅ Accéder à une base de données avec JDBC
- ✅ Mettre en place une authentification utilisateur
- ✅ Créer et utiliser une librairie de tags JSP (Custom Tags)

## 🛠️ Technologies utilisées

- **Java EE** (Servlets, JSP)
- **Apache Tomcat** 9.x ou 10.x
- **JDBC** (MySQL Connector)
- **MySQL / MariaDB**
- **Maven** (Gestion des dépendances)
- **Git & GitHub**

## 📁 Structure du projet (MVC)

```
MiniAuthApp/
├── src/
│   ├── controller/
│   │   └── LoginServlet.java          # Contrôleur de connexion
│   ├── model/
│   │   ├── User.java                  # Modèle utilisateur
│   │   ├── UserDAO.java               # Accès aux données
│   │   └── DBConnection.java          # Connexion JDBC
│   └── tags/
│       └── MessageTag.java            # Tag personnalisé
├── webapp/
│   ├── WEB-INF/
│   │   ├── web.xml                    # Configuration web
│   │   └── tlds/
│   │       └── messagetags.tld        # Descripteur de tag
│   ├── login.jsp                      # Page de connexion
│   ├── dashboard.jsp                  # Tableau de bord
│   └── logout.jsp                     # Déconnexion
├── database/
│   └── setup.sql                      # Script de création BDD
├── pom.xml                            # Configuration Maven
└── README.md
```

## 🚀 Installation et Configuration

### 1. Prérequis

- Java JDK 8 ou supérieur
- Apache Tomcat 9.x ou 10.x
- MySQL ou MariaDB
- Maven
- IDE (NetBeans, IntelliJ IDEA, ou Eclipse)

### 2. Configuration de la base de données

```bash
# Se connecter à MySQL
mysql -u root -p

# Exécuter le script SQL
source database/setup.sql
```

Ou importez directement le fichier `database/setup.sql` dans votre SGBD.

**Comptes de test disponibles :**
- Username: `admin` / Password: `1234`
- Username: `user` / Password: `pass`
- Username: `test` / Password: `test123`

### 3. Configuration de la connexion JDBC

Modifiez `src/model/DBConnection.java` si nécessaire :

```java
return DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/users_db",
    "root",      // Votre nom d'utilisateur MySQL
    ""           // Votre mot de passe MySQL
);
```

### 4. Compilation et déploiement

#### Avec Maven :

```bash
# Compiler le projet
mvn clean compile

# Créer le fichier WAR
mvn clean package

# Le fichier WAR sera dans target/MiniAuthApp.war
```

#### Déploiement sur Tomcat :

1. Copiez `target/MiniAuthApp.war` dans le dossier `webapps/` de Tomcat
2. Démarrez Tomcat
3. Accédez à : `http://localhost:8080/MiniAuthApp/`

#### Avec un IDE :

1. Importez le projet comme projet Maven
2. Configurez Tomcat dans votre IDE
3. Déployez et exécutez l'application

## 📱 Utilisation

1. **Page de connexion** : Accédez à `http://localhost:8080/MiniAuthApp/`
2. Entrez un nom d'utilisateur et un mot de passe
3. Cliquez sur "Connexion"
4. Si les informations sont correctes, vous serez redirigé vers le dashboard
5. Sinon, un message d'erreur s'affichera

## 🔐 Fonctionnalités

- ✅ Authentification utilisateur avec base de données
- ✅ Gestion des sessions HTTP
- ✅ Protection des pages (accès sécurisé au dashboard)
- ✅ Messages d'erreur avec tags personnalisés
- ✅ Interface moderne et responsive
- ✅ Déconnexion sécurisée

## 🏗️ Architecture MVC

### Modèle (Model)
- `User.java` : Représentation de l'utilisateur
- `UserDAO.java` : Logique d'accès aux données
- `DBConnection.java` : Gestion de la connexion JDBC

### Vue (View)
- `login.jsp` : Interface de connexion
- `dashboard.jsp` : Tableau de bord utilisateur
- `logout.jsp` : Déconnexion

### Contrôleur (Controller)
- `LoginServlet.java` : Gestion de l'authentification

### Tag personnalisé
- `MessageTag.java` : Affichage des messages d'erreur
- `messagetags.tld` : Descripteur de la bibliothèque de tags

## 📊 Base de données

### Table `users`

| Colonne   | Type         | Description                |
|-----------|--------------|----------------------------|
| id        | INT          | Clé primaire (auto-incrémentée) |
| username  | VARCHAR(50)  | Nom d'utilisateur (unique) |
| password  | VARCHAR(50)  | Mot de passe               |

**Note de sécurité** : Dans un environnement de production, les mots de passe doivent être hashés (BCrypt, SHA-256, etc.).

## 🔧 Personnalisation

### Modifier le timeout de session

Dans `webapp/WEB-INF/web.xml` :

```xml
<session-config>
    <session-timeout>30</session-timeout> <!-- En minutes -->
</session-config>
```

### Ajouter des utilisateurs

```sql
INSERT INTO users(username, password) VALUES ('nouveau_user', 'mot_de_passe');
```

## 📝 Git et GitHub

### Commandes Git de base

```bash
# Initialiser le dépôt
git init

# Ajouter tous les fichiers
git add .

# Commit initial
git commit -m "Initial commit"

# Lier au dépôt distant
git remote add origin https://github.com/votre-username/MiniAuthApp.git

# Pousser sur GitHub
git push -u origin main
```

## 📖 Critères d'évaluation

| Critère                        | Points |
|-------------------------------|--------|
| Git & GitHub                  | 2      |
| JDBC & DAO                    | 3      |
| MVC respecté                  | 3      |
| Servlets                      | 3      |
| JSP & EL                      | 3      |
| Tags personnalisés            | 3      |
| Authentication & session      | 3      |
| **Total**                     | **20** |

## 🐛 Dépannage

### Erreur de connexion à la base de données
- Vérifiez que MySQL est en cours d'exécution
- Vérifiez les identifiants dans `DBConnection.java`
- Assurez-vous que la base de données `users_db` existe

### Erreur 404
- Vérifiez que Tomcat est démarré
- Vérifiez l'URL : `http://localhost:8080/MiniAuthApp/`
- Vérifiez que le WAR est déployé dans `webapps/`

### Erreur de compilation
- Vérifiez que toutes les dépendances Maven sont téléchargées
- Exécutez `mvn clean install`

## 👨‍💻 Auteur

Projet réalisé dans le cadre du cours de Programmation Web côté Serveur (Java EE)

## 📄 Licence

Ce projet est à usage éducatif.
