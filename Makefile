COMPOSE_FILE=./srcs/docker-compose.yml

all: run

run :
	@echo "$(TAB)$(GREEN)building containers$(RESET)"
	@sudo mkdir -p /home/houazzan/data/wordpress
	@docker-compose -f $(COMPOSE_FILE) up -d --build > /dev/null

list:	
	@echo "$(TAB)$(GREEN)Listing all containers ... $(RESET)"
	 docker ps -a

list_volumes:
	@echo "$(TAB)$(GREEN)Listing volumes ... $(RESET)"
	docker volume ls

clean:
	@echo "$(TAB)$(RED)Stopping and deleting all $(RESET)"
	@sudo rm -rf /home/houazzan/data/wordpress
	@docker-compose -f $(COMPOSE_FILE) down -v --rmi local
    
.SILENT :
.PHONY : all run list list_volumes clean


RED = \033[0;31m
PURPLE = \033[0;35m
GREEN = \033[0;36m
RESET = \033[0m
YELLOW = \033[0;33m
BLUE = \033[0;34m
CHANGE = \033[0;35m
TAB = "\	"
