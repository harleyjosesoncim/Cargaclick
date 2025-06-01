@echo off
cd /d C:\Users\User\Documents\cargaclik\backend

echo Limpando arquivos de Node.js...
del package.json 2>nul
del yarn.lock 2>nul
del pnpm-lock.yaml 2>nul
rmdir /s /q node_modules 2>nul

echo Forçando Git a reconhecer o Rails...
git add Procfile Gemfile Gemfile.lock config.ru
git commit -m "Limpeza de arquivos Node.js e forçando reconhecimento Rails"
git push origin main

pause

