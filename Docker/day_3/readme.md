# Day 3 Tasks

## Docker Network
	
- Overview of the primary network drivers Docker
- Using docker network create, docker network ls, docker network inspect, and docker network rm
- How Docker assigns default DNS settings for container name resolution

## References
**Udemy Course 27 - 35**  
**Networking**
- Docker Networking - Basics, Network Types & Examples
  - https://spacelift.io/blog/docker-networking
 
**Extras:**
- Docker networking is CRAZY!! (you NEED to learn it)
  - https://youtu.be/bKFMS5C4CG0?si=7aPjGmvK-9xJU3Pz

``` bash
docker network create <network-name> -d <driver-type>
docker run ... --network <network-name> ... image

docker network connect <network-name> <container>
docker network disconnect <network-name> <container>

docker network rm <network-name>
docker network prune
```


## TASK 4

Create a Docker network (e.g., my_network).
Run three named Flask containers in the network.
Build an NGINX proxy image with custom config to route traffic to each Flask container.
Run and test the NGINX proxy to access each Flask app via unique URL paths.

``` BASH
cd task_4
docker network create my-network

docker build -t flask-server ./Flaskserver
docker build -t nginx-server ./Nginxserver

docker run -d --network my-network --name flask1 -e NAME="Flask1" flask-server
docker run -d --network my-network --name flask2 -e NAME="Flask2" flask-server
docker run -d --network my-network --name flask3 -e NAME="Flask3" flask-server

docker run -d --network my-network --name nginx1 -p 8080:80 nginx-server

```

## TASK 5

Set up two isolated Docker macvlan networks and deploy two containers (container1 and container2) — one on each network.
The containers should not communicate directly by default.
Then deploy a router container that connects both networks and enables controlled communication between pod1 and pod2.

``` bash
docker network create -d macvlan \
  --subnet=172.16.101.0/24 \
  --gateway=172.16.101.1 \
  -o parent=eth0 \
  macvlan-1

docker network create -d macvlan \
  --subnet=172.16.102.0/24 \
  --gateway=172.16.102.1 \
  -o parent=eth0 \
  macvlan-2


docker run -itd --name app1 --network macvlan-1 --ip 172.16.101.2 --cap-add=NET_ADMIN ubuntu
docker run -itd --name app2 --network macvlan-2 --ip 172.16.102.2 --cap-add=NET_ADMIN ubuntu

docker run -itd --name router --network macvlan-1 --ip 172.16.101.254 --privileged ubuntu
docker network connect --ip 172.16.102.254 macvlan-2 router


docker exec -it router bash
sysctl -w net.ipv4.ip_forward=1
sysctl net.ipv4.ip_forward


docker network connect bridge app1
docker exec -it app1 bash
apt update
apt install iproute2
apt install iputils-ping
ip route add 172.16.102.0/24 via 172.16.101.254
exit
docker network disconnect bridge app1

docker network connect bridge app2
docker exec -it app2 bash
apt update
apt install iproute2
apt install iputils-ping
ip route add 172.16.101.0/24 via 172.16.102.254
exit
docker network disconnect bridge app2

```


## Links 
- https://spacelift.io/blog/docker-networking
- https://stackoverflow.com/questions/74163703/nginx-path-based-routing
- https://chatgpt.com/share/690c5123-3260-800a-8541-43b1db2fc1d9