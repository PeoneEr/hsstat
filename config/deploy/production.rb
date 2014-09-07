role :app, %w{deploy@192.168.0.105}
role :web, %w{deploy@192.168.0.105}
role :db,  %w{deploy@192.168.0.105}

set :stage, :production
server '192.168.0.105', user: 'deploy', roles: %w{web app db}
