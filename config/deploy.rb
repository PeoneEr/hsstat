# config valid only for Capistrano 3.1
require 'capistrano-db-tasks'

lock '3.2.1'

set :application, 'hsstat'
set :repo_url, 'git@github.com:PeoneEr/hsstat.git'

set :deploy_to, '/home/deploy/hsstat'

set :rails_env, "production"
#
#         # if you want to remove the local dump file after loading
set :db_local_clean, true
#
#                 # if you want to remove the dump file from the server after downloading
set :db_remote_clean, true

set :user, 'deploy'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
  after "deploy", "deploy:migrate"

end
