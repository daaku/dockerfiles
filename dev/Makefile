build:
	@docker build --no-cache -t daaku/dev .

run:
	@docker run \
	  --name=daaku-dev \
	  --hostname=daaku-dev \
	  --detach \
	  --privileged \
	  --publish=666:22 \
	  --volume=/home/naitik:/home/naitik \
	  --volume=/run/docker.sock:/run/docker.sock \
	  --volume=/run/shm:/run/shm \
	  daaku/dev

rmf:
	@docker rm -f daaku-dev

restart: rmf run
