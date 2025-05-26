@echo off
echo ============================================
echo  Mesclando branch 'main' remoto com local  
echo ============================================

REM 1) Git pull com histórico não relacionado
git pull origin main --allow-unrelated-histories
if errorlevel 1 (
  echo.
  echo [ERRO] Ocorreram conflitos de merge.
  echo Resolva manualmente os arquivos indicados e depois execute este script novamente.
  pause
  exit /b 1
)

echo.
echo [OK] Mesclagem concluida sem conflitos.
echo.

REM 2) Push para origin main
echo Enviando alterações para 'origin main'...
git push -u origin main
if errorlevel 1 (
  echo.
  echo [ERRO] Falha ao enviar para o GitHub.
  echo Verifique as mensagens de erro acima.
  pause
  exit /b 1
)

echo.
echo [SUCESSO] Push concluido com sucesso!
pause
