@echo off
REM === Acessa a pasta raiz do projeto ===
cd /d C:\Users\User\Documents\cargaclik

echo Limpando arquivos Dockerfile e railway.json duplicados...

REM === Remove Dockerfiles e railway.json duplicados (exceto os corretos) ===
del /f /q Dockerfile 2>nul
del /f /q backend\railway.json 2>nul
del /f /q backend\backend\Dockerfile 2>nul
del /f /q backend\backend\railway.json 2>nul
del /f /q backend_backup_2025-06-01_15-04-54\*Dockerfile* 2>nul
del /f /q backend_backup_2025-06-01_15-04-54\*railway.json* 2>nul
del /f /q CargaClikDeploy\*Dockerfile* 2>nul
del /f /q CargaClikDeploy\*railway.json* 2>nul

REM === Garante conteúdo correto do railway.json na raiz ===
echo { "build": { "dockerfilePath": "backend/Dockerfile" } } > railway.json

echo Corrigindo Dockerfile principal com suporte a SQLite...

REM === Substitui conteúdo do backend/Dockerfile ===
(
echo FROM ruby:3.2
echo.
echo RUN apt-get update -qq ^&^& apt-get install -y ^
echo   build-essential ^
echo   nodejs ^
echo   yarn ^
echo   sqlite3 ^
echo   libsqlite3-dev
echo.
echo WORKDIR /app
echo COPY . .
echo RUN bundle install
echo.
echo EXPOSE 3000
echo CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
) > backend\Dockerfile

echo Fazendo commit e push...

git add .
git commit -m "Limpa arquivos duplicados, corrige Dockerfile e railway.json para deploy SQLite"
git push origin main

echo Abrindo Railway...
start https://railway.app

echo === PRONTO! Verifique o deploy no Railway ===
pause
