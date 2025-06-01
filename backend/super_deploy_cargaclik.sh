#!/bin/bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}== SUPER DEPLOY AUTOMÁTICO CARGACLIK ==${NC}"

# Checagem básica
command -v git >/dev/null 2>&1 || { echo -e "${RED}Git não está instalado!${NC}"; exit 1; }
command -v heroku >/dev/null 2>&1 || echo -e "${YELLOW}Heroku CLI não instalada (deploy Heroku será pulado).${NC}"
command -v netlify >/dev/null 2>&1 || echo -e "${YELLOW}Netlify CLI não instalada (deploy Netlify será pulado).${NC}"

# Ativa o ssh-agent e adiciona a chave
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa || { echo -e "${RED}Erro ao adicionar chave SSH. Gere uma com ssh-keygen!${NC}"; exit 1; }

# Testa conexão SSH com GitHub
echo -e "${CYAN}Testando SSH com GitHub...${NC}"
ssh -T git@github.com 2>&1 | tee /tmp/ssh_test.log
grep -q "successfully authenticated" /tmp/ssh_test.log
if [ $? -eq 0 ]; then
  echo -e "${GREEN}SSH com GitHub autenticado com sucesso!${NC}"
else
  echo -e "${RED}Falha na autenticação SSH! Verifique se id_rsa.pub está cadastrada no GitHub.${NC}"
  exit 1
fi

# Commit e push automáticos
if [[ -n $(git status --porcelain) ]]; then
  echo -e "${CYAN}Commitando e enviando para GitHub...${NC}"
  git add -A
  git commit -m "🚀 Deploy automático via SUPER DEPLOY"
  git push || { echo -e "${RED}Falha ao dar push no GitHub!${NC}"; exit 1; }
else
  echo -e "${YELLOW}Sem alterações para commitar.${NC}"
fi

# Deploy backend no Heroku
if command -v heroku >/dev/null 2>&1; then
  echo -e "${CYAN}Deploy backend no Heroku...${NC}"
  heroku git:remote -a cargaclick-backend
  git push heroku main || { echo -e "${RED}Push para Heroku falhou!${NC}"; exit 1; }
  echo -e "${CYAN}Rodando migrations...${NC}"
  heroku run rake db:migrate -a cargaclick-backend
fi

# Deploy landing no Netlify
if command -v netlify >/dev/null 2>&1; then
  if [ ! -d "docs_assets" ]; then
    echo -e "${RED}A pasta docs_assets não existe!${NC}"
    exit 1
  fi
  echo -e "${CYAN}Deploy landing/docs_assets no Netlify...${NC}"
  cd docs_assets
  netlify deploy --site 9b4478ee-4f1d-4eff-b502-68346efdfbb6 --prod --dir .
  if [[ $? -ne 0 ]]; then
    echo -e "${RED}Deploy Netlify falhou!${NC}"
    exit 1
  fi
  cd ..
fi

echo -e "${GREEN}SUPER DEPLOY FINALIZADO COM SUCESSO! 🚀${NC}"
