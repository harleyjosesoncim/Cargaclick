#!/bin/bash 
echo "=== Limpando banco, migrando e rodando servidor ===" 
bundle install 
rails db:drop db:create db:migrate 
rails s 
