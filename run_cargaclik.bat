echo [2/8] Verificando Bundler...
call bundle -v >nul 2>&1
if errorlevel 1 (
  echo Bundler nao encontrado. Instalando no perfil de usuario...
  call gem install bundler --user-install --no-document
  echo Ajustando PATH para o gem user
  setx PATH "%USERPROFILE%\.gem\ruby\3.4.0\bin;%PATH%" >nul
) else (
  echo Bundler ja instalado.
)
