# 🚀 Guide d'installation détaillé - MiniAuthApp

## Étape 1 : Installation des prérequis

### 1.1 Java JDK
1. Téléchargez Java JDK 8 ou supérieur depuis [Oracle](https://www.oracle.com/java/technologies/downloads/) ou [OpenJDK](https://openjdk.org/)
2. Installez et configurez la variable d'environnement `JAVA_HOME`
3. Vérifiez l'installation :
   ```bash
   java -version
   ```

### 1.2 Apache Tomcat
1. Téléchargez Tomcat 9.x depuis [tomcat.apache.org](https://tomcat.apache.org/)
2. Extrayez l'archive dans un répertoire (ex: `C:\tomcat` ou `/opt/tomcat`)
3. Définissez `CATALINA_HOME` vers le répertoire Tomcat

### 1.3 MySQL / MariaDB
1. Téléchargez et installez [MySQL](https://dev.mysql.com/downloads/) ou [MariaDB](https://mariadb.org/download/)
2. Notez le nom d'utilisateur (généralement `root`) et le mot de passe

### 1.4 Maven
1. Téléchargez Maven depuis [maven.apache.org](https://maven.apache.org/download.cgi)
2. Extrayez et configurez la variable d'environnement `M2_HOME`
3. Ajoutez `%M2_HOME%\bin` au PATH
4. Vérifiez l'installation :
   ```bash
   mvn -version
   ```

## Étape 2 : Configuration de la base de données

### 2.1 Démarrage de MySQL

**Windows :**
```bash
net start MySQL80
```

**Linux/Mac :**
```bash
sudo systemctl start mysql
# ou
sudo service mysql start
```

### 2.2 Création de la base de données

1. Connectez-vous à MySQL :
   ```bash
   mysql -u root -p
   ```

2. Exécutez les commandes SQL :
   ```sql
   CREATE DATABASE users_db;
   USE users_db;
   
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(50) NOT NULL UNIQUE,
       password VARCHAR(50) NOT NULL
   );
   
   INSERT INTO users(username, password) VALUES ('admin', '1234');
   INSERT INTO users(username, password) VALUES ('user', 'pass');
   INSERT INTO users(username, password) VALUES ('test', 'test123');
   
   SELECT * FROM users;
   ```

3. Ou importez directement le fichier SQL :
   ```bash
   mysql -u root -p < database/setup.sql
   ```

### 2.3 Vérification
```sql
USE users_db;
SHOW TABLES;
SELECT * FROM users;
```

## Étape 3 : Configuration du projet

### 3.1 Cloner ou télécharger le projet
```bash
git clone https://github.com/votre-username/MiniAuthApp.git
cd MiniAuthApp
```

### 3.2 Configuration de la connexion JDBC

Ouvrez `src/model/DBConnection.java` et modifiez si nécessaire :

```java
public static Connection getConnection() throws Exception {
    Class.forName("com.mysql.cj.jdbc.Driver");
    return DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/users_db",
        "root",           // ← Votre username MySQL
        "votre_password"  // ← Votre password MySQL
    );
}
```

## Étape 4 : Compilation du projet

### 4.1 Avec Maven (recommandé)

```bash
# Nettoyer et compiler
mvn clean compile

# Créer le fichier WAR
mvn clean package
```

Le fichier `MiniAuthApp.war` sera créé dans le dossier `target/`

### 4.2 Vérification
```bash
ls target/
# Vous devriez voir : MiniAuthApp.war
```

## Étape 5 : Déploiement sur Tomcat

### Méthode 1 : Déploiement manuel

1. Copiez le fichier WAR :
   ```bash
   # Windows
   copy target\MiniAuthApp.war C:\tomcat\webapps\
   
   # Linux/Mac
   cp target/MiniAuthApp.war /opt/tomcat/webapps/
   ```

2. Démarrez Tomcat :
   ```bash
   # Windows
   C:\tomcat\bin\startup.bat
   
   # Linux/Mac
   /opt/tomcat/bin/startup.sh
   ```

3. Attendez quelques secondes (déploiement automatique)

4. Accédez à : `http://localhost:8080/MiniAuthApp/`

### Méthode 2 : Avec un IDE (NetBeans)

1. Ouvrez NetBeans
2. `File` > `Open Project` > Sélectionnez MiniAuthApp
3. Clic droit sur le projet > `Properties`
4. `Run` > Sélectionnez votre serveur Tomcat
5. Clic droit sur le projet > `Run`

### Méthode 3 : Avec un IDE (IntelliJ IDEA)

1. Ouvrez IntelliJ IDEA
2. `File` > `Open` > Sélectionnez le dossier MiniAuthApp
3. `Run` > `Edit Configurations`
4. Cliquez sur `+` > `Tomcat Server` > `Local`
5. Configurez le chemin vers Tomcat
6. Onglet `Deployment` > `+` > `Artifact` > Sélectionnez `MiniAuthApp:war`
7. `Run`

### Méthode 4 : Avec un IDE (Eclipse)

1. Ouvrez Eclipse
2. `File` > `Import` > `Maven` > `Existing Maven Projects`
3. Sélectionnez le dossier MiniAuthApp
4. Clic droit sur le projet > `Run As` > `Run on Server`
5. Sélectionnez Tomcat et cliquez sur `Finish`

## Étape 6 : Test de l'application

### 6.1 Accéder à l'application
Ouvrez votre navigateur et allez à : `http://localhost:8080/MiniAuthApp/`

### 6.2 Tester la connexion

Utilisez l'un des comptes de test :

| Username | Password  |
|----------|-----------|
| admin    | 1234      |
| user     | pass      |
| test     | test123   |

### 6.3 Vérifications

✅ La page de login s'affiche correctement  
✅ Connexion réussie → redirection vers dashboard  
✅ Connexion échouée → message d'erreur en rouge  
✅ Accès direct au dashboard sans login → redirection vers login  
✅ Bouton de déconnexion fonctionne  

## Étape 7 : Vérification des logs

### 7.1 Logs Tomcat

**Windows :**
```
C:\tomcat\logs\catalina.out
```

**Linux/Mac :**
```
/opt/tomcat/logs/catalina.out
```

### 7.2 Commandes utiles

```bash
# Voir les logs en temps réel (Linux/Mac)
tail -f /opt/tomcat/logs/catalina.out

# Arrêter Tomcat
# Windows
C:\tomcat\bin\shutdown.bat

# Linux/Mac
/opt/tomcat/bin/shutdown.sh
```

## Étape 8 : Dépannage

### Problème 1 : Erreur 404

**Cause :** Application non déployée  
**Solution :**
1. Vérifiez que `MiniAuthApp.war` est dans `webapps/`
2. Vérifiez que Tomcat est démarré
3. Attendez quelques secondes pour le déploiement automatique
4. Vérifiez l'URL : `http://localhost:8080/MiniAuthApp/`

### Problème 2 : Erreur de connexion JDBC

**Cause :** MySQL non démarré ou mauvaise configuration  
**Solution :**
1. Démarrez MySQL : `net start MySQL80`
2. Vérifiez `DBConnection.java` (username, password, port)
3. Testez la connexion MySQL : `mysql -u root -p`

### Problème 3 : ClassNotFoundException: com.mysql.cj.jdbc.Driver

**Cause :** Driver MySQL manquant  
**Solution :**
1. Vérifiez `pom.xml` contient la dépendance MySQL
2. Exécutez : `mvn clean install`
3. Vérifiez que `mysql-connector-java-8.0.33.jar` est dans `target/MiniAuthApp/WEB-INF/lib/`

### Problème 4 : Port 8080 déjà utilisé

**Cause :** Autre application utilise le port 8080  
**Solution :**
1. Arrêtez l'autre application
2. Ou changez le port Tomcat dans `conf/server.xml` :
   ```xml
   <Connector port="8081" protocol="HTTP/1.1" .../>
   ```

### Problème 5 : Maven non reconnu

**Cause :** Maven non dans le PATH  
**Solution :**
1. Vérifiez `M2_HOME` : `echo %M2_HOME%`
2. Ajoutez `%M2_HOME%\bin` au PATH
3. Redémarrez le terminal

## Étape 9 : Configuration Git

```bash
# Initialiser le dépôt
git init

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "Initial commit - MiniAuthApp"

# Créer un dépôt sur GitHub puis :
git remote add origin https://github.com/votre-username/MiniAuthApp.git

# Pousser le code
git branch -M main
git push -u origin main
```

## ✅ Checklist finale

- [ ] Java JDK installé et configuré
- [ ] Tomcat installé et configuré
- [ ] MySQL installé et démarré
- [ ] Maven installé et configuré
- [ ] Base de données `users_db` créée
- [ ] Table `users` créée avec données de test
- [ ] Projet compilé avec Maven
- [ ] Fichier WAR généré
- [ ] Application déployée sur Tomcat
- [ ] Application accessible sur `http://localhost:8080/MiniAuthApp/`
- [ ] Connexion fonctionnelle
- [ ] Dashboard accessible après login
- [ ] Déconnexion fonctionnelle
- [ ] Dépôt Git initialisé

## 🎉 Félicitations !

Votre application MiniAuthApp est maintenant opérationnelle !

Pour toute question ou problème, consultez les logs Tomcat ou la documentation Java EE.
