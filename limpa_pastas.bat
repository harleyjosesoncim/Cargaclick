@echo off
echo 🔥 Limpando pastas desnecessárias...

rd /s /q backend_backup_2025-06-01_15-04-54
rd /s /q CargaClikDeploy
rd /s /q cargaclik_sqlite_patch
rd /s /q CargoLink_Painel_Admin
rd /s /q docs_assets
rd /s /q docs_ativos
rd /s /q node_modules
rd /s /q mobile

echo ✅ Limpeza concluída com sucesso!
pause
