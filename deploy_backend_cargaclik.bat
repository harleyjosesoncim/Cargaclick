@echo off
SETLOCAL

echo === Extraindo ZIP para D:/cargaclik/backend ===
powershell -Command "Expand-Archive -Path "%~dp0cargaclik_backend_rails.zip" -DestinationPath "D:/cargaclik/backend" -Force"

cd /d "D:/cargaclik/backend"

echo === Iniciando repositório Git ===
git init
git branch -M main
git add .
git commit -m "Deploy inicial do backend CargaClik"
git remote add origin https://github.com/harleyjosesoncim/Cargaclik.git
git push -u origin main

echo === Abrindo Railway ===
start https://railway.app/project

echo === Concluído ===
pause
