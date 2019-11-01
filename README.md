# auto-setup-deploy-aws-ami-1
auto-setup-deploy-aws-ami-1

# auto-setup
- install ansible : https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
- setup config in auto-setup/ansible.cfg
- ansible-playbook setup.yml

#auto-deploy
- install capistrano : https://capistranorb.com
- comment "append :linked_files, '.env'" in -> auto-deploy/deploy.rb
- cap production deploy
- ssh {server aws}
- cd /var/www/html/{project-name}/shared/ -> create .env file
- uncomment "append :linked_files, '.env'" in -> auto-deploy/deploy.rb
- cap production deploy