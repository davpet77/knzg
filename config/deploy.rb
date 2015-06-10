# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'keepnzgreen'
set :scm, :git
set :repo_url, 'git@github.com:/davpet77/knzg.git'
set :branch, "master"
set :pty, true
set :format, :pretty
set :deploy_to, '/home/rails'
set :user, "deploy"
#set :scm_passphrase, "woteva the pwd is"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
#set :keep_releases, 3
#default_run_options[:pty] = true

#server "128.199.124.158", :app, :web, :db, :primary => true


#########require "bundler/capistrano"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :linked_files, %w(config/database.yml)

set :rvm_type, :system

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

#after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"