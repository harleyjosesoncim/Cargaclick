@echo off
echo ==============================================
echo  Automação: Heroku vars, checagem e deploy
echo ==============================================

REM --- 1) Configurar variáveis de ambiente no Heroku a partir de .env.production ---
if not exist .env.production (
  echo ERRO: arquivo .env.production nao encontrado.
  pause
  exit /b 1
)
echo Configurando variaveis Heroku a partir de .env.production...
for /f "usebackq tokens=1* delims==" %%A in (`type .env.production ^| findstr /v "^#"`) do (
  echo Definindo %%A=%%B...
  heroku config:set %%A=%%B --app cargaclick-backend
)
echo Variaveis configuradas no Heroku.
echo.

REM --- 2) Exibir variaveis definidas no deploy_prod.bat ---
if not exist deploy_prod.bat (
  echo ERRO: deploy_prod.bat nao encontrado.
  pause
  exit /b 1
)
echo Exibindo variaveis do topo de deploy_prod.bat:
for /f "usebackq tokens=*" %%L in (`type deploy_prod.bat ^| findstr /b "set "`) do (
  echo %%L
)
echo.

REM --- 3) Executar deploy_prod.bat ---
echo Executando deploy_prod.bat...
call deploy_prod.bat

echo.
echo === Automação concluida ===
pause
