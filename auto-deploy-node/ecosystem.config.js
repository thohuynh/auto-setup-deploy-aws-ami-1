module.exports = {
  deploy : {
    production : {
      key  : "{link pem}", // link to pem server example : /home/user/server.pem
      user : 'ec2-user', // user of server
      host : '{ip public v4}', // ip public v4 server
      ref  : 'origin/master',
      repo : '{git repo}', //git repo example : git@github.com:github/project.git
      path : '/var/www/html/node-project', // path project in server
      'post-deploy' : 'yarn install && yarn build && pm2 reload dist/index.js'
    }
  }
}