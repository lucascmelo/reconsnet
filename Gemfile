source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

# UI/Web
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'font-awesome-rails'
gem 'autoprefixer-rails', '>= 5.2.1' # recommended for bootstrap-sass
gem 'bootstrap_form'
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
gem 'tinymce-rails-imageupload', '~> 4.0.0.beta'
gem 'kaminari' # will_paginate, rails 4.1 e pg_search não estavam funcionando bem juntos então a opção pelo kaminari
gem 'kaminari-bootstrap'

gem 'pry-rails', group: :development
gem 'annotate', group: :development
gem 'web-console', '~> 2.0', group: :development

gem 'turbolinks'
gem 'jquery-turbolinks'

gem 'pundit'
gem 'rolify'
gem 'devise'
gem 'paperclip', '~> 4.2'
gem 'paper_trail', '~> 4.0.0'

gem 'puma', '~> 2.15.3'

# mailchimp api wrapper
gem 'gibbon'

# Detecção de gênero baseada em nome
gem 'gendered', '~> 0.0.8'

# Para geração de arquivos em PDF
gem 'prawn'
gem 'prawn-table'

# Executor de jobs em 2o plano
gem 'sidekiq'
gem 'sinatra', :require => nil # para web do sidekiq

# Solução de Backup do BD em cloud
gem 'dumper'

# para manipulação de números de telefone
gem 'phony_rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'capybara'
  gem 'launchy' # for save_and_open_page
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.2'

