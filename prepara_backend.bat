@echo off
REM Navega até a raiz do projeto (ajuste o caminho se necessário)
cd /d %~dp0

REM Cria pasta backend se não existir
if not exist backend (
    mkdir backend
    echo Criada pasta 'backend'
)

REM Move arquivos essenciais para dentro de backend
for %%F in (Rakefile Gemfile Gemfile.lock config.ru) do (
    if exist %%F move /Y %%F backend\
)

REM Move pastas essenciais do Rails
for %%D in (app bin config db lib public) do (
    if exist %%D move /Y %%D backend\
)

echo.
echo === ESTRUTURA DE BACKEND AJUSTADA ===
cd backend
dir

echo.
echo =======================================
echo ATENÇÃO:
echo 1. No Railway, ajuste o Root Directory para: backend
echo 2. Confirme se todos os arquivos essenciais estao em backend
echo 3. Depois rode:
echo    bundle install
echo    $env:RAILS_ENV="production"; bundle exec rake assets:precompile
echo =======================================
pause
