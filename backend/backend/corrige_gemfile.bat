@echo off
REM Vai para a raiz do projeto
cd /d %~dp0

REM Remove Gemfile e Gemfile.lock errados na raiz
if exist Gemfile (
    del Gemfile
    echo Apagou Gemfile da raiz.
)
if exist Gemfile.lock (
    del Gemfile.lock
    echo Apagou Gemfile.lock da raiz.
)

REM Vai para pasta backend
cd backend

REM Remove pasta Gemfile se existir (e limpa pasta oculta com o mesmo nome)
if exist Gemfile (
    rmdir /s /q Gemfile
    echo Apagou pasta Gemfile que estava errada na backend.
)

REM Cria novo arquivo Gemfile correto
echo source "https://rubygems.org" > Gemfile
echo ruby "3.4.3" >> Gemfile
echo. >> Gemfile
echo gem "rails", "~> 6.1.0" >> Gemfile
echo gem "sqlite3", "~> 1.4" >> Gemfile
echo gem "puma", "~> 5.0" >> Gemfile
echo gem "sass-rails", ">= 6" >> Gemfile
echo gem "webpacker" >> Gemfile
echo gem "uglifier", ">= 1.3.0" >> Gemfile
echo gem "turbolinks", "~> 5" >> Gemfile
echo gem "jbuilder", "~> 2.7" >> Gemfile
echo. >> Gemfile
echo group :development, :test do >> Gemfile
echo.  gem "byebug", platforms: [:mri, :mingw, :x64_mingw] >> Gemfile
echo end >> Gemfile
echo. >> Gemfile
echo group :development do >> Gemfile
echo.  gem "web-console", ">= 4.1.0" >> Gemfile
echo.  gem "listen", "~> 3.3" >> Gemfile
echo.  gem "spring" >> Gemfile
echo.  gem "spring-watcher-listen", "~> 2.0.0" >> Gemfile
echo end >> Gemfile
echo. >> Gemfile
echo group :test do >> Gemfile
echo.  gem "capybara", ">= 3.26" >> Gemfile
echo.  gem "selenium-webdriver" >> Gemfile
echo.  gem "webdrivers" >> Gemfile
echo end >> Gemfile
echo. >> Gemfile
echo gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby] >> Gemfile

echo Gemfile corrigido e criado com sucesso na pasta backend!

echo =====================
echo Agora execute:
echo 1. bundle install
echo 2. $env:RAILS_ENV="production"; bundle exec rake assets:precompile (no PowerShell)
echo =====================
pause
