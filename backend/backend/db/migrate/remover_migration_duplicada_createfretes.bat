@echo off
cd /d "C:\Users\User\Frete\db\migrate"

echo Procurando migrations duplicadas com o nome CreateFretes...

:: Lista os arquivos que contêm 'create_fretes' no nome
setlocal enabledelayedexpansion
set count=0

for %%f in (*create_fretes*.rb) do (
    echo Encontrado: %%f
    set /a count+=1
    set "file!count!=%%f"
)

if %count% LSS 2 (
    echo Nenhuma duplicata encontrada. Nada será removido.
    pause
    exit /b
)

echo Mais de uma migration encontrada. Removendo a mais nova...

:: Assumimos que a mais nova tem o timestamp mais alto e foi a baixada
set /a newest=0

for /l %%i in (1,1,%count%) do (
    set "fname=!file%%i!"
    set "timestamp=!fname:~0,14!"
    if !timestamp! GTR !newest! (
        set "newest=!timestamp!"
        set "target=!fname!"
    )
)

echo Deletando !target! ...
del "!target!"

echo Migration duplicada removida com sucesso.
pause
