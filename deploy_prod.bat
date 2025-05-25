@echo off
REM ——————————————————————————————
REM Deploy Produtor CargaClik
REM ——————————————————————————————

REM 1) Variáveis – ajuste conforme necessário
set GITHUB_REPO=git@github.com:HarleyJoseSoncim/Cargaclick.git
set HEROKU_APP=cargaclick-backend
set NETLIFY_SITE_ID=SEU_SITE_ID_NETLIFY
set DOMAIN=cargaclick.com.br

echo.
echo === 1. Preparando repositório ===
REM Cria .gitignore caso não exista
if not exist .gitignore (
  echo Gerando .gitignore…
  type nul > .gitignore
  >>.gitignore echo .DS_Store
  >>.gitignore echo Thumbs.db
  >>.gitignore echo.
  >>.gitignore echo backend/.bundle/
  >>.gitignore echo backend/log/*
  >>.gitignore echo backend/tmp/
  >>.gitignore echo backend/*.sqlite3
  >>.gitignore echo mobile/node_modules/
  >>.gitignore echo mobile/android/app/build/
  >>.gitignore echo mobile/ios/build/
  >>.gitignore echo *.env
  >>.gitignore echo .env.local
)

REM 2) Reestruturação monorepo (seus dirs originais em *-local)
if exist backend-local (
  echo Movendo backend-local → backend
  move /Y backend-local backend
)
if exist mobile-local (
  echo Movendo mobile-local → mobile
  move /Y mobile-local mobile
)
if exist docs-local (
  echo Movendo docs-local → docs_assets
  move /Y docs-local docs_assets
)

REM 3) Limpeza de artefatos
echo Limpando node_modules, builds e logs…
if exist backend\.bundle   rmdir /S /Q backend\.bundle
if exist backend\log       rmdir /S /Q backend\log
if exist backend\tmp       rmdir /S /Q backend\tmp
if exist mobile\node_modules          rmdir /S /Q mobile\node_modules
if exist mobile\android\app\build     rmdir /S /Q mobile\android\app\build
if exist mobile\ios\build             rmdir /S /Q mobile\ios\build

REM 4) Git – commit e push
echo.
echo Comitando alterações…
git add -A
git commit -m "🚀 Ready for production deploy"
echo Push para GitHub…
git remote remove origin 2>nul
git remote add origin %GITHUB_REPO%
git push -u origin main

REM 5) Deploy Rails no Heroku
echo.
echo Deploy backend para Heroku…
heroku create %HEROKU_APP% 2>nul
heroku git:remote -a %HEROKU_APP%
git push heroku main
heroku domains:add %DOMAIN%

REM 6) Deploy landing no Netlify
echo.
echo Deploy landing (docs_assets) para Netlify…
pushd docs_assets
netlify deploy --site %NETLIFY_SITE_ID% --prod --dir .
popd
netlify domain:add %DOMAIN% --site %NETLIFY_SITE_ID%

echo.
echo === DEPLOY CONCLUÍDO ===
pause
