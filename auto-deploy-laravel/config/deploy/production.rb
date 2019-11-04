server "host-ssh", roles: %w{web}
role :web, %w{host-ssh}

# role :web, %w{ec2-user@Public DNS (IPv4)}
# server "ec2-user@Public DNS (IPv4)",
#    user: "ec2-user",
#    roles: %w{web},
#    ssh_options: {
#      user: "ec2-user", #overrides user setting above
#      keys: %w(ssh-key-pem),
#      auth_methods: %w(publickey)
#      # password: "please use keys"
#    }
