<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Sécurité : Empêcher l'accès au dashboard sans authentification
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
        }
        .dashboard-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            margin-bottom: 10px;
        }
        .welcome-message {
            color: #667eea;
            font-size: 24px;
            margin-bottom: 30px;
        }
        .info-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            border-left: 4px solid #667eea;
            margin-bottom: 20px;
        }
        .logout-btn {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: transform 0.2s;
        }
        .logout-btn:hover {
            transform: translateY(-2px);
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
        .stat-card h3 {
            margin: 0;
            font-size: 32px;
        }
        .stat-card p {
            margin: 5px 0 0 0;
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>✅ Authentification réussie !</h1>
        <p class="welcome-message">Bienvenue, <strong>${user}</strong> !</p>
        
        <div class="info-box">
            <h3>📊 Tableau de bord</h3>
            <p>Vous êtes maintenant connecté à l'application.</p>
            <p>Votre session est active et sécurisée.</p>
        </div>
        
        <div class="stats">
            <div class="stat-card">
                <h3>🔐</h3>
                <p>Connexion sécurisée</p>
            </div>
            <div class="stat-card">
                <h3>✓</h3>
                <p>Authentifié</p>
            </div>
            <div class="stat-card">
                <h3>🎯</h3>
                <p>Accès autorisé</p>
            </div>
        </div>
        
        <div style="margin-top: 30px;">
            <a href="logout.jsp" class="logout-btn">🚪 Déconnexion</a>
        </div>
    </div>
</body>
</html>
