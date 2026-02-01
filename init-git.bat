@echo off
REM Script to initialize Git repository in the project folder

echo Initializing Git repository for MiniAuthApp...
echo.

REM Navigate to project directory (where this script is located)
cd /d "%~dp0"

REM Initialize Git repository
git init

REM Add all files to staging
git add .

REM Create initial commit
git commit -m "Initial commit - MiniAuthApp Java EE Authentication Application"

echo.
echo Git repository initialized successfully!
echo.
echo Next steps:
echo 1. Create a repository on GitHub
echo 2. Run: git remote add origin YOUR_GITHUB_URL
echo 3. Run: git branch -M main
echo 4. Run: git push -u origin main
echo.
pause
