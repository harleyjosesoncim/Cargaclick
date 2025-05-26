@echo off
setlocal EnableDelayedExpansion
REM ============================================
REM      CargaClik - Preparar Ambiente
REM ============================================

echo.
echo === Iniciando preparação do ambiente... ===
echo.

REM --- Verificar Ruby ---
where ruby >nul 2>nul
if errorlevel 1 (
    echo [ERRO] Ruby não encontrado! Instale Ruby para continuar.
    pause
    exit /b 1
) else (
    echo [OK] Ruby encontrado: 
    ruby -v
)

REM --- Verificar Bundler ---
where bundler >nul 2>nul
if errorlevel 1 (
    echo [INFO] Bundler não encontrado. Instalando...
    gem install bundler
) else (
    echo [OK] Bundler encontrado:
    bundler -v
)

REM --- Instalar Gems do projeto ---
if exist Gemfile (
    echo [INFO] Instalando gems do projeto (bundle install)...
    bundle install
) else (
    echo [AVISO] Nenhum Gemfile encontrado. Pulando instalação de gems.
)

REM --- Verificar Node.js ---
where node >nul 2>nul
if errorlevel 1 (
    echo [ERRO] Node.js não encontrado! Instale Node.js para continuar.
    pause
    exit /b 1
) else (
    echo [OK] Node.js encontrado: 
    node -v
)

REM --- Instalar dependências do Node ---
if exist package.json (
    echo [INFO] Instalando dependências do Node (npm install)...
    npm install
) else (
    echo [AVISO] Nenhum package.json encontrado. Pulando instalação de dependências do Node.
)

REM --- Verificar Yarn (opcional) ---
where yarn >nul 2>nul
if not errorlevel 1 (
    echo [INFO] Yarn encontrado: 
    yarn -v
    if exist package.json (
        echo [INFO] Instalando dependências do Node via Yarn...
        yarn install
    )
)

REM --- Checagem de arquivos de ambiente ---
if not exist .env (
    echo [AVISO] Arquivo .env não encontrado. Crie/copie um .env se necessário!
)
if not exist .env.production (
    echo [AVISO] Arquivo .env.production não encontrado. Crie/copie um .env.production se necessário!
)

REM --- Lint/check básico (opcional) ---
REM -- Descomente abaixo se quiser rodar RuboCop ou ESLint automático
REM if exist Gemfile (
REM     echo [INFO] Rodando RuboCop...
REM     bundle exec rubocop
REM )
REM if exist package.json (
REM     echo [INFO] Rodando ESLint...
REM     npx eslint .
REM )

echo.
echo [SUCESSO] Ambiente preparado! Siga para o próximo passo.
pause
endlocal
