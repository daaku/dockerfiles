build:
	@docker build -t daaku/dev .

rebuild:
	@docker build --no-cache -t daaku/dev .

create-home-volume:
	@docker create \
	  --volume=/home/naitik \
	  --name=daaku-home \
	  ubuntu:15.10 \
	  /bin/true

run:
	@docker run \
	  --name=daaku-dev \
	  --hostname=daaku-dev \
	  --detach \
	  --privileged \
	  --publish=666:22 \
	  --volumes-from=daaku-home \
	  --volume=/run/docker.sock:/run/docker.sock \
	  --volume=/run/shm:/run/shm \
	  daaku/dev

rmf:
	@docker rm -f daaku-dev

ssh-keys:
	@docker exec -it daaku-dev mkdir /home/naitik/.ssh
	@docker cp ~/.ssh/id_rsa.pub daaku-dev:/home/naitik/.ssh/authorized_keys
	@docker exec -it daaku-dev chown -R naitik:users /home/naitik

restart: rmf run
