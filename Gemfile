source 'https://rubygems.org'

# server environment
gem 'rails', '3.2.6'
gem 'thin', '1.3.1'
gem 'heroku'
gem 'omniauth-facebook'
gem 'eventmachine', '1.0.0.rc.4'

# rake gems
gem 'rake'
gem 'rack-cache', :require => 'rack/cache'

# database gems
gem 'pg_search'
gem 'bcrypt-ruby'
gem 'pg'

# image gems
gem 'paperclip', '3.0.4'
gem 'rmagick'

# misc
gem 'client_side_validations'
gem 'chronic'
gem 'validates_timeliness'
gem 'koala'
gem 'formtastic'
gem 'dragonfly', '~>0.9.12'

group :assets do
  gem 'bootstrap-sass'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # if you don't have a local JS runtime install nodejs or include rubyracer gem
  # gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
  gem 'jquery-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec'
  gem 'webrat'
  gem 'factory_girl_rails', '1.0'
end

group :production do
  gem 'newrelic_rpm'
  gem 'dynamic_form'
  gem 'unicorn'
end