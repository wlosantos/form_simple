#!/bin/bash

# ::Adicionando bulma jquery fontawesome no projeto
# echo 'Adicionando bulma fontawesome ao projeto'
# yarn add bulma @fortawesome/fontawesome-free

# ::Remover arquivos desnecessários
echo 'Atuzalizando o arquivo manifest.js'
rm -rf .app/assets/config/manifest.js
cp $HOME/bootRails/arq/manifest.js app/assets/config/manifest.js

# ::Adicionando os arquivos as pastas
echo 'Atualizando o arquivo: environment.js'
cp $HOME/bootRails/arq/environment.js config/webpack/environment.js
sleep 3s

echo 'Atualizando os arquivos javascripts'
echo 'Atualizando o arquivo: application.js'
cp  $HOME/bootRails/arq/application.js app/javascript/packs/application.js
sleep 3s

echo 'Atualizando o arquivo: custom.js'
cp  $HOME/bootRails/arq/custom.js app/javascript/packs/custom.js
sleep 3s

echo 'Criando pasta e arquivos CSS'
mkdir app/javascript/src
sleep 3s

echo 'Adicionando webpacker.yml configurado para o CSS'
rm -rf ./config/webpacker.yml
cp $HOME/bootRails/arq/webpacker.yml config/webpacker.yml
sleep 3s

echo 'Atualizando o arquivo: application.scss'
rm -rf ./app/assets/stylesheets
cp $HOME/bootRails/arq/application.scss app/javascript/src/application.scss
sleep 3s

echo 'Atualizando o arquivo: custom.scss'
cp  $HOME/bootRails/arq/custom.scss app/javascript/src/custom.scss
sleep 3s

echo 'Copiando o favicon'
cp  $HOME/bootRails/arq/favicon.png app/assets/images/favicon.png
sleep 3s

echo 'Atualizando o arquivo: application.html.haml'
rm -rf ./app/views/layouts/application.html.erb
cp  $HOME/bootRails/arq/application.html.haml app/views/layouts/application.html.haml
sleep 3s

echo 'Adicionando os arquivos: gemfile|awesome_print|generator'
rm -rf ./Gemfile
cp $HOME/bootRails/arq/Gemfile Gemfile
sleep 3s
bundle install
rails g rspec:install
sleep 3s

echo 'Copiando arquivo de configuração rspec'
rm -rf ./spec/*
mkdir ./spec/support
cp $HOME/bootRails/spec/rails_helper.rb ./spec/rails_helper.rb
cp $HOME/bootRails/spec/spec_helper.rb ./spec/spec_helper.rb

cp $HOME/bootRails/spec/support/devise_request_spec_helpers.rb ./spec/support/devise_request_spec_helpers.rb
cp $HOME/bootRails/spec/support/request_spec_helper.rb ./spec/support/request_spec_helper.rb
cp $HOME/bootRails/spec/support/capybara_database_cleaner.rb ./spec/support/capybara_database_cleaner.rb

echo 'Adicionando o arquivo generators'
cp $HOME/bootRails/arq/generators.rb config/initializers/generators.rb

#Adicionando lib toastify-js
# echo 'Adicionar biblioteca toastify-js ? (y/n)'
# read option;
# if [ $option == 'y' ]
# then
#   echo 'Instalando toastify-js'
#   yarn add toastify-js

#   echo 'Atualizando o arquivo: application.html.haml'
#   rm -rf ./app/views/layouts/application.html.*
#   cp  $HOME/bootRails/lib/application.html.haml app/views/layouts/application.html.haml
#   sleep 3s

#   echo 'Atualizando o arquivo: application.js'
#   rm -rf ./app/javascript/packs/application.js
#   cp  $HOME/bootRails/lib/application.js app/javascript/packs/application.js
#   sleep 3s

#   echo 'Atualizando o arquivo: application.scss'
#   rm -rf ./app/javascript/src/application.scss
#   cp $HOME/bootRails/lib/application.scss app/javascript/src/application.scss
#   sleep 3s

#   echo 'Adicionando flashMessages.js (toastify - custum)'
#   cp  $HOME/bootRails/lib/flashMessages.js app/javascript/packs/flashMessages.js
#   sleep 3s
# fi

echo 'Iniciando o versionamento GIT'
git add .
git commit -m 'Initial commit'
sleep 3s

echo 'Arquivos atualizados com sucesso!!!'
