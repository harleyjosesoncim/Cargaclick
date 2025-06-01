@echo off
:: Script seguro para backup/restauração da pasta backend
:: Coloque este .bat NA RAIZ do seu projeto

setlocal enabledelayedexpansion

:: Nome do backup com data/hora
set DATAHORA=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
set DATAHORA=%DATAHORA: =0%

set BACKUPFOLDER=backend_backup_%DATAHORA%

echo ==============================================
echo ==== Script seguro para pasta backend =========
echo ==============================================
echo.
echo 1. Fazer backup da pasta backend
echo 2. Restaurar backup mais recente
echo 3. Remover apenas a pasta backend
echo 4. Cancelar
echo.

set /p OPCAO="Escolha uma opção [1-4]: "

if "%OPCAO%"=="1" (
    echo Criando backup em %BACKUPFOLDER%...
    xcopy /E /I /Y backend %BACKUPFOLDER%
    echo Backup concluido!
    pause
    exit /b
)

if "%OPCAO%"=="2" (
    set /p RESTAURAR="Digite o nome exato da pasta de backup para restaurar (ex: backend_backup_2024-06-01_16-58-00): "
    if not exist "!RESTAURAR!\" (
        echo Backup nao encontrado: !RESTAURAR!
        pause
        exit /b
    )
    echo Restaurando backup...
    rmdir /S /Q backend
    xcopy /E /I /Y "!RESTAURAR!" backend
    echo Restaurado!
    pause
    exit /b
)

if "%OPCAO%"=="3" (
    echo Removendo pasta backend (o backup NAO sera apagado)...
    rmdir /S /Q backend
    echo Pasta backend removida!
    pause
    exit /b
)

echo Cancelado!
pause
exit /b
