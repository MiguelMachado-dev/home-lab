SERVICES := jellyfin nextcloud

copy-env:
	@for service in $(SERVICES); do \
		cp .env $$service/; \
	done

up: copy-env
	@for service in $(SERVICES); do \
		docker-compose -f $$service/docker-compose.yml up -d; \
	done

down:
	@for service in $(SERVICES); do \
		docker-compose -f $$service/docker-compose.yml down; \
	done

.PHONY: copy-env up down