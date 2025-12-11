https://www.udemy.com/course/docker-mastery/


``` bash
docker build -t <image-name> <directory-of-Dockerfile>

docker run <image-name>
-d - detach
-i - interactive
-t - tty
-p - Port mapping <host-port>:<container-port>
-v - volume mounting <volume-name/binding-location>:<container-location> 
-f - filename
--name - container name
```


https://spacelift.io/blog/docker-networking