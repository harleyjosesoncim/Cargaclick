@echo off
cd /d "%~dp0"
echo Fazendo deploy do CargaClik...
git add .
git commit -m "Corrige Dockerfile e fly.toml para subir no Fly.io"
git push origin main
fly deploy --wait-timeout 300
pause
