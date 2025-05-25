@echo off
echo =========================================
echo 🚛 Limpando arquivos desnecessários do CargoLink...
echo =========================================

:: Limpa backend (API)
IF EXIST backend\node_modules (
    rd /s /q backend\node_modules
    echo [OK] node_modules removido de backend
)
IF EXIST backend\.git (
    rd /s /q backend\.git
    echo [OK] .git removido de backend
)
IF EXIST backend\vendor (
    rd /s /q backend\vendor
    echo [OK] vendor removido de backend
)
IF EXIST backend\tmp (
    rd /s /q backend\tmp
    echo [OK] tmp removido de backend
)

:: Limpa mobile (React Native)
IF EXIST mobile_app\node_modules (
    rd /s /q mobile_app\node_modules
    echo [OK] node_modules removido de mobile_app
)
IF EXIST mobile_app\.expo (
    rd /s /q mobile_app\.expo
    echo [OK] .expo removido de mobile_app
)
IF EXIST mobile_app\.git (
    rd /s /q mobile_app\.git
    echo [OK] .git removido de mobile_app
)

:: Limpa painel admin (caso tenha dependências extras)
IF EXIST CargoLink_Painel_Admin\node_modules (
    rd /s /q CargoLink_Painel_Admin\node_modules
    echo [OK] node_modules removido de painel admin
)
IF EXIST CargoLink_Painel_Admin\vendor (
    rd /s /q CargoLink_Painel_Admin\vendor
    echo [OK] vendor removido de painel admin
)

echo =========================================
echo ✅ Limpeza concluída com sucesso!
echo Agora você pode zipar os módulos com segurança.
pause

