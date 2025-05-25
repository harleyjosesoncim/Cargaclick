@echo off
setlocal

echo ============================================
echo === INSTALANDO GEM 'pg' (PostgreSQL)    ===
echo ============================================

:: Caminho padrão do pg_config.exe do PostgreSQL 15
set PG_CONFIG="C:\Program Files\PostgreSQL\15\bin\pg_config.exe"

:: Verifica se o arquivo existe
if not exist %PG_CONFIG% (
    echo [ERRO] pg_config.exe não encontrado em:
    echo        %PG_CONFIG%
    echo Por favor, verifique a instalação do PostgreSQL.
    pause
    exit /b
)

:: Caminho do Gemfile
set GEMFILE_PATH=%CD%\Gemfile

:: Confirma existência do Gemfile
if not exist %GEMFILE_PATH% (
    echo [ERRO] Gemfile não encontrado na pasta atual: %CD%
    pause
    exit /b
)

:: Instala a gem pg com caminho explícito
echo [OK] pg_config encontrado. Instalando a gem pg...
gem install pg -- --with-pg-config=%PG_CONFIG%

:: Agora roda o bundle install
echo Rodando bundle install...
bundle install

echo ============================================
echo === PROCESSO CONCLUÍDO. Verifique erros. ===
echo ============================================
pause
endlocal
