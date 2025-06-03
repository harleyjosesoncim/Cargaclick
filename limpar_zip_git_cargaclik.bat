@echo off
echo =============================================
echo Removendo prepara_deploy.zip do Git e histórico...
echo =============================================

cd /d C:\Users\User\Documents\cargaclik

REM Remove o ZIP do histórico local
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch prepara_deploy.zip" --prune-empty --tag-name-filter cat -- --all

REM Adiciona ao .gitignore para nunca mais entrar
echo prepara_deploy.zip>> .gitignore

git add .gitignore
git commit -m "Remove prepara_deploy.zip do histórico e adiciona ao .gitignore"

REM Força o push do histórico reescrito
git push origin main --force

echo =============================================
echo PRONTO! O ZIP foi removido do repositório e o push foi enviado!
echo Verifique o deploy no Railway agora.
start https://railway.app
pause
