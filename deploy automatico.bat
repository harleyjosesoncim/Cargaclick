@echo off
SETLOCAL

echo ================================
echo  DEPLOY AUTOMÁTICO - CARGACLIK
echo ================================

REM Caminho até o backend
cd /d C:\Users\User\Documents\cargaclik\backend

echo === 1. Atualizando repositório local ===
git pull origin main

echo === 2. Adicionando alterações ao Git ===
git add .

echo === 3. Criando commit automático ===
git commit -m "Deploy automático via script"

echo === 4. Enviando para o GitHub ===
git push origin main

echo === 5. Instalando dependências Ruby ===
bundle install

echo === 6. Rodando migrações do banco ===
bundle exec rails db:migrate

echo === 7. Iniciando servidor Rails local ===
start cmd /k "bundle exec rails s -b 0.0.0.0 -p 3000"

echo === 8. Abrindo projeto no Railway ===
start https://railway.app/project/fa3a8fa6-9d3d-4714-863a-25461c385549

echo === ✅ DEPLOY FINALIZADO ===

ENDLOCAL
pause
