namespace :composer do

    desc "Running Composer Install"
    task :install do
        on roles(:web) do
            within release_path do
                execute :composer, "install --no-dev --quiet --prefer-dist --optimize-autoloader"
            end
        end
    end

    desc 'Copy vendor directory from last release'
    task :vendor do
        on roles(:web) do
            puts ("--> Copy vendor folder from previous release")
            execute "vendorDir=#{current_path}/vendor; if [ -d $vendorDir ] || [ -h $vendorDir ]; then cp -a $vendorDir #{release_path}/vendor; fi;"
        end
    end
end