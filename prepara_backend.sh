#!/bin/bash

echo "== Preparando estrutura do backend para deploy =="

mkdir -p backend

# Move arquivos essenciais
for f in Rakefile Gemfile Gemfile.lock config.ru; do
  if [ -f "$f" ]; then
    mv -f "$f" backend/
  fi
done

# Move pastas Rails
for d in app bin config db lib public; do
  if [ -d "$d" ]; then
    mv -f "$d" backend/
  fi
done

echo
echo "=== Conteúdo final da pasta backend: ==="
ls -lh backend

echo
echo "======================================="
echo "ATENÇÃO:"
echo "1. No Railway, ajuste o Root Directory para: backend"
echo "2. Confirme se todos os arquivos essenciais estão em backend"
echo "3. Depois rode (dentro da backend):"
echo "   bundle install"
echo "   RAILS_ENV=production bundle exec rake assets:precompile"
echo "======================================="
