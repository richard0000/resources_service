source 'https://rubygems.org'

# Use Sinatra DSL
gem 'sinatra'

# Use rubocop to ensure good syntax highlighting
gem 'rubocop', require: false

# Use this egm to leverage namepaces and other functionalities
gem 'sinatra-contrib'

# Use http-party to manage the HTTP requests
gem 'httparty'

# This gem will allow us to create tasks which we can run with commands
gem 'rake'

# Use redis for cache managing
gem 'redis'

# Let's schedule our tasks with 'whenever' gem
gem 'whenever', require: false

group :test do
  gem 'rack-test'
  gem 'rspec'
end

group :development do
  # Let's take advantage of rerun gem for hot-reload in development
  gem 'rerun'
end