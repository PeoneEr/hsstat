require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rvm'

require 'capistrano/deploytags'
require 'new_relic/recipes'
require 'capistrano/passenger'

set :rvm_type, :user
set :rvm_ruby_version, '2.1.5p273'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
