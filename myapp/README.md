# cor_prime python app

## local development using docker

docker build -t cor_prime_app:latest .

docker images        
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
cor_prime_app   latest    1ad1200cd235   21 seconds ago   1.46GB

docker run -d --name cor_prime_app -p 8080:8080 cor_prime_app:latest 

docker ps
CONTAINER ID   IMAGE                  COMMAND            CREATED         STATUS         PORTS                    NAMES
6d54c45c1c3e   cor_prime_app:latest   "python main.py"   3 seconds ago   Up 3 seconds   0.0.0.0:8080->8080/tcp   cor_prime_app

docker logs 6d54c45c1c3e
 * Serving Flask app 'main'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:8080
 * Running on http://172.17.0.2:8080

 curl http://127.0.0.1:8080          
{"message":"Hello, world!"}