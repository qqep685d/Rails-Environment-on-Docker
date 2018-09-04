DOCKER_COMPOSE = docker-compose
RAILS = $(DOCKER_COMPOSE) run --rm web rails

new:
	@sh ./setup/setup.sh
destroy:
	@docker image prune -f
	@ls | grep -Ev 'setup' | grep -Ev 'Makefile' | xargs rm -fr

# コンテナ操作コマンド等
build:
	@$(DOCKER_COMPOSE) build
up:
	@$(DOCKER_COMPOSE) up
upd:
	@$(DOCKER_COMPOSE) up -d
down:
	@$(DOCKER_COMPOSE) down
restart:
	@$(DOCKER_COMPOSE) stop
	@$(DOCKER_COMPOSE) start
clean:
	@docker image prune -f

# railsコマンド
rc:
	@$(RAILS) console
rr:
	@$(RAILS) routes
rt:
	@$(RAILS) test

# dbコマンド
dbc:
	@$(RAILS) db:create
dbm:
	@$(RAILS) db:migrate
dbs:
	@$(RAILS) db:seed
