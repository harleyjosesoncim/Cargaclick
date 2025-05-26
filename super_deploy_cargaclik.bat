@echo off
setlocal EnableDelayedExpansion

REM ====== SUPER DEPLOY CARGACLIK INTELIGENTE ======

REM --- Função de saída limpa ---
:fail
echo [ERRO] %*
pause
exit /b 1

REM --- Mensagens coloridas (Windows 10+) ---
set GREEN=[OK]
set YELLOW=[AVISO]
set RED=[ERRO]
set BLUE=[INFO]

REM --- Checagem de Git, Heroku, Netlify ---
where git >nul 2>nul || call :fail "Git não está instalado ou não está no PATH!"
where heroku >nul 2>nul || echo %YELLOW% Heroku CLI não está instalada.
where netlify >nul 2>nul || echo %YELLOW% Netlify CLI não está instalada.

REM --- Ativando ssh-agent (funciona em Bash e CMD) ---
echo %BLUE% Iniciando ssh-agent...
call bash -c "eval $(ssh-agent -s)"
if errorlevel 1 call :fail "Falha ao iniciar ssh-agent!"

REM --- Adicionando chave SSH ---
if exist %USERPROFILE%\.ssh\id_rsa (
    call bash -c "ssh-add ~/.ssh/id_rsa"
) else (
    call :fail "Chave privada id_rsa NÃO encontrada! Gere uma com ssh-keygen."
)

REM --- Testando SSH com GitHub ---
echo %BLUE% Testando SSH com GitHub...
call bash -c "ssh -T git@github.com"
if errorlevel 1 call :fail "Falha na autenticação SSH! Cheque se a chave id_rsa.pub está cadastrada no GitHub."

REM --- Checagem de alterações locais no Git ---
git status --porcelain | findstr /R /C:"." >nul
if %ERRORLEVEL%==0 (
    echo %BLUE% Commitando e enviando para GitHub...
    git add -A
    git commit -m "🚀 Deploy automático via SUPER BAT"
    git push
    if errorlevel 1 call :fail "Falha ao fazer push no GitHub!"
) else (
    echo %YELLOW% Sem alterações para commitar.
)

REM --- Deploy backend no Heroku ---
where heroku >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo %YELLOW% Heroku CLI não instalada. Pulei deploy Heroku.
) else (
    echo %BLUE% Deploy backend no Heroku...
    heroku git:remote -a cargaclick-backend
    git push heroku main
    if errorlevel 1 call :fail "Push para Heroku falhou!"
    echo %BLUE% Rodando migrations...
    heroku run rake db:migrate -a cargaclick-backend
)

REM --- Deploy landing no Netlify ---
where netlify >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo %YELLOW% Netlify CLI não instalada. Pulei deploy Netlify.
) else (
    if not exist docs_assets\ (
        call :fail "A pasta docs_assets não existe!"
    )
    echo %BLUE% Deploy landing/docs_assets no Netlify...
    pushd docs_assets
    netlify deploy --site 9b4478ee-4f1d-4eff-b502-68346efdfbb6 --prod --dir .
    if errorlevel 1 (
        popd
        call :fail "Deploy Netlify falhou!"
    )
    popd
)

echo.
echo %GREEN% SUPER DEPLOY FINALIZADO COM SUCESSO! 🚀
echo.
echo [DICA] Se algum erro persistir, rode os comandos manualmente no Git Bash para identificar detalhes.
pause
exit /b

REM --- Deploy landing no Netlify ---
where netlify >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo %YELLOW% Netlify CLI não instalada. Pulei deploy Netlify.
) else (
    if not exist docs_assets\ (
        call :fail "A pasta docs_assets não existe!"
    )
    echo %BLUE% Deploy landing/docs_assets no Netlify...
    pushd docs_assets
    REM === TROQUE O SITE ID ABAIXO PELO SEU! ===
    netlify deploy --site 1e0f0123-4567-89ab-cdef-123456789abc --prod --dir .
    if errorlevel 1 (
        popd
        call :fail "Deploy Netlify falhou!"
    )
    popd
)
REM ====== FIM DO SUPER DEPLOY ======