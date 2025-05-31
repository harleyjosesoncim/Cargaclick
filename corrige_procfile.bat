@echo off
REM Vai para a raiz do projeto
cd /d %~dp0

REM Vai para a pasta backend
cd backend

REM Cria (ou sobrescreve) o Procfile correto
echo web: bundle exec rails server -b 0.0.0.0 -p $PORT > Procfile

REM Mostra o conteúdo do Procfile para conferência
echo ===== CONTEÚDO DO PROCFILE =====
type Procfile
echo ================================

REM Adiciona e commita no git
git add Procfile
git commit -m "add/corrige Procfile para Railway autostart"
git push origin main

REM Mostra os arquivos da pasta backend para confirmação
echo.
echo ===== ARQUIVOS NA PASTA BACKEND =====
dir /b
echo ======================================

echo.
echo Procfile criado e enviado ao GitHub! Confira no Railway e no GitHub se aparece o arquivo 'Procfile' na pasta backend.
echo.
pause
