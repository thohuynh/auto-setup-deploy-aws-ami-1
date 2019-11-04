namespace :laravel do

    task :permission do
        on roles(:web) do
            within release_path do
                execute :chmod, "-R a+rwx storage"
                execute :chmod, "-R a+rwx storage/logs"
                execute :chmod, "-R a+rwx bootstrap"
                execute :chmod, "-R ug+rwx bootstrap/cache"
                execute :chown, "-RH ec2-user:apache storage"
                execute :chown, "-RH ec2-user:apache storage/logs"
                execute :chown, "-RH ec2-user:apache bootstrap"
                execute :chown, "-RH ec2-user:apache bootstrap/cache"
            end
        end
    end

    task :env_configure do
        on roles (:web) do
            within release_path do
                execute :php, "artisan view:clear"
                execute :php, "artisan config:clear"
                execute :php, "artisan cache:clear"
                execute :php, "artisan config:cache"
            end
        end
    end
end