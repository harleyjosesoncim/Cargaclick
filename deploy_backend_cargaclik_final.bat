@echo off
SETLOCAL

echo === Extraindo ZIP para D:\cargaclik\backend ===
powershell -Command "Expand-Archive -Path "%~dp0cargaclik_backend_rails.zip" -DestinationPath "D:\cargaclik\backend" -Force"

cd /d "D:\cargaclik\backend"

echo === Iniciando repositório Git ===
git init
git branch -M main
git add .
git commit -m "Deploy inicial do backend CargaClik"
git remote add origin https://github.com/harleyjosesoncim/Cargaclick.git
git push -u origin main

echo === Abrindo Railway ===
start https://railway.com/project/fa3a8fa6-9d3d-4714-863a-25461c385549?environmentId=6fde1f36-5e25-4e7d-99bd-3dbfc4f959f5

echo === Concluído ===
pause
