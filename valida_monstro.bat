@echo off
setlocal enabledelayedexpansion

REM ==== Cria nome do arquivo de log (ajusta data/hora para não ter espaço/colisão) ====
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do set MYDATE=%%d-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ("%time%") do set MYTIME=%%a%%b
set LOG=valida_log_%MYDATE%_%MYTIME%.txt

echo Iniciando validacao em %DATE% %TIME% > %LOG%
echo Iniciando validacao em %DATE% %TIME%

REM =========================
REM CONFIGURACOES INICIAIS
REM =========================

set DEPENDENCIAS=node npm python git docker netlify
set VARS=NODE_ENV RAILS_ENV
set SCRIPTS=check_deploy_prereqs.bat verificar_estrutura.bat deploy_cargaclik.bat super_deploy_cargaclik.bat run_cargaclik.bat automate_all.bat limpar_cargolink.bat iniciar_cargolink.bat processar_video.py setup_guard_ci.bat

set PYTHON_CMD=python
set RUBY_CMD=ruby

set "RESULTS_DEP="
set "RESULTS_ENV="
set "RESULTS_SCRIPTS="
set "ERROR=0"
REM =========================
REM EXECUTANDO SCRIPTS DO PROJETO
REM =========================

echo ========================= >> %LOG%
echo 3) Executando scripts principais do projeto >> %LOG%
echo ========================= >> %LOG%
echo =========================
echo 3) Executando scripts principais do projeto
echo =========================

set SCRIPTNUM=1

for %%S in (%SCRIPTS%) do (
    set "SCRIPT=%%S"
    call :EXEC_SCRIPT
    set /a SCRIPTNUM+=1
)

goto :RELATORIO

:EXEC_SCRIPT
REM Expande extensão corretamente com delayedexpansion
setlocal enabledelayedexpansion
set "EXT=!SCRIPT:~-4!"
echo [!SCRIPTNUM!] Executando: !SCRIPT! >> %LOG%
echo [!SCRIPTNUM!] Executando: !SCRIPT!
if /I "!EXT!"==".bat" (
    call "!SCRIPT!" >> %LOG% 2>&1
) else if /I "!EXT!"==".py" (
    %PYTHON_CMD% "!SCRIPT!" >> %LOG% 2>&1
) else if /I "!EXT!"==".rb" (
    %RUBY_CMD% "!SCRIPT!" >> %LOG% 2>&1
) else (
    echo Tipo de arquivo desconhecido: !SCRIPT! (ignorando) >> %LOG%
    echo Tipo de arquivo desconhecido: !SCRIPT! (ignorando)
    endlocal
    set "RESULTS_SCRIPTS=!RESULTS_SCRIPTS!!SCRIPT!: IGNORADO;"
    goto :EOF
)
if errorlevel 1 (
    echo ************* ERRO EM !SCRIPT! ************* >> %LOG%
    echo ************* ERRO EM !SCRIPT! *************
    set "RESULTS_SCRIPTS=!RESULTS_SCRIPTS!!SCRIPT!: ERRO;"
    set ERROR=1
) else (
    echo OK: !SCRIPT! executado com sucesso! >> %LOG%
    echo OK: !SCRIPT! executado com sucesso!
    set "RESULTS_SCRIPTS=!RESULTS_SCRIPTS!!SCRIPT!: OK;"
)
endlocal
goto :EOF

:RELATORIO
REM (restante do script igual ao anterior, a partir do bloco do relatório final)


REM =========================
REM VERIFICACAO DE DEPENDENCIAS
REM =========================
echo ========================= >> %LOG%
echo 1) Checando dependencias  >> %LOG%
echo ========================= >> %LOG%
echo =========================
echo 1) Checando dependencias
echo =========================

for %%D in (%DEPENDENCIAS%) do (
    where %%D >nul 2>nul
    if errorlevel 1 (
        echo ERRO: %%D NAO ENCONTRADO. >> %LOG%
        echo ERRO: %%D NAO ENCONTRADO.
        set "RESULTS_DEP=!RESULTS_DEP!%%D: ERRO;"
        set ERROR=1
    ) else (
        echo OK: %%D encontrado. >> %LOG%
        echo OK: %%D encontrado.
        set "RESULTS_DEP=!RESULTS_DEP!%%D: OK;"
    )
)
echo. >> %LOG%
echo.

REM =========================
REM CHECANDO/DEFININDO VARIAVEIS DE AMBIENTE
REM =========================

echo ========================= >> %LOG%
echo 2) Checando variaveis de ambiente >> %LOG%
echo ========================= >> %LOG%
echo =========================
echo 2) Checando variaveis de ambiente
echo =========================

for %%V in (%VARS%) do (
    if "!%%V!"=="" (
        set %%V=development
        echo AUTO-FIX: Variavel %%V nao estava definida, setada para "development". >> %LOG%
        echo AUTO-FIX: Variavel %%V nao estava definida, setada para "development".
        set "RESULTS_ENV=!RESULTS_ENV!%%V: AUTO-FIX;"
    ) else (
        echo OK: Variavel %%V = !%%V! >> %LOG%
        echo OK: Variavel %%V = !%%V!
        set "RESULTS_ENV=!RESULTS_ENV!%%V: OK;"
    )
)
echo. >> %LOG%
echo.

REM =========================
REM EXECUTANDO SCRIPTS DO PROJETO
REM =========================

echo ========================= >> %LOG%
echo 3) Executando scripts principais do projeto >> %LOG%
echo ========================= >> %LOG%
echo =========================
echo 3) Executando scripts principais do projeto
echo =========================

set SCRIPTNUM=1

for %%S in (%SCRIPTS%) do (
    echo [!SCRIPTNUM!] Executando: %%S >> %LOG%
    echo [!SCRIPTNUM!] Executando: %%S
    if "%%~xS"==".bat" (
        call %%S >> %LOG% 2>&1
    ) else if "%%~xS"==".py" (
        %PYTHON_CMD% %%S >> %LOG% 2>&1
    ) else if "%%~xS"==".rb" (
        %RUBY_CMD% %%S >> %LOG% 2>&1
    ) else (
        echo Tipo de arquivo desconhecido: %%S (ignorando) >> %LOG%
        echo Tipo de arquivo desconhecido: %%S (ignorando)
        set "RESULTS_SCRIPTS=!RESULTS_SCRIPTS!%%S: IGNORADO;"
        set /a SCRIPTNUM+=1
        goto :NEXTSCRIPT
    )
    if errorlevel 1 (
        echo ************* ERRO EM %%S ************* >> %LOG%
        echo ************* ERRO EM %%S *************
        set "RESULTS_SCRIPTS=!RESULTS_SCRIPTS!%%S: ERRO;"
        set ERROR=1
    ) else (
        echo OK: %%S executado com sucesso! >> %LOG%
        echo OK: %%S executado com sucesso!
        set "RESULTS_SCRIPTS=!RESULTS_SCRIPTS!%%S: OK;"
    )
    set /a SCRIPTNUM+=1
    :NEXTSCRIPT
    echo ------------------------------- >> %LOG%
    echo -------------------------------
)
echo. >> %LOG%
echo.

REM =========================
REM RELATORIO FINAL
REM =========================

echo ========================= >> %LOG%
echo RELATORIO FINAL - CARGACLIK >> %LOG%
echo ========================= >> %LOG%
echo =========================
echo RELATORIO FINAL - CARGACLIK
echo =========================

echo. >> %LOG%
echo -- DEPENDENCIAS -- >> %LOG%
echo -- DEPENDENCIAS --
for %%A in (!RESULTS_DEP!) do (
    echo %%A >> %LOG%
    echo %%A
)

echo. >> %LOG%
echo -- VARIAVEIS DE AMBIENTE -- >> %LOG%
echo -- VARIAVEIS DE AMBIENTE --
for %%B in (!RESULTS_ENV!) do (
    echo %%B >> %LOG%
    echo %%B
)

echo. >> %LOG%
echo -- SCRIPTS EXECUTADOS -- >> %LOG%
echo -- SCRIPTS EXECUTADOS --
for %%C in (!RESULTS_SCRIPTS!) do (
    echo %%C >> %LOG%
    echo %%C
)
echo. >> %LOG%
echo.

if "%ERROR%"=="0" (
    echo ===================================== >> %LOG%
    echo  TUDO CERTO! PROJETO PRONTO PARA RODAR! >> %LOG%
    echo ===================================== >> %LOG%
    echo =====================================
    echo  TUDO CERTO! PROJETO PRONTO PARA RODAR!
    echo =====================================
    echo Veja tambem o arquivo de log: %LOG%
    exit /b 0
) else (
    echo ===================================== >> %LOG%
    echo  ALGUM ERRO FOI ENCONTRADO! Veja acima. >> %LOG%
    echo ===================================== >> %LOG%
    echo =====================================
    echo  ALGUM ERRO FOI ENCONTRADO! Veja acima.
    echo =====================================
    echo Veja tambem o arquivo de log: %LOG%
    exit /b 1
)
pause
