role :app, %w{#TODO サーバIP}
role :web, %w{#TODO サーバIP}
role :db,  %w{#TODO サーバIP}

server '#TODO サーバIP', user: '#TODO SSHユーザ名', port: #TODO SSHポート, roles: %w{web app db}

set :application, '#TODO アプリケーション名'
set :stage, :production
set :rails_env, 'production'

set :deploy_to, '#TODO デプロイ先ディレクトリ名'
set :branch, 'master'
set :log_level, :debug
