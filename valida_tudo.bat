@echo off
setlocal enabledelayedexpansion

REM ===== CONFIGURE AQUI OS SCRIPTS PRINCIPAIS =====
set SCRIPTS=check_deploy_prereqs.bat preparar_ambiente.bat verificar_estrutura.bat "REM --- Rodar migrations do banco ---.bat" deploy_cargaclik.bat super_deploy_cargaclik.bat deploy_prod.bat run_cargaclik.bat automate_all.bat limpar_cargolink.bat iniciar_cargolink.bat processar_video.py setup_guard_ci.bat

REM ==== PARA PYTHON ====
set PYTHON_CMD=python

REM ==== VARIÁVEIS DE CONTROLE ====
set ERROR=0
set SCRIPTNUM=1

echo ================================
echo VALIDACAO GERAL DO CARGACLIK
echo ================================
echo.

for %%S in (%SCRIPTS%) do (
    echo [!SCRIPTNUM!] Executando: %%S
    if "%%~xS"==".bat" (
        call %%S
    ) else if "%%~xS"==".py" (
        %PYTHON_CMD% %%S
    ) else (
        echo Tipo desconhecido: %%S
    )
    if errorlevel 1 (
        echo ##############
        echo ERRO em %%S!
        echo ##############
        set ERROR=1
        goto :FIM
    ) else (
        echo OK: %%S finalizado.
    )
    echo -------------------------------
    set /a SCRIPTNUM+=1
)

:FIM
echo.
if "%ERROR%"=="0" (
    echo =========================================
    echo TODOS OS SCRIPTS EXECUTADOS COM SUCESSO!
    echo =========================================
    exit /b 0
) else (
    echo ========================================
    echo ALGUM SCRIPT FALHOU! VERIFIQUE O LOG.
    echo ========================================
    exit /b 1
)
pause
