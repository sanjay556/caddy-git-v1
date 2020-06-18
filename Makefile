
this:
        docker run -d --name foo-bar-caddy -p 2015:2019 -v $(PWD)/Caddyfile:/etc/Caddyfile caddy-git

clean:
        docker rm -f foo-bar-caddy

logs:
        docker logs -f foo-bar-caddy

sh:
        docker exec -it foo-bar-caddy sh

ps:
        docker ps -a | grep foo-bar
