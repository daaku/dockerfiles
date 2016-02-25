build:
	@docker build -t daaku/dev .

rebuild:
	@docker pull ubuntu:15.10
	@docker build --no-cache -t daaku/dev .

create-home-volume:
	@docker create \
	  --volume=/home/naitik \
	  --name=naitik-home \
	  ubuntu:15.10 \
	  /bin/true

run:
	@docker run \
	  --name=naitik-dev \
	  --hostname=dev \
	  --detach \
	  --privileged \
	  --publish=666:22 \
	  --volumes-from=naitik-home \
	  --volume=/run/docker.sock:/run/docker.sock \
	  daaku/dev

rmf:
	@docker rm -f naitik-dev

ssh-keys:
	@docker exec -it naitik-dev mkdir /home/naitik/.ssh
	@docker cp ~/.ssh/id_rsa.pub naitik-dev:/home/naitik/.ssh/authorized_keys
	@docker exec -it naitik-dev chown -R naitik:users /home/naitik

restart: rmf run
