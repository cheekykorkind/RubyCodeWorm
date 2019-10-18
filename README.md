# RubyCodeWorm
docker-compose build --no-cache && docker-compose up -d

docker exec ruby_code_worm ruby ./src/Tasks/main.rb
docker exec -it ruby_code_worm ruby /bin/bash
docker attach ruby_code_worm
