# caddy-git

```
cat ~/Caddyfile
apps.myco.net  {
  tls off
  gzip
  root /home/deploy/www/apps.myco.net/public
  log /home/deploy/caddy_log/access.log
  errors /home/deploy/caddy_log/errors.log

  # caddy pull 
  git {
      repo git@github.com:myuser/apps.myco.git
      path /home/deploy/www/
      clone_args --recursive
      pull_args --recurse-submodules
      key /home/deploy/.ssh/id_rsa
      #then git submodule update --init --recursive
      hook /webhook {webhook secret fill in github}
      then hugo --destination=/home/deploy/www/apps.myco.net/public
      hook_type github
  }
}
```

