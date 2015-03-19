# config valid only for Capistrano 3.1
require 'capistrano-db-tasks'

lock '3.4.0'

set :application, 'hsstat'
set :repo_url, 'git@github.com:PeoneEr/hsstat.git'

set :deploy_to, '/home/deploy/hsstat'

set :rails_env, "production"
set :db_local_clean, true
set :db_remote_clean, true

set :user, 'deploy'

require 'net/ssh/proxy/command'
set :ssh_options, proxy: Net::SSH::Proxy::Command.new('ssh home -W %h:%p')

set :linked_files, %w{config/database.yml config/settings.yml config/newrelic.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after "deploy:updated", "newrelic:notice_deployment"
  after :finishing, 'deploy:cleanup'
  after "deploy", "deploy:migrate"

end
