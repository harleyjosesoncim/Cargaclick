
@echo off
echo Iniciando CargoLink...

if not exist "Gemfile" (
  echo ERRO: Arquivo 'Gemfile' nao encontrado na pasta atual.
  echo Por favor, mova este script para a pasta correta do seu projeto Rails com o Gemfile presente.
  pause
  exit /b
)

call bundle install
call rails db:migrate
call rails server
pause
