REM --- Rodar migrations do banco ---
if exist Gemfile (
    echo [INFO] Rodando migrations do Rails...
    bundle exec rails db:migrate
)
