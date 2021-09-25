# create docker network
docker network create mongo-network

# start mongodb
docker run -p 27017:27017 -d \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  --name mongodb \
  --net mongo-network \
  mongo

# start mongo-express
docker run -p 8081:8081 -d \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
  -e ME_CONFIG_MONGODB_SERVER=mongodb \
  --name mongo-express \
  --net mongo-network \
  mongo-express

# logs mongo-express
docker logs mongo-express -f
