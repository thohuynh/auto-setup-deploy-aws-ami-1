lock "~> 3.11.0"
set :application, "project-name"
set :repo_url, "git@github.com:thohuynh/test-s3-aws.git"
set :branch, ENV["branch"] || "master"
set :deploy_to, proc { "/var/www/html/project-name" }
require 'date'
set :current_time, DateTime.now
set :format, :airbrussh
set :format_options, command_output: true, log_file: 'logs/auto-deploy.log', color: :auto, truncate: :auto
set :pty, true
set :keep_releases, 3

SSHKit.config.command_map[:chmod] = "sudo chmod"
SSHKit.config.command_map[:chown] = "sudo chown"

#append linked_dirs and file
append :linked_files, '.env'
append :linked_dirs,
    'storage/app',
    'storage/framework/cache',
    'storage/framework/sessions',
    'storage/framework/views',
    'storage/framework/testing',
    'storage/logs'

#run task on lib/capistrano/tasks
namespace :deploy do

    before :finished, "composer:vendor"
    before :finished, "composer:install"
    before :finished, "laravel:permission"
    before :finished, "laravel:env_configure"
    before :finished, "yarn:install"

    after :finished, :cleanup
end