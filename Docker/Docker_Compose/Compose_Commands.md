# Docker Compose Commands:

* For all other possible commands please execute below command:

`docker compose --help` 

```
Commands:
  build       Build or rebuild services
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  images      List images used by the created containers
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information

Run 'docker compose COMMAND --help' for more information on a command.
```



* Command Create and start containers of docker compose yaml
                    
      docker compose up -d

* Command to Stop and remove containers, networks of 
   docker compose yaml

      docker compose down

* Command to list the running docker compose images/projects

      docker compose ls

* Command to list the running containers of docker compose 

      docker compose ps 

* Command to list the running and stopped containers of docker compose

      docker compose ps -a

* Command to execute inside the running container of docker compose 

        docker compose exec -it spc /bin/sh

* Command to build docker compose 

        docker compose build

* Command to stop docker compose container

         docker compose stop

* Command to start docker compose container

         docker compose start