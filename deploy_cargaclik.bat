@echo off
setlocal EnableDelayedExpansion
REM ============================================
REM   CargaClik - Deploy Automatizado
REM ============================================

REM -------- Variáveis principais --------
set GITHUB_REPO=git@github.com:HarleyJoseSoncim/Cargaclick.git
set HEROKU_APP=cargaclick-backend
set NETLIFY_SITE_ID=SEU_SITE_ID_NETLIFY
set DOMAIN=cargaclick.com.br

REM -------- 1. Commit e push para GitHub --------
echo.
echo === 1. Commitando e enviando para GitHub ===
git add -A
git commit -m "🚀 Deploy automático CargaClik"
git remote remove origin 2>nul
git remote add origin %GITHUB_REPO%
git push -u origin main

REM -------- 2. Deploy backend (Heroku) --------
echo.
echo === 2. Deploy backend no Heroku ===
where heroku >nul 2>nul
if errorlevel 1 (
    echo [ERRO] Heroku CLI não instalada. Instale e tente de novo!
    pause
    exit /b 1
)
heroku git:remote -a %HEROKU_APP%
git push heroku main
heroku domains:add %DOMAIN%

REM -------- 3. Deploy landing/docs (Netlify) --------
echo.
echo === 3. Deploy landing/docs_assets no Netlify ===
where netlify >nul 2>nul
if errorlevel 1 (
    echo [ERRO] Netlify CLI não instalada. Instale e tente de novo!
    pause
    exit /b 1
)
pushd docs_assets
netlify deploy --site %NETLIFY_SITE_ID% --prod --dir .
popd
netlify domain:add %DOMAIN% --site %NETLIFY_SITE_ID%

echo.
echo [SUCESSO] Deploy finalizado!
pause
endlocal

