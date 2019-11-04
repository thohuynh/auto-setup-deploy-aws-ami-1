# auto-setup-deploy-aws-ami-1

# auto-setup-laravel
- install ansible : https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
- setup config in auto-setup-laravel/ansible.cfg
- setup eninverment : `ansible-playbook setup.yml`
- setup env : `ansible-playbook setup_env.yml`

#auto-deploy-laravel
- install capistrano : https://capistranorb.com
- comment "append :linked_files, '.env'" in -> auto-deploy/deploy.rb
- setup source : `cap production deploy`
- ssh {server aws}
- cd /var/www/html/{project-name}/shared/ -> create .env file
- uncomment "append :linked_files, '.env'" in -> auto-deploy/deploy.rb
- deploy : `cap production deploy`

#setup-virtual-host-laravel
- setup virtual host : `ansible-playbook setup-virtual-host.yml`

----------

# auto-setup-node
- install ansible : https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
- install pm2 :  https://pm2.keymetrics.io/docs/usage/pm2-doc-single-page
- setup config in ecosystem.config.js 
- setup config in auto-setup-node/ansible.cfg
- setup eninverment : `ansible-playbook setup.yml`
- setup env : `ansible-playbook setup_env.yml`
- setup server : `pm2 deploy ecosystem.config.js production setup`
#auto-deploy-node
- deploy server : `pm2 deploy ecosystem.config.js production --force`

