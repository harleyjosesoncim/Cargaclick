# Cria estrutura organizada
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\app\controllers"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\app\models"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\db\migrate"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\scripts"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\deploy"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\docker"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\docs"
New-Item -ItemType Directory -Force -Path "cargaclik_estruturado\.github\workflows"

# Cria arquivos base
Set-Content -Path "cargaclik_estruturado\README.md" -Value "# Projeto CargaClik"
Set-Content -Path "cargaclik_estruturado\Gemfile" -Value "source 'https://rubygems.org'\ngem 'rails'"
Set-Content -Path "cargaclik_estruturado\Rakefile" -Value "# Rakefile"
Set-Content -Path "cargaclik_estruturado\deploy\Procfile" -Value "web: bundle exec rails s -p \$PORT"
Set-Content -Path "cargaclik_estruturado\docker\docker-compose.yml" -Value "# docker-compose aqui"
Set-Content -Path "cargaclik_estruturado\.github\workflows\deploy.yml" -Value "# Workflow GitHub Actions"

# Cria o script BAT
Set-Content -Path "cargaclik_estruturado\organiza_projeto.bat" -Value "@echo off`n\
mkdir app\\controllers`n\
mkdir app\\models`n\
mkdir db\\migrate`n\
mkdir scripts`n\
mkdir deploy`n\
mkdir docker`n\
mkdir docs`n\
move PagamentosController.rb app\\controllers\\`n\
move CreateFretes.rb app\\models\\`n\
move 20250515165000_create_fretes.rb db\\migrate\\`n\
move *.bat scripts\\`n\
move *.sh scripts\\`n\
move *.ps1 scripts\\`n\
move CHECKLIST_DEPLOY.md docs\\`n\
move estrutura_frete.txt docs\\`n\
move valida_log_*.txt docs\\`n\
move Procfile deploy\\`n\
move railway.json deploy\\`n\
move docker-compose.rb docker\\`n\
echo Projeto reorganizado com sucesso.`n\
pause"

# Compacta
Compress-Archive -Path "cargaclik_estruturado" -DestinationPath "cargaclik_estruturado.zip"
Write-Host "ZIP gerado com sucesso em: cargaclik_estruturado.zip"

