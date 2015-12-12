# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'dicoreonline'
set :repo_url, 'git@bitbucket.org:bolados-team/dicoreonline.git'
set :rails_env, fetch(:stage)
set :bundle_bins, fetch(:bundle_bins, []).push('foreman')
# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/dicoreonline/apps/dicoreonline"

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_path, "~/.rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_roles, :all

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

set :linked_dirs, fetch(:linked_dirs, []).push('public/assets')
set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('tmp/pids')
set :linked_dirs, fetch(:linked_dirs, []).push('tmp/cache')
set :linked_dirs, fetch(:linked_dirs, []).push('tmp/sockets')
set :linked_dirs, fetch(:linked_dirs, []).push('logs')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :server do

  desc "Start Server"
  task :start do
    on roles(:app) do |host|
      within "#{current_path}" do
        execute :bundle, :exec, 'puma -C config/puma.rb -d'
      end
    end
  end

  desc "Stop Server"
  task :stop do
    on roles(:app) do |host|
      execute "cd #{current_path} && cat ./shared/pids/puma.pid | xargs kill && rm ./shared/pids/*"
    end
  end

end

namespace :assets do
  task :precompile do
    run_locally do
        execute 'bundle exec rake assets:precompile RAILS_ENV=production'
        execute 'tar -czf assets.tar.gz ./public/assets/'
    end
    on roles(:app) do |host|
      upload!('./assets.tar.gz', "#{current_path}/")
      execute "rm -rf #{current_path}/public/assets/*"
      execute "tar -zxvf #{current_path}/assets.tar.gz -C #{current_path}"
      execute "rm #{current_path}/assets.tar.gz"
    end
    run_locally do
      execute 'rm -rf public/assets'
      execute 'rm assets.tar.gz'
    end
  end
end

namespace :foreman do
  set :foreman_application, "#{fetch(:application)}-#{fetch(:rails_env)}"
  set :user, 'dicoreonline'
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export do
    on roles(:app) do |host|
      execute "cd #{current_path} && rm -f .env"
      execute "cd #{current_path} && echo PATH=\"$HOME/.rbenv/shims:$PATH\" >> .env"
      execute "cd #{current_path} && echo RAILS_ENV=#{fetch(:rails_env)} >> .env"
      execute "cd #{current_path} && echo RACK_ENV=#{fetch(:rails_env)} >> .env"
      within "#{current_path}" do
        execute :rbenv, "sudo bundle exec foreman export upstart /etc/init -a #{fetch(:foreman_application)} -u #{fetch(:user)} -l #{shared_path}/log -d #{current_path}"
      end
    end
  end

  task :start do
    on roles(:app) do |host|
      sudo "start #{fetch(:foreman_application)}"
    end
  end

  task :stop do
    on roles(:app) do |host|
      sudo "stop #{fetch(:foreman_application)}"
    end
  end

  task :restart do
    on roles(:app) do |host|
      sudo "restart #{fetch(:foreman_application)}"
    end
  end

end

namespace :maintenance do
  task :activate do |t|
    on roles(:app) do |host|
      execute "cd #{current_path} && mv -f public/maintenance.html public/index.html"
    end
  end

  task :deactivate do |t|
    on roles(:app) do |host|
      execute "cd #{current_path} && mv -f public/index.html public/maintenance.html"
    end
  end
end


after :deploy, :finished do
  invoke 'assets:precompile'
  invoke 'deploy:migrate'
  invoke 'foreman:export'
  invoke 'foreman:restart'
end
