@echo off
echo ============================================
echo  Verificando pré-requisitos de deploy
echo ============================================

REM Checa Heroku CLI
echo 1) Verificando Heroku CLI...
where heroku >nul 2>&1
if errorlevel 1 (
  echo ERRO: Heroku CLI nao encontrado.
  echo -> Baixe e instale em https://devcenter.heroku.com/articles/heroku-cli
) else (
  echo Heroku CLI encontrado.
)

echo.

REM Checa login no Heroku
heroku auth:whoami >nul 2>&1
if errorlevel 1 (
  echo AVISO: Voce nao esta logado no Heroku.
  echo -> Execute 'heroku login' para autenticar.
) else (
  echo Voce esta autenticado no Heroku.
)

echo.

REM Checa Netlify CLI
echo 2) Verificando Netlify CLI...
where netlify >nul 2>&1
if errorlevel 1 (
  echo ERRO: Netlify CLI nao encontrado.
  echo -> Instale com: npm install -g netlify-cli
) else (
  echo Netlify CLI encontrado.
)

echo.

REM Checa login no Netlify
netlify status >nul 2>&1
if errorlevel 1 (
  echo AVISO: Voce nao esta logado no Netlify.
  echo -> Execute 'netlify login' para autenticar.
) else (
  echo Voce esta autenticado no Netlify.
)

echo.

REM Instrucoes finais
echo === Após instalar e autenticar ===
echo 1) Configure variaveis de ambiente no Heroku com deploy_prod.bat ou manualmente.
echo 2) Vincule seu site Netlify com 'netlify link' na pasta docs_assets.
echo 3) Execute deploy_prod.bat para realizar o deploy completo.
pause
