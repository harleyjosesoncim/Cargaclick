@echo off
cd /d "C:\Users\User\Frete"

echo Verificando versão da migration CreateFretes...

:: Substitua abaixo pela versão correta se for diferente
set VERSION=20250515160000

:: Remover entrada do schema_migrations diretamente
echo Removendo a versão da migration do banco de dados...
sqlite3 db\development.sqlite3 "DELETE FROM schema_migrations WHERE version = '%VERSION%';"

:: Rodar novamente as migrations
echo Rodando novamente as migrations...
ruby bin\rails db:migrate

pause
