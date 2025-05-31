# MIGRAÇÃO PARA SQLITE 
 
PASSOS: 
 
1. Substitua seu config/database.yml pelo deste patch. 
2. Substitua o Gemfile pelo incluso (ajuste ruby/rails se necessario). 
3. Rode migrate_and_run.bat (Windows) ou migrate_and_run.sh (Linux/Mac), ou manualmente: 
 
   bundle install 
   rails db:drop db:create db:migrate 
   rails s 
 
Seu projeto Rails agora está 100% com SQLite! 
 
OBS: O arquivo Gemfile.lock NÃO está incluso para evitar conflitos. Gere localmente. 
