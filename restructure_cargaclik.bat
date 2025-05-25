@echo off
echo ==============================================
echo  Reestruturando monorepo Cargaclik
echo ==============================================

REM 1) Cria pastas-alvo
if not exist backend mkdir backend
if not exist mobile  mkdir mobile
if not exist frontend mkdir frontend
if not exist docs_assets mkdir docs_assets

REM 2) Move arquivos e pastas do backend Rails
for %%F in (app bin config db lib scripts Gemfile Gemfile.lock Guardfile docker-compose.yml docker-compose.yaml Dockerfile.rb README_backend.txt .rubocop.yml) do (
  if exist "%%F" (
    echo Movendo %%F para backend\
    move "%%F" backend\
  )
)

REM 3) Move pasta de mobile
if exist mobile_app (
  echo Movendo mobile_app para mobile\
  move mobile_app mobile\
)

REM 4) Move pasta de frontend web
if exist frontend_web (
  echo Movendo frontend_web para frontend\
  move frontend_web frontend\
)

REM 5) Move documentação e assets
for %%F in (README_docs.txt README_mobile.txt README_MERCADOPAGO_SETUP.md VERSAO.txt CHANGELOG.txt CargoLink_Icon.ico CargoLink_Logo.png CargoLink_Logo_Transparent.png beat_cargaclik.mp3.mp3) do (
  if exist "%%F" (
    echo Movendo %%F para docs_assets\
    move "%%F" docs_assets\
  )
)

REM 6) Executa limpeza de artefatos (se existir)
if exist cleanup_prod.bat (
  echo Chamando cleanup_prod.bat...
  call cleanup_prod.bat
)

echo.
echo Monorepo reorganizado com sucesso!
pause
