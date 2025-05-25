@echo off
echo Limpando arquivos temporários e dependências locais...

REM --- Backend Rails ---
if exist backend\.bundle rmdir /S /Q backend\.bundle
if exist backend\node_modules rmdir /S /Q backend\node_modules
if exist backend\log rmdir /S /Q backend\log
if exist backend\tmp rmdir /S /Q backend\tmp

REM --- Mobile React Native ---
if exist mobile\node_modules rmdir /S /Q mobile\node_modules
if exist mobile\android\app\build rmdir /S /Q mobile\android\app\build
if exist mobile\ios\build   rmdir /S /Q mobile\ios\build

REM --- Docs / Assets ---
if exist docs_assets\node_modules rmdir /S /Q docs_assets\node_modules

echo Limpeza concluída.
pause
