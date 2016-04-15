require 'rvm1/capistrano3'

lock '3.4.0'

set :application, '#TODO アプリケーション名'
set :repo_url, '#TODO gitリポジトリ名'
set :ssh_options, {
  keys: [File.expand_path('~/.ssh/id_rsa')],
  forward_agent: true
}
set :keep_releases, 5
set :rvm_type, :system
set :rvm1_ruby_version, '2.2.3@auburn'
set :scm, :git
set :linked_files, %w{config/database.yml config/application.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :bundle_binstubs, -> { shared_path.join('bin') }

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', release_path.join('tmp')
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end
