@echo off
echo ============================================
echo Verificando pré-requisitos de deploy
echo ============================================
REM 1) Verificando Netlify CLI...
where netlify >nul 2>nul
if errorlevel 1 (
    echo ERRO: Netlify CLI não encontrado.
    exit /b 1
) else (
    echo Netlify CLI encontrado.
)
REM Adicione outras checagens aqui (Node, Python, Docker, etc)
exit /b 0
REM Verificando Node.js
where node >nul 2>nul
if errorlevel 1 (
    echo ERRO: Node.js não encontrado.
    exit /b 1
) else (
    echo Node.js encontrado.
)
