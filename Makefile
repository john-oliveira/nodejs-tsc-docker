build-up:
	docker compose -f docker-compose-dev.yaml up -d --build

up:
	docker compose -f docker-compose-dev.yaml up -d	
	
down:
	docker compose -f docker-compose-dev.yaml down

build-prod:
	docker build --target prod . -t johnoliveira/nodetsc:1.0.0

build-up-prod:build-prod
	docker compose -f docker-compose-prod.yaml up -d
	
down-prod:
	docker compose -f docker-compose-prod.yaml down
