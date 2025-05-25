
@echo off
echo Verificando estrutura do projeto CargoLink...

REM Verifica a existência dos principais arquivos e pastas do Rails
if exist "Gemfile" (
    echo [OK] Gemfile encontrado
) else (
    echo [ERRO] Gemfile NAO encontrado
)

if exist "config\routes.rb" (
    echo [OK] config/routes.rb encontrado
) else (
    echo [ERRO] config/routes.rb NAO encontrado
)

if exist "app\controllers\application_controller.rb" (
    echo [OK] app/controllers/application_controller.rb encontrado
) else (
    echo [ERRO] app/controllers/application_controller.rb NAO encontrado
)

if exist "app\views" (
    echo [OK] Pasta de views encontrada
) else (
    echo [ERRO] Pasta de views NAO encontrada
)

if exist "db\migrate" (
    echo [OK] Pasta de migrations encontrada
) else (
    echo [ERRO] Pasta db/migrate NAO encontrada
)

echo.
echo === Verificação concluída ===
pause
