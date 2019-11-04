namespace :yarn do

    desc "Running npm Install"
    task :install do
        on roles(:web) do
            within release_path do
                execute :yarn, "install"
                execute :yarn, "prod"
            end
        end
    end
end