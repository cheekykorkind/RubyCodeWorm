# RubyCodeWorm
docker-compose build --no-cache && docker-compose up -d 

docker system prune --volumes
docker image prune -a
docker rmi $(docker images -q) --force
docker exec ruby_code_worm ruby ./src/Tasks/script.rb
