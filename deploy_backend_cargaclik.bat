@echo off
cd /d C:\Users\User\Documents\cargaclik\backend

echo === [1/4] Limpando arquivos Nix (se existirem) ===
del nixpacks.toml 2>nul
del nix.toml 2>nul
del /s /q *.nix 2>nul

echo === [2/4] Confirmando Procfile correto ===
echo web: bundle exec rails server -b 0.0.0.0 -p $PORT > Procfile

echo === [3/4] Commitando e enviando para o GitHub ===
git add .
git commit -m "Reestrutura backend com pastas mínimas e força Docker"
git push origin main

echo === [4/4] Abrindo Railway para monitorar o deploy ===
start https://railway.com/project/fa3a8fa6-9d3d-4714-863a-25461c385549/service/37e41c40-497b-4911-afca-0d98deead3f2?environmentId=6fde1f36-5e25-4e7d-99bd-3dbfc4f959f5&id=eaa628f5-ded4-4758-996b-e493a359508d#build

echo === PRONTO! Verifique o build no Railway ===
pause
